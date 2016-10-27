#include <mips/regdef.h>
#include <sys/syscall.h>

#ifndef BUF_SZ 
#define BUF_SZ 8192
#endif

	.abicalls
	.text
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

	lw t1, 28(a0)	#t1: cpi= parms->cp_im; 
	sw t1, 24($fp)	#guardo cpi en 24 + $fp

	lw t2, 44(a0)	#t2: fd = parms->fd
	sw t2, 20($fp)	#guardo fd en 20 + $fp

	la a1, hola_mundo #estas dos instrucciones las encontré en el grupo pero todavía no le agarro muy bien la mano
	move a0, t2 	#fd -> a0 para syscall
 	li a2, 6  		#verificar cómo se hace esto 
 	li v0, SYS_write
 	syscall




	move sp, $fp	#recupero valor de sp
	lw ra, 88(sp)	#recupero valor de ra
	lw $fp, 84(sp)	#recupero valor de $fp

	addu sp, sp, 96	#subo stack

	j ra 			#vuelvo a la funcion caller

	.end mips32_plot

	.rdata
	.align	2
hola_mundo:
	.ascii	"Hola\n\0"
	




