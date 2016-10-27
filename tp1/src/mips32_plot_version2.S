#include <mips/regdef.h>
#include <sys/syscall.h>

#ifndef BUF_SZ 8192
#define BUF_SZ 8192
#endif

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

	li a0, t0 #fd -> a0 para syscall
	li a1, BUF_OFFSET($fp) #estas dos instrucciones las encontré en el grupo pero todavía no le agarro muy bien la mano
	li a2, BUF_SZOFFSET($fp) #verificar cómo se hace esto 
	li v0, SYS_write
	syscall

	.end


