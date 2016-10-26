#include <mips/regdef.h>
#include <sys/syscall.h>

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

	subu sp, sp, 96 # 4(SRA) + 15 (LTA) + 5 (ABA)
	
	.cprestore 80	#guardo gp en 80 + sp
	sw $fp, 84(sp)	#guardo $fp en 84 + sp
	sw ra, 88(sp)	#guardo ra en 88 + sp

	move $fp, sp 	#$fp = sp (desde aca se usa $fp)


	sw a0, 96($fp)	#guardo el parametro(*parms) en la ABA de la funcion que me llamo

	lw t0, 24(a0)	#t0: cpr= parms->cp_re;
	sw t0, 28($fp)	#guardo cpr en 28 + $fp

	lw t0, 28(a0)	#t0: cpi= parms->cp_im;
	sw t0, 24($fp)	#guardo cpi en 24 + $fp

	lw t0, 44(a0)	#t0: fd = parms->fd
	sw t0, 20($fp)	#guardo fd en 20 + $fp


	.end

