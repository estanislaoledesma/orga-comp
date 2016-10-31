#include <mips/regdef.h>
#include <sys/syscall.h>

#ifndef BUF_SZ
#define BUF_SZ 8192
#endif

#define BUF_SZOFFSET BUF_SZ
#define BUF_OFFSET 84 + BUF_SZ


#define FP0_OFFSET BUF_OFFSET + 4
#define FP1_OFFSET FP0_OFFSET + 4
#define FP2_OFFSET FP1_OFFSET + 4
#define FP3_OFFSET FP2_OFFSET + 4
#define FP4_OFFSET FP3_OFFSET + 4
#define FP5_OFFSET FP4_OFFSET + 4
#define FP6_OFFSET FP5_OFFSET + 4
#define FP7_OFFSET FP6_OFFSET + 4
#define FP8_OFFSET FP7_OFFSET + 4
#define FP9_OFFSET FP8_OFFSET + 4
#define FP10_OFFSET FP9_OFFSET + 4
#define FP11_OFFSET FP10_OFFSET + 4


#define SP_OFFSET FP11_OFFSET + 4
#define GP_OFFSET SP_OFFSET + 4        
#define FP_OFFSET GP_OFFSET + 4         
#define RA_OFFSET FP_OFFSET + 4       
#define STACK_SZ RA_OFFSET + 4




	.text
	.abicalls
	.align 2
	.globl 	mips32_plot
	.ent 	mips32_plot

mips32_plot:
	.frame 	$fp, STACK_SZ, ra
	
	.set 	noreorder
	.cpload t9
	.set 	reorder

	subu sp, sp, STACK_SZ 			# 4(SRA) + 15 + BUF_SZ (LTA) + 4 (ABA)
	
	.cprestore GP_OFFSET			#guardo gp en 80 + sp
	sw $fp, FP_OFFSET(sp)			#guardo $fp en 84 + sp
	sw ra, RA_OFFSET(sp)			#guardo ra en 88 + sp

	move $fp, sp 				#$fp = sp (desde aca se usa $fp)


	sw a0, STACK_SZ($fp)			#guardo el parametro(*parms) en la ABA de la funcion que me llamo
	
#
#	Guardo la data de *params en el stack local.
#

	lw t0, 0(a0)					
	sw t0, 16($fp)					#guardo UL_Re en 16 + $fp

	lw t0, 4(a0)
	sw t0, 20($fp)					#guardo UL_Im en 20 + $fp

	lw t0, 8(a0)
	sw t0, 24($fp)					#guardo LR_Re en 24 + $fp

	lw t0, 12(a0)
	sw t0, 28($fp)					#guardo LR_Im en 28 + $fp

	lw t0, 16(a0)
	sw t0, 32($fp)					#guardo D_Re en 32 + $fp

	lw t0, 20(a0)					
	sw t0, 36($fp)					#guardo D_Im en 36 + $fp

	lw t0, 24(a0)					
	sw t0, 40($fp)					#guardo CP_Re en 40 + $fp

	lw t0, 28(a0)					
	sw t0, 44($fp)					#guardo CP_Im en 44 + $fp

	lw t0, 32(a0)
	sw t0, 48($fp)					#guardo X_RES en 48 + $fp

	lw t0, 36(a0)
	sw t0, 52($fp)					#guardo Y_RES en 52 + $fp

	lw t0, 40(a0)
	sw t0, 56($fp)					#guardo SHADES en 56 + $fp

	lw t0, 44(a0)
	sw t0, 60($fp)					#guardo FILE POINTER en 60 + $fp

#
#	Guardo los registros flotantes que voy a usar para luego reestablecerlos.
#
	
	swc1 $f0, FP0_OFFSET($fp)
	swc1 $f1, FP1_OFFSET($fp)
	swc1 $f2, FP2_OFFSET($fp)
	swc1 $f3, FP3_OFFSET($fp)
	swc1 $f4, FP4_OFFSET($fp)
	swc1 $f5, FP5_OFFSET($fp)
	swc1 $f6, FP6_OFFSET($fp)
	swc1 $f7, FP7_OFFSET($fp)
	swc1 $f8, FP8_OFFSET($fp)
	swc1 $f9, FP9_OFFSET($fp)
	swc1 $f10, F10_OFFSET($fp)
	swc1 $f11, FP11_OFFSET($fp)

	lw $f6, 40($fp) #f6: cpr = parms->cp_re
	lw $f7, 44($fp) #f7: cpi = parms->cp_im


	li v0, SYS_write
	li a0, 2
	la a1, P2
	li a2, 3
	#syscall


	addu s0, $fp, BUF_OFFSET		#inicializo contador en s0 : BUF_OFFSET (hay que ir sumando de a 4, hasta BUF_OFFSET + BUF_SZ)

	lw t0, 32(a0)					#t0: x_res
	sw t0, (s0)						#guardo t0 en buffer
	addu s0, s0, 4					#incremento contador
	lw t1, 36(a0)					#t1: y_res
	sw t1, (s0)						#guardo t1 en buffer
	addu s0, s0, 4					#incremento contador
	lw t2, 40(a0)					#t2: shades
	sw t2, (s0)						#guardo t2 en buffer
	addu s0, s0, 4					#incremento contador

	j print

