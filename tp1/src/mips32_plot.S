#include <mips/regdef.h>
#include <sys/syscall.h>

#ifndef BUF_SZ
#define BUF_SZ 8192
#endif

	.text
	.abicalls
	.align 2
	.globl 	mips32_plot
	.ent 	mips32_plot

mips32_plot:
	.frame 	$fp, 144, ra
	
	.set 	noreorder
	.cpload t9
	.set 	reorder

	subu sp, sp, 144 				# 32(SRA) + 80 (LTA) + 32 (ABA)
	
	.cprestore 132					#guardo gp en 132 + sp
	sw $fp, 136(sp)					#guardo $fp en 136 + sp
	sw ra, 140(sp)					#guardo ra en 140 + sp

	move $fp, sp 					#$fp = sp (desde aca se usa $fp)


	sw a0, 144($fp)			#guardo el parametro(*parms) en la ABA de la funcion que me llamo
	
#
#	Guardo la data de *params en el stack local.
#

	lw t0, 0(a0)					
	sw t0, 32($fp)					#guardo UL_Re en 32 + $fp

	lw t0, 4(a0)
	sw t0, 36($fp)					#guardo UL_Im en 36 + $fp

	lw t0, 8(a0)
	sw t0, 40($fp)					#guardo LR_Re en 40 + $fp

	lw t0, 12(a0)
	sw t0, 44($fp)					#guardo LR_Im en 44 + $fp

	lw t0, 16(a0)
	sw t0, 48($fp)					#guardo D_Re en 48 + $fp

	lw t0, 20(a0)					
	sw t0, 52($fp)					#guardo D_Im en 52 + $fp

	lw t0, 24(a0)					
	sw t0, 56($fp)					#guardo CP_Re en 56 + $fp

	lw t0, 28(a0)					
	sw t0, 60($fp)					#guardo CP_Im en 60 + $fp

	lw t0, 32(a0)
	sw t0, 64($fp)					#guardo X_RES en 64 + $fp

	lw t0, 36(a0)
	sw t0, 68($fp)					#guardo Y_RES en 68 + $fp

	lw t0, 40(a0)
	sw t0, 72($fp)					#guardo SHADES en 72 + $fp

	lw t0, 44(a0)
	sw t0, 76($fp)					#guardo FILEDESCRIPTOR en 76 + $fp

	sw s1, 116($fp)					#guardo s1 en 116 + $fp				
	sw s2, 120($fp)					#guardo s1 en 120 + $fp	
	sw s3, 124($fp)					#guardo s1 en 124 + $fp	

#
#	Guardo los registros flotantes y caller saved registers que voy a usar para luego reestablecerlos.
#
error:					#Si vuelvo de error restauro todo, en v0 ya hay valor negativo representando error

	sw s1, 116($fp)				
	sw s2, 120($fp)
	sw s3, 124($fp)

	l.s $f6, 56($fp) 				#f6: cpr = parms->cp_re
	l.s $f7, 60($fp) 				#f7: cpi = parms->cp_im

	sw zero, 80($fp)				#inicializo el BUF_PTR

###############################################
###############################################

	lw a0, 76($fp) 					#a0 = FILEDESCRIPTOR
	la a1, buffer 					#a1 = BUF_LOW_OFFSET
	lw a2, 80($fp)					#a2 = BUF_PTR
	lw a3, 64($fp)					#a3 = X_RES
	lw t0, 68($fp)					#t0 = Y_RES
	sw t0, 16($fp)					#a4 = Y_RES
	lw t0, 72($fp)					#t0 = shades
	sw t0, 20($fp)					#a5 = shades

	jal print_header

	sw v0, 80($fp)					#BUF_PTR = v0

	#Inicializaciones para el primer for

	addu s1, zero, zero 			#s1: y = 0
	l.s $f0, 36($fp) 				#f0: ci = parms->UL_Im
	lw t1, 68($fp) 					#t1: parms-> y_res


for1:
	bge s1, t1, fin 				#si y >= y_res => fin

	#Inicializaciones para el segundo for

	addu s2, zero, zero 			#s2: x = 0
	l.s $f1, 32($fp) 				#f1: cr = parms->UL_Re
	lw t2, 64($fp) 					#t2: parms-> x_res

for2:
	bge s2, t2, fin_for1 			#si x >= x_res => fin_for1
	mov.s $f2, $f1 					#f2: zr = cr
	mov.s $f3, $f0 					#f3: zi = ci

	#Inicializaciones para el tercer for

	addu s3, zero, zero 			#s3: c = 0
	lw t3, 72($fp) 					#t3: parms->shades

