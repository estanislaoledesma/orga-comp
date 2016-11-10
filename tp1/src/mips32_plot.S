#include <mips/regdef.h>
#include <sys/syscall.h>

#ifndef BUF_SZ
#define BUF_SZ 8192
#endif

#define BUF_OFFSET 108 + BUF_SZ
#define BUF_LOW_OFFSET 112

#define S1_OFFSET  BUF_OFFSET + 8
#define S2_OFFSET S1_OFFSET + 4
#define S3_OFFSET S2_OFFSET + 4

#define SP_OFFSET S3_OFFSET + 4
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

	subu sp, sp, STACK_SZ 			
	
	.cprestore GP_OFFSET			
	sw $fp, FP_OFFSET(sp)			
	sw ra, RA_OFFSET(sp)			

	move $fp, sp 				#$fp = sp (desde aca se usa $fp)


	sw a0, STACK_SZ($fp)			#guardo el parametro(*parms) en la ABA de la funcion que me llamo
	
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
	sw t0, 76($fp)					#guardo FILE POINTER en 76 + $fp

#
#	Guardo los registros flotantes y caller saved registers que voy a usar para luego reestablecerlos.
#
error:					#Si vuelvo de error restauro todo, en v0 ya hay valor negativo representando error

	sw s1, S1_OFFSET($fp)
	sw s2, S2_OFFSET($fp)
	sw s3, S3_OFFSET($fp)

	l.s $f6, 40($fp) 			#f6: cpr = parms->cp_re
	l.s $f7, 44($fp) 			#f7: cpi = parms->cp_im

	sw zero, 80($fp)			#inicializo el BUF_PTR

###############################################
###############################################

	lw a0, 76($fp)			#a0: file descriptor
	addi a1, $fp, BUF_LOW_OFFSET			#a1: $fp + BUF_LOW_OFFSET
	lw a2, 80($fp)			#a2: BUF_PTR
	lw a3, 64($fp)			#a3: x_res
	lw t0, 68($fp)			#t0: y_res
	sw t0, 16($fp)			#a4 (16 + $fp): y_res
	lw t0, 72($fp)			#to: shades
	sw t0, 20($fp)			#a5 (20 + $fp): shades

	jal print_header

	#Inicializaciones para el primer for

	addu s1, zero, zero #s1: y = 0
	l.s $f0, 36($fp) #f0: ci = parms->UL_Im
	lw t1, 68($fp) #t1: parms-> y_res


for1:
	bge s1, t1, fin #si y >= y_res => fin

							#Inicializaciones para el segundo for

	addu s2, zero, zero 				#s2: x = 0
	l.s $f1, 32($fp) 				#f1: cr = parms->UL_Re
	lw t2, 64($fp) 					#t2: parms-> x_res

for2:
	bge s2, t2, fin_for1 				#si x >= x_res => fin_for1
	mov.s $f2, $f1 					#f2: zr = cr
	mov.s $f3, $f0 					#f3: zi = ci

							#Inicializaciones para el tercer for
	addu s3, zero, zero 				#s3: c = 0
	lw t3, 72($fp) 					#t3: parms->shades

for3:
	bge s3, t3, fin_for2 				#si c >= shades => fin_for2
	mul.s $f4, $f2, $f2 				#f4: zr * zr
	mul.s $f5, $f3, $f3 				#f5: zi * zi
	add.s $f4, $f4, $f5 				#f4: absz = zr * zr + zi * zi
	l.s $f5, CTE_FOR3 					#f5 = CTE_FOR3
	c.lt.s $f5, $f4  					#si CTE_FOR3 < absz => code = 1
	bc1t fin_for2 						#si code = 1 => fin_for2
	mul.s $f4, $f2, $f2 				#f4: zr * zr
	mul.s $f5, $f3, $f3 				#f5: zi * zi
	sub.s $f4, $f4, $f5 				#f4: zr * zr - zi * zi
	add.s $f4, $f4, $f6 				#f4: sr = zr * zr - zi * zi + cpr
	mul.s $f5, $f2, $f3 				#f5: zr * zi
	l.s $f8, CTE_MULT 				#f8: CTE_MULT
	mul.s $f5, $f5, $f8 				#f5: 2 * zr * zi
	add.s $f5, $f5, $f7 				#f5: si = 2 * zr * zi + cpi
	mov.s $f2, $f4 					#f2: zr = sr
	mov.s $f3, $f5 					#f3: zi = si
	addi s3, s3, 1 					#s3: ++c
	b for3