print:
	lw t0, 44(a0)
	move a0, t0 					#fd -> a0 para open en modo escritura
	addu s0, $fp, BUF_OFFSET 		#vuelvo a inicializar el contador				
	move a1, s0						#abierto para escritura (0 para letura, 1 para escritura)
	li a2, BUF_SZ					#modo ignorado 
	li v0, 1 						#Para abrir el archivo
	syscall 						#detalles: http://courses.missouristate.edu/KenVollmar/mars/Help/SyscallHelp.html
	move s6, v0 					#para guardar el fd

#	Inicializaciones para el primer for
	addu s1, zero, zero #s1: y = 0
	lw $f0, 20($fp) #f0: ci = parms->UL_Im
	lw t1, 52(a0) #t1: parms-> y_res


for1:
	bgte s1, t1, fin #si y >= y_res => fin_for1

#	Inicializaciones para el segundo for
	addu s2, zero, zero #s2: x = 0
	lw $f1, 16($fp) #f1: cr = parms->UL_Re
	lw t2, 48($fp) #t2: parms-> x_res

for2:
	bgte s2, t2, fin_for2 #si x >= x_res => fin_for1
	mov.s $f2, $f1 #f2: zr = cr
	mov.s $f3, $f2 #f3: zi = ci

#	Inicializaciones para el tercer for
	addu s3, zero, zero #s3: c = 0
	lw t3, 56($fp) #t3: parms->shades

for3:
	bgte s3, t3, fin_for2 #si c >= shades => fin_for2
	mul.s $f4, $f2, $f2 #f4: zr * zr
	mul.s $f5, $f3, $f3 #f5: zi * zi
	add.s $f4, $f4, $f5 #f4: absz = zr * zr + zi * zi
	lwc1 $f5, CTE_FOR3 #f5 = CTE_FOR3
	bgt $f4, $f5, fin_for2 #si absz > CTE_FOR3 => fin_for2
	mul.s $f4, $f2, $f2 #f4: zr * zr
	mul.s $f5, $f3, $f3 #f5: zi * zi
	sub.s $f4, $f4, $f5 #f4: zr * zr - zi * zi
	add.s $f4, $f4, $f6 #f4: sr = zr * zr - zi * zi + cpr
	mul.s $f5, $f2, $f3 #f5: zr * zi
	lwc1 $f8, CTE_MULT #f8: CTE_MULT
	mul.s $f5, $f5, $f8 #f5: 2 * zr * zi
	add.s $f5, $f5, $f7 #f5: si = 2 * zr * zi + cpi
	mov.s $f2, $f4 #f2: zr = sr
	mov.s $f3, $f5 #f3: zi = si
	addi s3, s3, 1 #s3: ++c
	b for3
fin_for2:
#	Segundo if
	addi s2, s2, 1 #s2: ++x
	lwc1 $f8, 32($fp) #f8: parms->d_re
	add.s $f1, $f1, $f8 #f1: cr += parms->d_re
	b for2 #vuelve a for2
fin_for1:
	addi s1, s1, 1 #s1: ++y
	lwc1 $f8, 36($fp) #f8: parms->d_im
	add.s $f0, $f0, $f8 #f0: ci += parms->d_im
	b for1 #vuelve a for1

fin:
#	Restauro valores de los registros de floating point
	lwc1 $f0, FP0_OFFSET($fp)
	lwc1 $f1, FP1_OFFSET($fp)
	lwc1 $f2, FP2_OFFSET($fp)
	lwc1 $f3, FP3_OFFSET($fp)
	lwc1 $f4, FP4_OFFSET($fp)
	lwc1 $f5, FP5_OFFSET($fp)
	lwc1 $f6, FP6_OFFSET($fp)
	lwc1 $f7, FP7_OFFSET($fp)
	lwc1 $f8, FP8_OFFSET($fp)
	lwc1 $f9, FP9_OFFSET($fp)
	lwc1 $f10, F10_OFFSET($fp)
	lwc1 $f11, FP11_OFFSET($fp)

	move sp, $fp 					#restauro valor de sp
	lw ra, RA_OFFSET(sp)			#restauro valor de ra
	lw $fp, FP_OFFSET(sp)			#restauro valor de $fp

	addu sp, sp, STACK_SZ			#subo stack pointer

	j ra 							#vuelvo a la funcion caller

	.end mips32_plot

.data
P2:       .asciiz "P2\n" 
CTE_FOR3: .float 4.0
CTE_MULT: .float 2