for3:
	bge s3, t3, fin_for2 			#si c >= shades => fin_for2
	mul.s $f4, $f2, $f2 			#f4: zr * zr
	mul.s $f5, $f3, $f3 			#f5: zi * zi
	add.s $f4, $f4, $f5 			#f4: absz = zr * zr + zi * zi
	l.s $f5, CTE_FOR3 				#f5 = CTE_FOR3
	c.lt.s $f5, $f4  				#si CTE_FOR3 < absz => code = 1
	bc1t fin_for2 					#si code = 1 => fin_for2
	mul.s $f4, $f2, $f2 			#f4: zr * zr
	mul.s $f5, $f3, $f3 			#f5: zi * zi
	sub.s $f4, $f4, $f5 			#f4: zr * zr - zi * zi
	add.s $f4, $f4, $f6 			#f4: sr = zr * zr - zi * zi + cpr
	mul.s $f5, $f2, $f3 			#f5: zr * zi
	l.s $f8, CTE_MULT 				#f8: CTE_MULT
	mul.s $f5, $f5, $f8 			#f5: 2 * zr * zi
	add.s $f5, $f5, $f7 			#f5: si = 2 * zr * zi + cpi
	mov.s $f2, $f4 					#f2: zr = sr
	mov.s $f3, $f5 					#f3: zi = si
	addi s3, s3, 1 					#s3: ++c
	b for3

fin_for2:

	sw s1, 116($fp)
	sw s2, 120($fp)
	sw s3, 124($fp)  	### ESTOS SON LOS REGISTROS QUE USA EL CICLO
	sw t1, 92($fp) 		###tienen lugares especiales en el stack si necesitas guardar otro hay que hacer mas lugar y cambiar el excel y los defines
	sw t2, 96($fp)
	sw t3, 100($fp)
	

	move a0, s3 					#a0 = shade
	lw a1, 76($fp)					#a1 = FILEDESCRIPTOR
	la a2, buffer 					#a2 = BUF_LOW_OFFSET
	lw a3, 80($fp)					#a3 = BUF_PTR

	jal shade_a_buffer

	sw v0, 80($fp)					#BUF_PTR = v0


	addi s2, s2, 1 					#s2: ++x
	l.s $f8, 48($fp)				#f8: parms->d_re
	add.s $f1, $f1, $f8 			#f1: cr += parms->d_re
	b for2 							#vuelve a for2

fin_for1:
	addi s1, s1, 1 					#s1: ++y
	l.s $f8, 52($fp) 				#f8: parms->d_im
	sub.s $f0, $f0, $f8 			#f0: ci -= parms->d_im
	b for1 							#vuelve a for1


							

	

fin:
#Antes de terminar, flusheo lo que queda en el buffer

	lw a0, 76($fp)					#a0 = FILEDESCRIPTOR
	la a1, buffer 					#a1 = BUF_LOW_OFFSET
	lw a2, 80($fp)					#Establezco en a2 la cantidad a flushear: Lo que queda en el buffer = BUF_PTR = 64($fp)
	jal flush_buffer
	#Reestablezco los registros flotantes y caller saved registers a sus valores originales

	lw s1, 116($fp)
	lw s2, 120($fp)
	lw s3, 124($fp)

	move sp, $fp 					#restauro valor de sp
	lw ra, 140(sp)					#restauro valor de ra
	lw gp, 132(sp)					#restauro valor de gp
	lw $fp, 136(sp)					#restauro valor de $fp

	addu sp, sp, 144				#subo stack pointer

	jr ra 							#vuelvo a la funcion caller


###############################################
###############################################

#Int to String: el int va en a0, cantidad de chars guardados en v0

inttostr:

	.frame 	$fp, 16, ra
	
	.set 	noreorder
	.cpload t9
	.set 	reorder

	subu sp, sp, 16 				# 16(SRA)
	
	.cprestore 4					#guardo gp en 4 + sp
	sw $fp, 8(sp)					#guardo $fp en 8 + sp
	sw ra, 12(sp)					#guardo ra en 12 + sp

	move $fp, sp 					#$fp = sp (desde aca se usa $fp)

	sw a0, 16($fp)					#int = 16 + $fp

	addi t0, zero, 10		#establezco divisor base 10
	move t1, zero			#t1=0
	la t2, stringbuffer		#t2=stringbufferadress
	add t3, a0, zero		#t3=a0 (int a imprimir)