fin_for2:

	### ESTOS SON LOS REGISTROS QUE USA EL CICLO

	sw t1, 92($fp) 
	sw t2, 96($fp)
	sw t3, 100($fp)
	
	move a0, s3 			#a0: shade (c)
	lw a1, 76($fp)			#a1: file descriptor
	addi a2, $fp, BUF_LOW_OFFSET			#a2: $fp + BUF_LOW_OFFSET
	lw a3, 80($fp)			#a3: BUF_PTR
	jal shade_a_buffer
	
	### REPONGO LOS REGISTROS QUE USA EL CICLO

	lw t1, 92($fp)
	lw t2, 96($fp)
	lw t3, 100($fp)


	addi s2, s2, 1 					#s2: ++x
	l.s $f8, 48($fp)				#f8: parms->d_re
	add.s $f1, $f1, $f8 				#f1: cr += parms->d_re
	b for2 						#vuelve a for2
fin_for1:
	addi s1, s1, 1 					#s1: ++y
	l.s $f8, 52($fp) 				#f8: parms->d_im
	sub.s $f0, $f0, $f8 			#f0: ci -= parms->d_im
	b for1 						#vuelve a for1


							

	

fin:
#Antes de terminar, flusheo lo que queda en el buffer
	sw a0, 84($fp)
	lw a0, 76($fp)				#a0: file descriptor
	addi a1, $fp, BUF_LOW_OFFSET #a1: $fp + BUF_LOW_OFFSET  
	lw a2, 64($fp)				#Establezco en a2 la cantidad a flushear: Lo que queda en el buffer = BUF_PTR = 64($fp)
	
	jal flush_buffer

	lw a0, 84($fp)
	#Reestablezco los caller saved registers a sus valores originales

	lw s1, S1_OFFSET($fp)
	lw s2, S2_OFFSET($fp)
	lw s3, S3_OFFSET($fp)


	move sp, $fp 				#restauro valor de sp
	lw ra, RA_OFFSET(sp)			#restauro valor de ra
	lw $fp, FP_OFFSET(sp)			#restauro valor de $fp
	lw gp, GP_OFFSET(sp)			#restauro valor de gp

	addu sp, sp, STACK_SZ			#subo stack pointer

	jr ra 					#vuelvo a la funcion caller


###############################################
###############################################

#Int to String: el int va en a0, cantidad de chars guardados en v0

inttostr:
 	.frame 	$fp, 16, ra
	
	.set 	noreorder
	.cpload t9
	.set 	reorder

	subu sp, sp, 16			
	
	.cprestore 4			
	sw $fp, 8(sp)			
	sw ra, 12(sp)			

	move $fp, sp 				#$fp = sp (desde aca se usa $fp)

	sw a0, 16($fp)

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

	move sp, $fp 				#restauro valor de sp
	lw ra, 12(sp)			#restauro valor de ra
	lw $fp, 8(sp)			#restauro valor de $fp
	lw gp, 4(sp)			#restauro valor de gp

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

	subu sp, sp, 64		
	
	.cprestore 52			
	sw $fp, 56(sp)			
	sw ra, 60(sp)			

	move $fp, sp 				#$fp = sp (desde aca se usa $fp)

	sw a0, 64($fp) 		
	sw a1, 68($fp)		
	sw a2, 72($fp)
	sw a3, 76($fp)

	#Guardo caller saved registers

	sw s0, 16($fp)
	sw s1, 20($fp)
	sw s2, 24($fp)
	sw s3, 28($fp)
	sw s4, 32($fp)
	sw s5, 36($fp)
	sw s6, 40($fp)
	sw s7, 44($fp)

