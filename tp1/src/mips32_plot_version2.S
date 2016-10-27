#include <mips/regdef.h>
#include <sys/syscall.h>

#ifndef BUF_SZ
#define BUF_SZ 8192
#endif

#define BUF_SZOFFSET BUF_SZ * 4
#define BUF_OFFSET 72
#define SP_OFFSET BUF_OFFSET + BUF_SZ * 4
#define GP_OFFSET SP_OFFSET + 4
#define FP_OFFSET GP_OFFSET + 4
#define RA_OFFSET GP_OFFSET + 4
#define STACK_SZ RA_OFFSET + 4


	.text
	.abicalls
	.align 2
	.globl 	mips32_plot
	.ent 	mips32_plot

mips32_plot:
	.frame 	$fp, 92, ra
	
	.set 	noreorder
	.cpload t9
	.set 	reorder

	subu sp, sp, STACK_SZ # 4(SRA) + 15 + BUF_SZ (LTA) + 4 (ABA)
	
	.cprestore GP_OFFSET	#guardo gp en 80 + sp
	sw $fp, FP_OFFSET(sp)	#guardo $fp en 84 + sp
	sw ra, RA_OFFSET(sp)	#guardo ra en 88 + sp

	move $fp, sp 	#$fp = sp (desde aca se usa $fp)


	sw a0, STACK_SZ($fp)	#guardo el parametro(*parms) en la ABA de la funcion que me llamo

	lw t0, 24(a0)	#t0: cpr= parms->cp_re;
	sw t0, 28($fp)	#guardo cpr en 28 + $fp

	lw t0, 28(a0)	#t0: cpi= parms->cp_im;
	sw t0, 24($fp)	#guardo cpi en 24 + $fp

	lw t0, 44(a0)	#t0: fd = parms->fd
	sw t0, 20($fp)	#guardo fd en 20 + $fp

	move a0, t0 #fd -> a0 para open en modo escritura
	li a1, 1 #abierto para escritura (0 para letura, 1 para escritura)
	li a2, 0 #modo ignorado 
	li v0, 13 #Para abrir el archivo
	syscall #detalles: http://courses.missouristate.edu/KenVollmar/mars/Help/SyscallHelp.html
	move s6, v0 #para guardar el fd

	.end mips32_plot