loop1:	div t3, t0			#t3/10 division:t4 resto:t5
	mflo t4
	mfhi t5
	addi t1, t1, 1			#aumento contador de caracteres
	bne  t3, 0, loop1		#cuando la division sea 0 ya termino el loop
	add t3, a0, zero		#t3=a0 (int a imprimir)
	move v0, t1			#v0=cant chars guardados

loop2:	div t3, t0			#vuelvo a divir esta vez guardando en el inicio de stringbuffer de atras para adelante
	mflo t4
	mfhi t5
	addi t1, t1, -1			#decremento el contador de chars
	add t6, t2, t1			#t6=offset en string buffer = stringbuffer + t1
	addi t5, t5, 48			#le sumo 48 al valor del resto para que quede en la escala de los decimales ascii
	sb t5, 0(t6)			#lo guardo en t6
	bne t3, 0, loop2		#cuando la division sea 0 ya temrino el loop

#Restauro saved registers
	
	move sp, $fp 			#restauro valor de sp

	lw gp, 4(sp)			#restauro valor de gp
	lw ra, 12(sp)			#restauro valor de ra
	lw $fp, 8(sp)			#restauro valor de $fp

	addu sp, sp, 16			#subo stack pointer

	jr ra 					#vuelvo a la funcion caller

###############################################

#Shade a buffer: Escribe el int en a0 al buffer, si el buffer se llena se flushea. a1 es  el file descriptor, a2 es
#$fp + BUF_LOW_OFFSET y a3 es BUF_PTR. v0 es BUF_PTR 

shade_a_buffer:

	.frame 	$fp, 64, ra
	
	.set 	noreorder
	.cpload t9
	.set 	reorder

	subu sp, sp, 64 				# 32(SRA) + 16 (LTA) + 16 (ABA)
	
	.cprestore 52					#guardo gp en 52 + sp
	sw $fp, 56(sp)					#guardo $fp en 56 + sp
	sw ra, 60(sp)					#guardo ra en 60 + sp

	move $fp, sp 					#$fp = sp (desde aca se usa $fp)

	sw s0, 16($fp)					#guardo s0 en 16 + $fp				
	sw s1, 20($fp)					#guardo s1 en 20 + $fp	
	sw s2, 24($fp)					#guardo s2 en 24 + $fp
	sw s3, 28($fp)					#guardo s3 en 28 + $fp				
	sw s4, 32($fp)					#guardo s4 en 32 + $fp	
	sw s5, 36($fp)					#guardo s5 en 36 + $fp
	sw s6, 40($fp)					#guardo s6 en 40 + $fp				
	sw s7, 44($fp)					#guardo s7 en 44 + $fp		

	sw a0, 64($fp)					#shade = 64 + $fp
	sw a1, 68($fp)					#FILEDESCRIPTOR = 68 + $fp
	sw a2, 72($fp)					#BUF_LOW_OFFSET = 72 + $fp
	sw a3, 76($fp)					#BUF_PTR = 76 + $fp

	move s0, a2						#s0 = BUF_LOW_OFFSET
	move s1, a3						#Cargo a s1 el BUF_PTR
	add s5, s0, s1					#s5 = BUFFER_LOW + BUF_PTR

	jal inttostr					#llamo a inttostr
	lw a0, 64($fp)					#Restablezco a0

	move s2, v0
	
	move s6, zero					#s6 = 0
	la s7, stringbuffer				#s7 = stringbufferadress

loop:	add s4, s7, s6				#s4 = stringbufferadress + s6
	addi s6, s6, 1					#s6 = s6 + 1 

	lb t2, 0(s4)					#guardo el primer byte del int de dir(s4) en t2
	sb t2, 0(s5)					#lo guardo en s5

	addi s1, s1, 1					#incremento BUF_PTR
	addi s5, s5, 1					#incremento el puntero al buffer
	bne s1, BUF_SZ, next 			#si BUF_PTR no es igual a BUF_SZ NO flusheo

	move a0, a1						#a0 = FILEDESCRIPTOR
	move a1, a2						#a1 = BUF_LOW_OFFSET
	li a2, BUF_SZ					#Establezco la cantidad a flushear (todo)
	move a3, s1 					#a3 = BUF_PTR
	jal flush_buffer
	lw a0, 64($fp)					#Restablezco parámetros
	lw a1, 68($fp)					
	lw a2, 72($fp)
	lw a3, 76($fp)

	addi s1, zero, 0 				#flushee, entonces reseteo el buffptr
	add s5, s0, zero				#reseteo el puntero al buffer	