#	addi s0, $fp, BUF_LOW_OFFSET			#s0 = BUFFER_LOW
#	lw s1, 64($fp)			#Cargo a s1 el BUF_PTR
	li s0, a2			#s0 = BUFFER_LOW(a2)
	li s1, a3			#Cargo a s1 el BUF_PTR(a3)
	add s5, s0, s1			#s5 = BUFFER_LOW + BUF_PTR

	jal inttostr

	move s2, v0
	
	move s6, zero			#s6 = 0
	la s7, stringbuffer		#s7 = stringbufferadress
loop:	add s4, s7, s6			#s4 = stringbufferadress + s6
	addi s6, s6, 1			#s6 = s6 + 1 

	lb t2, 0(s4)			#guardo el primer byte del int de dir(s4) en t2
	sb t2, 0(s5)			#lo guardo en s5

	addi s1, s1, 1			#incremento BUF_PTR
	addi s5, s5, 1			#incremento el puntero al buffer
	bne s1, BUF_SZ, next 		#si BUF_PTR no es igual a BUF_SZ NO flusheo

	move s3, a0				#Guardo el int de a0 en s3
	move a0, a1				#a0: file descriptor
	move a1, a2				#a1: $fp + BUF_LOW_OFFSET

	li a2, BUF_SZ			#Establezco la cantidad a flushear (todo)
	jal flush_buffer

	move a0, s3 			#Restablezco el int en a0

	addi s1, zero, 0 		#flushee, entonces reseteo el buffptr
	add s5, s0, zero		#reseteo el puntero al buffer	
next:	
	addi s2, s2, -1			#decremento la cantidad de chars guardados en el buffer
	bne  s2, 0, loop  		#si la cantidad de chars es != 0 loopeo

	addi t4, zero, 10		#asci code new line
	sb t4, 0(s5)	
	
	addi s1, s1, 1			#incremento BUF_PTR
	addi s5, s5, 1			#incremento el puntero al buffer		#guardo new line
	bne s1, BUF_SZ, next2 		#si BUF_PTR no es igual a BUF_SZ NO flusheo

	li a2, BUF_SZ			#Establezco la cantidad a flushear (todo)
	jal flush_buffer

	move a0, s3 			#Restablezco el int en a0

	addi s1, zero, 0 		#flushee, entonces reseteo el buffptr
	add s5, s0, zero		#reseteo el puntero al buffer

	b fin_shade

next2:	sw s1, 64($fp) # guardo el buff ptr en el stack

fin_shade:

	#Restablezco caller saved registers.
	lw s0, 16($fp)
	lw s1, 20($fp)
	lw s2, 24($fp)
	lw s3, 28($fp)
	lw s4, 32($fp)
	lw s5, 36($fp)
	lw s6, 40($fp)
	lw s7, 44($fp)

	move sp, $fp 				#restauro valor de sp
	lw ra, 60(sp)			#restauro valor de ra
	lw $fp, 56(sp)			#restauro valor de $fp
	lw gp, 52(sp)			#restauro valor de gp

	addu sp, sp, 64			#subo stack pointer

	jr ra 					#vuelvo a la funcion caller

###############################################

#Flush Buffer: flushea el buffer en su totalidad al File descriptor en 60(sp) en a0, a1 es
#$fp + BUF_LOW_OFFSET, a2 la cantidad de bytes a flushear y a3 BUF_PTR.