next:	
	addi s2, s2, -1					#decremento la cantidad de chars guardados en el buffer
	bne  s2, 0, loop  				#si la cantidad de chars es != 0 loopeo

	addi t4, zero, 10				#asci code new line
	sb t4, 0(s5)	
	
	addi s1, s1, 1					#incremento BUF_PTR
	addi s5, s5, 1					#incremento el puntero al buffer		#guardo new line
	bne s1, BUF_SZ, next2 			#si BUF_PTR no es igual a BUF_SZ NO flusheo


	move a0, a1						#a0 = FILEDESCRIPTOR
	move a1, a2						#a1 = BUF_LOW_OFFSET
	li a2, BUF_SZ					#Establezco la cantidad a flushear (todo)
	move a3, s1 					#a3 = BUF_PTR
	jal flush_buffer
	lw a0, 64($fp)					#Restablezco parámetros
	lw a1, 68($fp)					
	lw a2, 72($fp)
	lw a3, 76($fp)

	addi s1, zero, 0 				#flushee, entonces reseteo el buffptr
	add s5, s0, zero				#reseteo el puntero al buffer	
	b fin_shade

next2:	move v0, s1 				#Devuelvo BUF_PTR

fin_shade:

	#Restablezco saved registers

	lw s0, 16($fp)					#s0 = 16 + $fp				
	lw s1, 20($fp)					#s1 = 20 + $fp	
	lw s2, 24($fp)					#s2 = 24 + $fp
	lw s3, 28($fp)					#s3 = 28 + $fp				
	lw s4, 32($fp)					#s4 = 32 + $fp	
	lw s5, 36($fp)					#s5 = 36 + $fp
	lw s6, 40($fp)					#s6 = 40 + $fp				
	lw s7, 44($fp)					#s7 = 44 + $fp		
	
	move sp, $fp 					#restauro valor de sp

	lw gp, 52(sp)					#restauro valor de gp
	lw ra, 60(sp)					#restauro valor de ra
	lw $fp, 56(sp)					#restauro valor de $fp

	addu sp, sp, 64					#subo stack pointer

	jr ra 							#vuelvo a la funcion caller



###############################################

#Flush Buffer: flushea el buffer en su totalidad al File descriptor en a0, a1 es
#BUF_LOW_OFFSET, a2 la cantidad de bytes a flushear. v0 es BUF_PTR

flush_buffer:

	.frame 	$fp, 16, ra
	
	.set 	noreorder
	.cpload t9
	.set 	reorder

	subu sp, sp, 16 				# 16(SRA)
	
	.cprestore 4					#guardo gp en 4 + sp
	sw $fp, 8(sp)					#guardo $fp en 8 + sp
	sw ra, 12(sp)					#guardo ra en 12 + sp

	move $fp, sp 					#$fp = sp (desde aca se usa $fp)

	sw a0, 16($fp)					#FILEDESCRIPTOR = 16 + $fp
	sw a1, 20($fp)					#BUF_LOW_OFFSET =20 + $fp
	sw a2, 24($fp)					#cantidead de bytes = 24 + $fp


	li v0, SYS_write 				#cargo la instrucción para escribir en v0

	syscall

	blt v0, zero, error				#si v0 < 0 go to error

	move v0, zero 					#v0 = 0

#Restauro saved registers
	
	move sp, $fp 			#restauro valor de sp

	lw gp, 4(sp)			#restauro valor de gp
	lw ra, 12(sp)			#restauro valor de ra
	lw $fp, 8(sp)			#restauro valor de $fp

	addu sp, sp, 16			#subo stack pointer

	jr ra 					#vuelvo a la funcion caller


###############################################

#Print header: Imprime los datos del encabezado de la imagen. En a0 file descriptor, a1 BUF_LOW_OFFSET, a2 BUF_PTR
#a3 x_res, a4 y_res y a5 shades (estos últimos dos posiciones en ABA de caller 16($fp) y 20($fp), respectivamente).
#v0 es BUF_PTR
	