flush_buffer:
 	.frame 	$fp, 16, ra
	
	.set 	noreorder
	.cpload t9
	.set 	reorder

	subu sp, sp, 16		
	
	.cprestore 4			
	sw $fp, 8(sp)			
	sw ra, 12(sp)			

	move $fp, sp 				#$fp = sp (desde aca se usa $fp)

	sw a0, 16($fp) 		
	sw a1, 20($fp)		
	sw a2, 24($fp)
	sw a3, 28($fp)

	li v0, SYS_write 		#cargo la instrucción para escribir en v0
	syscall
	blt v0, zero, error		#si v0 < 0 go to error
	sw zero, 0(a3) 		#Reseteo el buff ptr

	move sp, $fp 			#restauro valor de sp
	lw ra, 12(sp)			#restauro valor de ra
	lw $fp, 8(sp)			#restauro valor de $fp
	lw gp, 4(sp)			#restauro valor de gp

	addu sp, sp, 16			#subo stack pointer

	jr ra 					#vuelvo a la funcion caller

###############################################

#Print header: Imprime los datos del encabezado de la imagen. En a0 file descriptor, a1 $fp + BUF_LOW_OFFSET, a2 BUF_PTR
#a3 x_res, a4 y_res y a5 shades (estos últimos dos posiciones en ABA de caller 16($fp) y 20($fp), respectivamente).
	
print_header:
 	.frame 	$fp, 64, ra
	
	.set 	noreorder
	.cpload t9
	.set 	reorder

	subu sp, sp, 64		
	
	.cprestore 52			
	sw $fp, 56(sp)			
	sw ra, 60(sp)			

	move $fp, sp 				#$fp = sp (desde aca se usa $fp)

	sw a0, 64($fp) 		
	sw a1, 68($fp)		
	sw a2, 72($fp)
	sw a3, 76($fp)

	#Guardo caller saved registers

	sw s0, 32($fp)
	sw s6, 36($fp)
	sw s7, 40($fp)

	move s6, zero			#s6 = 0 (buffer pointer)
#	addi s0, $fp, BUF_LOW_OFFSET	#s0 = BUFFER_LOW
	li s0, a1				#s0 = BUFFER_LOW
	add s6, s6, s0   		#s6 = BUFFER_LOW + s6 (buffer pointer)
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

#	lw a0, 48($fp)			#Cargo en a0 el valor de x_res
	li a0, a3				#Cargo en a0 el valor de x_res
	jal inttostr			#llamo a inttostr

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

#	lw a0, 52($fp)			#Cargo en a0 el valor de y_res
	lw a0, 16($fp)			#Cargo en a0 el valor de y_res

	jal inttostr			#llamo a inttostr

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
#	lw a0, 56($fp)			#Cargo en a0 el valor de shades
	lw a0, 20($fp)			#Cargo en a0 el valor de shades
	jal inttostr			#llamo a inttostr

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

#	addi s0, $fp, BUF_LOW_OFFSET	#s0 = BUFFER_LOW
	li s0, a1				#s0 = BUFFER_LOW
	move a3, a2				#a3: BUF_PTR
	sub a2, s6, s0			#Establezco la cantidad a flushear
	sw a0, 28($fp) 			#Guardo a0 en 28($fp)
	lw a0, 64($fp)			#a0: file descriptor
	jal flush_buffer 		#llamo a flush_buffer
	lw a0, 28($fp)			#Recupero a0

	#Restablezco caller saved registers.
	lw s0, 32($fp)
	lw s6, 36($fp)
	lw s7, 40($fp)

	move sp, $fp 				#restauro valor de sp
	lw ra, 60(sp)			#restauro valor de ra
	lw $fp, 56(sp)			#restauro valor de $fp
	lw gp, 52(sp)			#restauro valor de gp

	addu sp, sp, 64			#subo stack pointer

	jr ra 					#vuelvo a la funcion caller



	.end mips32_plot


.data
stringbuffer:   .space 32
CTE_FOR3: .float 4.0
CTE_MULT: .float 2