print_header:

	.frame 	$fp, 64, ra
	
	.set 	noreorder
	.cpload t9
	.set 	reorder

	subu sp, sp, 64 				# 32(SRA) + 16 (LTA) + 16 (ABA)
	
	.cprestore 52					#guardo gp en 52 + sp
	sw $fp, 56(sp)					#guardo $fp en 56 + sp
	sw ra, 60(sp)					#guardo ra en 60 + sp

	move $fp, sp 					#$fp = sp (desde aca se usa $fp)

	sw s1, 32($fp)					#guardo s0 en 32 + $fp				
	sw s2, 36($fp)					#guardo s6 en 36 + $fp	
	sw s3, 40($fp)					#guardo s7 en 40 + $fp	

	sw a0, 64($fp)					#FILEDESCRIPTOR = 64 + $fp
	sw a1, 68($fp)					#BUF_LOW_OFFSET = 68 + $fp
	sw a2, 72($fp)					#BUF_PTR = 72 + $fp
	sw a3, 76($fp)					#X_RES = 76 + $fp


	move s6, a2				#s6 = BUF_PTR
	move s0, a1				#s0 = BUF_LOW_OFFSET
	add s6, s6, s0   		#s6 = BUFFER_LOW + BUF_PTR
	addi t0, zero, 80		#80 = 'P'
	sb t0, 0(s6) 			#'P' en buffer
	addi s6, s6, 1 			#s6++
	addi t0, zero, 50		#50 = '2'
	sb t0, 0(s6)			#'2' en buffer
	addi s6, s6, 1 			#s6++
	addi t0, zero, 10		#10 = '\n'
	sb t0, 0(s6) 			#'\n' en buffer
	addi s6, s6, 1 			#s6++
	la s7, stringbuffer		#s7 = stringbufferadress

	move a0, a3				#Cargo en a0 el valor de x_res
	jal inttostr			#llamo a inttostr
	lw a0, 64($fp)			#Restablezco a0

	add t2, zero, zero		#t2 = 0

looph1:	add t1, t2, s7 		#t1 = stringbufferaddress + t2(contador de caracteres)
	lb t0, 0(t1) 			#primer elemento del stringbuffer en t0
	sb t0, 0(s6) 			#almaceno primer elemento del stringbuffer en buffer
	addi t2, t2, 1 			#t2++
	addi s6, s6, 1 			#s6++
	bne v0, t2, looph1 		#cantidad de caracteres a imprimir != cantidad de caracteres en buffer => looph1
	addi t0, zero, 10		#10 = '\n'
	sb t0, 0(s6) 			#'\n' en buffer
	addi s6, s6, 1 			#s6++

	lw a0, 80($fp)		#Cargo en a0 el valor de y_res
	jal inttostr			#llamo a inttostr
	lw a0, 64($fp)			#Restablezco a0

	la s7, stringbuffer		#s7 = stringbufferadress
	add t2, zero, zero 		#t2 = 0 (contador de caracteres)

looph2:	add t1, t2, s7 		#t1 = stringbufferaddress + t2(contador de caracteres)
	lb t0, 0(t1)			#primer elemento del stringbuffer en t0
	sb t0, 0(s6)			#almaceno primer elemento del stringbuffer en buffer
	addi t2, t2, 1 			#t2++
	addi s6, s6, 1 			#s6++
	bne v0, t2, looph2		#cantidad de caracteres a imprimir != cantidad de caracteres en buffer => looph2
	addi t0, zero, 10		#10 = '\n'
	sb t0, 0(s6) 			#'\n' en buffer
	addi s6, s6, 1 			#s6++

#	Repito pasos anteriores con shades
	lw a0, 84($fp)			#Cargo en a0 el valor de shades
	jal inttostr			#llamo a inttostr
	lw a0, 64($fp)			#Restablezco a0

	la s7, stringbuffer		#s7 = stringbufferadress
	add t2, zero, zero
looph3:	add t1, t2, s7
	lb t0, 0(t1)
	sb t0, 0(s6)
	addi t2, t2, 1
	addi s6, s6, 1
	bne v0, t2, looph3
	addi t0, zero, 10		#10 = '\n'
	sb t0, 0(s6)
	addi s6, s6, 1

	move s0, a1				#s0 = BUF_LOW_OFSET
	sub a2, s6, s0			#Establezco la cantidad a flushear

	jal flush_buffer 		#llamo a flush_buffer

	lw a2, 72($fp)			#Recupero a2


	#Restauro saved registers

	lw s1, 32($fp)			#restauro s0 de 32 + $fp				
	lw s2, 36($fp)			#restauro s6 de 36 + $fp	
	lw s3, 40($fp)			#restauro s7 de 40 + $fp	
	
	move sp, $fp 			#restauro valor de sp

	lw gp, 52(sp)			#restauro valor de gp
	lw ra, 60(sp)			#restauro valor de ra
	lw $fp, 56(sp)			#restauro valor de $fp

	addu sp, sp, 64			#subo stack pointer

	jr ra 					#vuelvo a la funcion caller

	.end mips32_plot


.data
stringbuffer:   .space 32
buffer: .space BUF_SZ
CTE_FOR3: .float 4.0
CTE_MULT: .float 2

