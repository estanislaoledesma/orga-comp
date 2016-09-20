	.section .mdebug.abi32
	.previous
	.abicalls
	.file 1 "tp0f.c"
	.section	.debug_abbrev,"",@progbits
$Ldebug_abbrev0:
	.section	.debug_info,"",@progbits
$Ldebug_info0:
	.section	.debug_line,"",@progbits
$Ldebug_line0:
	.text
$Ltext0:
	.file 2 "/usr/include/mips/int_types.h"
	.file 3 "/usr/include/mips/ansi.h"
	.file 4 "/usr/include/string.h"
	.file 5 "/usr/include/mips/types.h"
	.file 6 "/usr/include/sys/ansi.h"
	.file 7 "/usr/include/sys/types.h"
	.file 8 "/usr/include/sys/endian.h"
	.file 9 "/usr/include/pthread_types.h"
	.file 10 "/usr/include/stdlib.h"
	.file 11 "/usr/include/stdio.h"
	.file 12 "/usr/include/math.h"
	.file 13 "/usr/include/unistd.h"
	.file 14 "/usr/include/getopt.h"
	.rdata
	.align	2
$LC0:
	.ascii	"Error de parametros ./tp0 -h para ayuda detallada.\n"
	.ascii	"Uso: ./tp0 -r 640x480 -c 0+0i -C 0.285-0,01i -w 4 -H 4 -"
	.ascii	"o /home/user/julia.pgm (or -o - for stdout)\n\000"
	.text
	.align	2
	.globl	print_usage
$LFB29:
	.loc 1 15 0
	.ent	print_usage
print_usage:
	.frame	$fp,40,$31		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
$LCFI0:
	sw	$31,32($sp)
$LCFI1:
	sw	$fp,28($sp)
$LCFI2:
	sw	$28,24($sp)
$LCFI3:
	move	$fp,$sp
$LCFI4:
	.loc 1 16 0
	la	$4,$LC0
	la	$25,printf
	jal	$31,$25
	.loc 1 17 0
	move	$sp,$fp
	lw	$31,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$31
	.end	print_usage
$LFE29:
	.size	print_usage, .-print_usage
	.rdata
	.align	2
$LC1:
	.ascii	"r:c:C:W:H:o:h\000"
	.align	2
$LC2:
	.ascii	"Ancho plano complejo invalido.\n\000"
	.align	2
$LC3:
	.ascii	"Alto plano complejo invalido.\n\000"
	.align	2
$LC4:
	.ascii	"-\000"
	.align	2
$LC5:
	.ascii	"AYUDA:\tResolucion: -r 640x480\n"
	.ascii	"\tOrigen: -c 0+0i\n"
	.ascii	"\tConstante imaginaria: -C 0.285-0,01i\n"
	.ascii	"\tAncho del plano complejo: -W 4\n"
	.ascii	"\tAlto del plano complejo: -H 4\n"
	.ascii	"\tFormato de salida: -o /home/julia.pgm (PARAMETRO IMPRE"
	.ascii	"SCINDIBLE) (or -o - for stdout)\n\000"
	.align	2
$LC6:
	.ascii	"El argumento -o es condici\303\263n necesaria\n\000"
	.align	2
$LC8:
	.ascii	"%f%f%c\000"
	.align	2
$LC9:
	.ascii	"Error obteniendo constante compleja.\n\000"
	.align	2
$LC12:
	.ascii	"Error obteniendo origen complejo.\n\000"
	.align	2
$LC13:
	.ascii	"%dx%d\000"
	.align	2
$LC14:
	.ascii	"Resolucion vertical invalida\n\000"
	.align	2
$LC15:
	.ascii	"Resolucion horizontal invalida\n\000"
	.align	2
$LC17:
	.ascii	"w\000"
	.align	2
$LC18:
	.ascii	"fatal: cannot open output file\n\000"
	.align	2
$LC19:
	.ascii	"P2 \n"
	.ascii	"%d %d \n"
	.ascii	"255 \n\000"
	.align	2
$LC20:
	.ascii	"%d \000"
	.align	2
$LC21:
	.ascii	"\n\000"
	.align	2
$LC22:
	.ascii	"Archivo guardado en %s/%s\n\000"
	.align	2
$LC7:
	.word	1082130432
	.align	2
$LC10:
	.word	1049750405
	.align	2
$LC11:
	.word	-1138501878
	.align	2
$LC16:
	.word	1073741824
	.text
	.align	2
	.globl	main
$LFB31:
	.loc 1 20 0
	.ent	main
main:
	.frame	$fp,192,$31		# vars= 144, regs= 3/0, args= 24, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,192
	.cprestore 24
$LCFI5:
	sw	$31,184($sp)
$LCFI6:
	sw	$fp,180($sp)
$LCFI7:
	sw	$28,176($sp)
$LCFI8:
	move	$fp,$sp
$LCFI9:
	sw	$4,192($fp)
	sw	$5,196($fp)
	.loc 1 21 0
$LBB2:
	lw	$2,196($fp)
	lw	$2,0($2)
	sw	$2,32($fp)
	.loc 1 22 0
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,36($fp)
	.loc 1 23 0
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,40($fp)
	.loc 1 24 0
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,44($fp)
	.loc 1 25 0
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,48($fp)
	.loc 1 26 0
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,52($fp)
	.loc 1 27 0
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,56($fp)
	.loc 1 28 0
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,60($fp)
	.loc 1 29 0
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,64($fp)
	.loc 1 42 0
$L19:
	lw	$4,192($fp)
	lw	$5,196($fp)
	la	$6,$LC1
	la	$25,getopt
	jal	$31,$25
	sw	$2,36($fp)
	lw	$3,36($fp)
	li	$2,-1			# 0xffffffffffffffff
	bne	$3,$2,$L21
	b	$L20
$L21:
	.loc 1 43 0
	lw	$2,36($fp)
	addu	$2,$2,-67
	sw	$2,168($fp)
	lw	$3,168($fp)
	sltu	$2,$3,48
	beq	$2,$0,$L35
	lw	$2,168($fp)
	sll	$3,$2,2
	la	$2,$L36
	addu	$2,$3,$2
	lw	$2,0($2)
	.cpadd	$2
	j	$2
	.rdata
	.align	2
$L36:
	.gpword	$L25
	.gpword	$L35
	.gpword	$L35
	.gpword	$L35
	.gpword	$L35
	.gpword	$L29
	.gpword	$L35
	.gpword	$L35
	.gpword	$L35
	.gpword	$L35
	.gpword	$L35
	.gpword	$L35
	.gpword	$L35
	.gpword	$L35
	.gpword	$L35
	.gpword	$L35
	.gpword	$L35
	.gpword	$L35
	.gpword	$L35
	.gpword	$L35
	.gpword	$L26
	.gpword	$L35
	.gpword	$L35
	.gpword	$L35
	.gpword	$L35
	.gpword	$L35
	.gpword	$L35
	.gpword	$L35
	.gpword	$L35
	.gpword	$L35
	.gpword	$L35
	.gpword	$L35
	.gpword	$L24
	.gpword	$L35
	.gpword	$L35
	.gpword	$L35
	.gpword	$L35
	.gpword	$L34
	.gpword	$L35
	.gpword	$L35
	.gpword	$L35
	.gpword	$L35
	.gpword	$L35
	.gpword	$L35
	.gpword	$L32
	.gpword	$L35
	.gpword	$L35
	.gpword	$L23
	.text
$L23:
	.loc 1 45 0
	li	$2,1			# 0x1
	sw	$2,40($fp)
	.loc 1 46 0
	lw	$2,optarg
	sw	$2,80($fp)
	.loc 1 47 0
	b	$L19
$L24:
	.loc 1 49 0
	li	$2,1			# 0x1
	sw	$2,60($fp)
	.loc 1 50 0
	lw	$2,optarg
	sw	$2,68($fp)
	.loc 1 51 0
	b	$L19
$L25:
	.loc 1 53 0
	li	$2,1			# 0x1
	sw	$2,52($fp)
	.loc 1 54 0
	lw	$2,optarg
	sw	$2,72($fp)
	.loc 1 55 0
	b	$L19
$L26:
	.loc 1 57 0
	lw	$4,optarg
	la	$25,atoi
	jal	$31,$25
	mtc1	$2,$f0
	cvt.s.w	$f0,$f0
	s.s	$f0,120($fp)
	.loc 1 58 0
	l.s	$f2,120($fp)
	mtc1	$0,$f0
	c.le.s	$f2,$f0
	bc1t	$L28
	b	$L27
$L28:
	.loc 1 59 0
	la	$4,$LC2
	la	$25,printf
	jal	$31,$25
	.loc 1 60 0
	li	$4,1			# 0x1
	la	$25,exit
	jal	$31,$25
$L27:
	.loc 1 62 0
	li	$2,1			# 0x1
	sw	$2,48($fp)
	.loc 1 63 0
	b	$L19
$L29:
	.loc 1 65 0
	lw	$4,optarg
	la	$25,atoi
	jal	$31,$25
	mtc1	$2,$f0
	cvt.s.w	$f0,$f0
	s.s	$f0,124($fp)
	.loc 1 66 0
	l.s	$f2,124($fp)
	mtc1	$0,$f0
	c.le.s	$f2,$f0
	bc1t	$L31
	b	$L30
$L31:
	.loc 1 67 0
	la	$4,$LC3
	la	$25,printf
	jal	$31,$25
	.loc 1 68 0
	li	$4,1			# 0x1
	la	$25,exit
	jal	$31,$25
$L30:
	.loc 1 70 0
	li	$2,1			# 0x1
	sw	$2,44($fp)
	.loc 1 71 0
	b	$L19
$L32:
	.loc 1 73 0
	li	$2,1			# 0x1
	sw	$2,56($fp)
	.loc 1 74 0
	lw	$4,optarg
	la	$5,$LC4
	la	$25,strcmp
	jal	$31,$25
	bne	$2,$0,$L33
	li	$2,1			# 0x1
	sw	$2,64($fp)
$L33:
	.loc 1 75 0
	lw	$2,optarg
	sw	$2,76($fp)
	.loc 1 85 0
	b	$L19
$L34:
	.loc 1 87 0
	la	$4,$LC5
	la	$25,printf
	jal	$31,$25
	.loc 1 88 0
	sw	$0,164($fp)
	b	$L18
$L35:
	.loc 1 90 0
	la	$25,print_usage
	jal	$31,$25
	.loc 1 91 0
	li	$4,1			# 0x1
	la	$25,exit
	jal	$31,$25
$L20:
	.loc 1 95 0
	lw	$3,56($fp)
	li	$2,1			# 0x1
	beq	$3,$2,$L37
	.loc 1 96 0
	la	$4,$LC6
	la	$25,printf
	jal	$31,$25
	.loc 1 97 0
	li	$4,1			# 0x1
	la	$25,exit
	jal	$31,$25
$L37:
	.loc 1 100 0
	lw	$3,44($fp)
	li	$2,1			# 0x1
	beq	$3,$2,$L38
	l.s	$f0,$LC7
	s.s	$f0,124($fp)
$L38:
	.loc 1 101 0
	lw	$3,48($fp)
	li	$2,1			# 0x1
	beq	$3,$2,$L39
	l.s	$f0,$LC7
	s.s	$f0,120($fp)
$L39:
	.loc 1 104 0
	lw	$3,52($fp)
	li	$2,1			# 0x1
	bne	$3,$2,$L40
	.loc 1 105 0
	addu	$6,$fp,88
	addu	$2,$fp,88
	addu	$3,$2,4
	addu	$2,$fp,84
	sw	$2,16($sp)
	lw	$4,72($fp)
	la	$5,$LC8
	move	$7,$3
	la	$25,sscanf
	jal	$31,$25
	sw	$2,128($fp)
	.loc 1 106 0
	lw	$2,128($fp)
	slt	$2,$2,3
	beq	$2,$0,$L42
	.loc 1 107 0
	la	$4,$LC9
	la	$25,printf
	jal	$31,$25
	.loc 1 108 0
	la	$25,print_usage
	jal	$31,$25
	.loc 1 109 0
	li	$4,1			# 0x1
	la	$25,exit
	jal	$31,$25
$L40:
	.loc 1 112 0
	l.s	$f0,$LC10
	s.s	$f0,88($fp)
	.loc 1 113 0
	l.s	$f0,$LC11
	s.s	$f0,92($fp)
$L42:
	.loc 1 116 0
	lw	$3,60($fp)
	li	$2,1			# 0x1
	bne	$3,$2,$L43
	.loc 1 117 0
	addu	$6,$fp,96
	addu	$2,$fp,96
	addu	$3,$2,4
	addu	$2,$fp,84
	sw	$2,16($sp)
	lw	$4,68($fp)
	la	$5,$LC8
	move	$7,$3
	la	$25,sscanf
	jal	$31,$25
	sw	$2,128($fp)
	.loc 1 118 0
	lw	$2,128($fp)
	slt	$2,$2,3
	beq	$2,$0,$L45
	.loc 1 119 0
	la	$4,$LC12
	la	$25,printf
	jal	$31,$25
	.loc 1 120 0
	la	$25,print_usage
	jal	$31,$25
	.loc 1 121 0
	li	$4,1			# 0x1
	la	$25,exit
	jal	$31,$25
$L43:
	.loc 1 124 0
	sw	$0,96($fp)
	.loc 1 125 0
	sw	$0,100($fp)
$L45:
	.loc 1 128 0
	lw	$3,40($fp)
	li	$2,1			# 0x1
	bne	$3,$2,$L46
	.loc 1 129 0
$LBB3:
	addu	$2,$fp,112
	addu	$3,$fp,116
	lw	$4,80($fp)
	la	$5,$LC13
	move	$6,$2
	move	$7,$3
	la	$25,sscanf
	jal	$31,$25
	sw	$2,132($fp)
	.loc 1 130 0
	lw	$2,132($fp)
	slt	$2,$2,2
	bne	$2,$0,$L48
	lw	$2,116($fp)
	blez	$2,$L48
	lw	$2,112($fp)
	blez	$2,$L48
	b	$L51
$L48:
	.loc 1 132 0
	lw	$2,116($fp)
	bgtz	$2,$L49
	la	$4,$LC14
	la	$25,printf
	jal	$31,$25
$L49:
	.loc 1 133 0
	lw	$2,112($fp)
	bgtz	$2,$L50
	la	$4,$LC15
	la	$25,printf
	jal	$31,$25
$L50:
	.loc 1 134 0
	la	$25,print_usage
	jal	$31,$25
	.loc 1 135 0
	li	$4,1			# 0x1
	la	$25,exit
	jal	$31,$25
$L46:
	.loc 1 138 0
$LBE3:
	li	$2,640			# 0x280
	sw	$2,112($fp)
	.loc 1 139 0
	li	$2,480			# 0x1e0
	sw	$2,116($fp)
$L51:
	.loc 1 143 0
	l.s	$f0,112($fp)
	cvt.s.w	$f2,$f0
	l.s	$f0,120($fp)
	div.s	$f2,$f0,$f2
	l.s	$f0,$LC16
	div.s	$f0,$f2,$f0
	s.s	$f0,136($fp)
	.loc 1 144 0
	l.s	$f0,116($fp)
	cvt.s.w	$f2,$f0
	l.s	$f0,124($fp)
	div.s	$f2,$f0,$f2
	l.s	$f0,$LC16
	div.s	$f0,$f2,$f0
	s.s	$f0,140($fp)
	.loc 1 149 0
	lw	$3,64($fp)
	li	$2,1			# 0x1
	beq	$3,$2,$L52
	.loc 1 150 0
	lw	$4,76($fp)
	la	$5,$LC17
	la	$25,fopen
	jal	$31,$25
	sw	$2,152($fp)
	.loc 1 151 0
	lw	$2,152($fp)
	bne	$2,$0,$L52
	.loc 1 152 0
	la	$4,$LC18
	la	$25,printf
	jal	$31,$25
	.loc 1 153 0
	la	$25,print_usage
	jal	$31,$25
	.loc 1 154 0
	li	$4,1			# 0x1
	la	$25,exit
	jal	$31,$25
$L52:
	.loc 1 158 0
	lw	$3,64($fp)
	li	$2,1			# 0x1
	bne	$3,$2,$L54
	la	$4,__sF+88
	la	$5,$LC19
	lw	$6,112($fp)
	lw	$7,116($fp)
	la	$25,fprintf
	jal	$31,$25
	b	$L55
$L54:
	lw	$4,152($fp)
	la	$5,$LC19
	lw	$6,112($fp)
	lw	$7,116($fp)
	la	$25,fprintf
	jal	$31,$25
$L55:
	.loc 1 161 0
$LBB4:
	li	$2,1			# 0x1
	sw	$2,156($fp)
$L56:
	lw	$2,156($fp)
	lw	$3,116($fp)
	slt	$2,$3,$2
	beq	$2,$0,$L59
	b	$L57
$L59:
	.loc 1 162 0
$LBB5:
	li	$2,1			# 0x1
	sw	$2,160($fp)
$L60:
	lw	$2,160($fp)
	lw	$3,112($fp)
	slt	$2,$3,$2
	beq	$2,$0,$L63
	b	$L61
$L63:
	.loc 1 163 0
	lw	$2,160($fp)
	sll	$2,$2,1
	addu	$2,$2,-1
	mtc1	$2,$f0
	cvt.s.w	$f2,$f0
	l.s	$f0,136($fp)
	mul.s	$f4,$f2,$f0
	l.s	$f2,120($fp)
	l.s	$f0,$LC16
	div.s	$f0,$f2,$f0
	sub.s	$f2,$f4,$f0
	l.s	$f0,96($fp)
	add.s	$f0,$f2,$f0
	s.s	$f0,104($fp)
	.loc 1 164 0
	l.s	$f0,140($fp)
	neg.s	$f2,$f0
	lw	$2,156($fp)
	sll	$2,$2,1
	addu	$2,$2,-1
	mtc1	$2,$f0
	cvt.s.w	$f0,$f0
	mul.s	$f4,$f2,$f0
	l.s	$f2,124($fp)
	l.s	$f0,$LC16
	div.s	$f0,$f2,$f0
	add.s	$f2,$f4,$f0
	l.s	$f0,100($fp)
	add.s	$f0,$f2,$f0
	s.s	$f0,108($fp)
	.loc 1 166 0
	sw	$0,132($fp)
$L64:
	lw	$2,132($fp)
	slt	$2,$2,256
	bne	$2,$0,$L67
	b	$L65
$L67:
	.loc 1 167 0
	l.s	$f2,104($fp)
	l.s	$f0,104($fp)
	mul.s	$f4,$f2,$f0
	l.s	$f2,108($fp)
	l.s	$f0,108($fp)
	mul.s	$f0,$f2,$f0
	add.s	$f0,$f4,$f0
	mov.s	$f12,$f0
	la	$25,sqrtf
	jal	$31,$25
	s.s	$f0,148($fp)
	.loc 1 168 0
	l.s	$f2,148($fp)
	l.s	$f0,$LC16
	c.lt.s	$f0,$f2
	bc1t	$L65
	.loc 1 169 0
	l.s	$f2,104($fp)
	l.s	$f0,104($fp)
	mul.s	$f4,$f2,$f0
	l.s	$f2,108($fp)
	l.s	$f0,108($fp)
	mul.s	$f0,$f2,$f0
	sub.s	$f2,$f4,$f0
	l.s	$f0,88($fp)
	add.s	$f0,$f2,$f0
	s.s	$f0,144($fp)
	.loc 1 170 0
	l.s	$f2,108($fp)
	l.s	$f0,104($fp)
	mul.s	$f4,$f2,$f0
	l.s	$f2,104($fp)
	l.s	$f0,108($fp)
	mul.s	$f0,$f2,$f0
	add.s	$f2,$f4,$f0
	l.s	$f0,92($fp)
	add.s	$f0,$f2,$f0
	s.s	$f0,108($fp)
	.loc 1 171 0
	l.s	$f0,144($fp)
	s.s	$f0,104($fp)
	.loc 1 166 0
	lw	$2,132($fp)
	addu	$2,$2,1
	sw	$2,132($fp)
	b	$L64
$L65:
	.loc 1 173 0
	lw	$3,64($fp)
	li	$2,1			# 0x1
	bne	$3,$2,$L70
	la	$4,__sF+88
	la	$5,$LC20
	lw	$6,132($fp)
	la	$25,fprintf
	jal	$31,$25
	b	$L62
$L70:
	lw	$4,152($fp)
	la	$5,$LC20
	lw	$6,132($fp)
	la	$25,fprintf
	jal	$31,$25
	.loc 1 162 0
$L62:
	lw	$2,160($fp)
	addu	$2,$2,1
	sw	$2,160($fp)
	b	$L60
$L61:
	.loc 1 175 0
$LBE5:
	lw	$3,64($fp)
	li	$2,1			# 0x1
	bne	$3,$2,$L72
	la	$4,__sF+88
	la	$5,$LC21
	la	$25,fprintf
	jal	$31,$25
	b	$L58
$L72:
	lw	$4,152($fp)
	la	$5,$LC21
	la	$25,fprintf
	jal	$31,$25
	.loc 1 161 0
$L58:
	lw	$2,156($fp)
	addu	$2,$2,1
	sw	$2,156($fp)
	b	$L56
$L57:
	.loc 1 178 0
$LBE4:
	lw	$3,64($fp)
	li	$2,1			# 0x1
	beq	$3,$2,$L74
	.loc 1 179 0
	lw	$4,152($fp)
	la	$25,rewind
	jal	$31,$25
	.loc 1 180 0
	lw	$4,152($fp)
	la	$25,fclose
	jal	$31,$25
	.loc 1 181 0
	la	$4,$LC22
	lw	$5,32($fp)
	lw	$6,76($fp)
	la	$25,printf
	jal	$31,$25
$L74:
	.loc 1 197 0
	sw	$0,164($fp)
	.loc 1 198 0
$L18:
$LBE2:
	lw	$2,164($fp)
	move	$sp,$fp
	lw	$31,184($sp)
	lw	$fp,180($sp)
	addu	$sp,$sp,192
	j	$31
	.end	main
$LFE31:
	.size	main, .-main
	.section	.debug_frame,"",@progbits
$Lframe0:
	.4byte	$LECIE0-$LSCIE0
$LSCIE0:
	.4byte	0xffffffff
	.byte	0x1
	.ascii	"\000"
	.uleb128 0x1
	.sleb128 4
	.byte	0x40
	.byte	0xc
	.uleb128 0x1d
	.uleb128 0x0
	.align	2
$LECIE0:
$LSFDE0:
	.4byte	$LEFDE0-$LASFDE0
$LASFDE0:
	.4byte	$Lframe0
	.4byte	$LFB29
	.4byte	$LFE29-$LFB29
	.byte	0x4
	.4byte	$LCFI0-$LFB29
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	$LCFI3-$LCFI0
	.byte	0x11
	.uleb128 0x1c
	.sleb128 -4
	.byte	0x11
	.uleb128 0x1e
	.sleb128 -3
	.byte	0x11
	.uleb128 0x40
	.sleb128 -2
	.byte	0x4
	.4byte	$LCFI4-$LCFI3
	.byte	0xc
	.uleb128 0x1e
	.uleb128 0x28
	.align	2
$LEFDE0:
$LSFDE2:
	.4byte	$LEFDE2-$LASFDE2
$LASFDE2:
	.4byte	$Lframe0
	.4byte	$LFB31
	.4byte	$LFE31-$LFB31
	.byte	0x4
	.4byte	$LCFI5-$LFB31
	.byte	0xe
	.uleb128 0xc0
	.byte	0x4
	.4byte	$LCFI8-$LCFI5
	.byte	0x11
	.uleb128 0x1c
	.sleb128 -4
	.byte	0x11
	.uleb128 0x1e
	.sleb128 -3
	.byte	0x11
	.uleb128 0x40
	.sleb128 -2
	.byte	0x4
	.4byte	$LCFI9-$LCFI8
	.byte	0xc
	.uleb128 0x1e
	.uleb128 0xc0
	.align	2
$LEFDE2:
	.align	0
	.text
$Letext0:
	.section	.debug_info
	.4byte	0xf8e
	.2byte	0x2
	.4byte	$Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	$Ldebug_line0
	.4byte	$Letext0
	.4byte	$Ltext0
	.4byte	$LC281
	.4byte	$LC282
	.4byte	$LC283
	.byte	0x1
	.uleb128 0x2
	.4byte	$LC23
	.byte	0x2
	.byte	0x30
	.4byte	0x30
	.uleb128 0x3
	.4byte	$LC25
	.byte	0x1
	.byte	0x6
	.uleb128 0x2
	.4byte	$LC24
	.byte	0x2
	.byte	0x31
	.4byte	0x42
	.uleb128 0x3
	.4byte	$LC26
	.byte	0x1
	.byte	0x8
	.uleb128 0x2
	.4byte	$LC27
	.byte	0x2
	.byte	0x32
	.4byte	0x54
	.uleb128 0x3
	.4byte	$LC28
	.byte	0x2
	.byte	0x5
	.uleb128 0x2
	.4byte	$LC29
	.byte	0x2
	.byte	0x33
	.4byte	0x66
	.uleb128 0x3
	.4byte	$LC30
	.byte	0x2
	.byte	0x7
	.uleb128 0x2
	.4byte	$LC31
	.byte	0x2
	.byte	0x34
	.4byte	0x78
	.uleb128 0x4
	.ascii	"int\000"
	.byte	0x4
	.byte	0x5
	.uleb128 0x2
	.4byte	$LC32
	.byte	0x2
	.byte	0x35
	.4byte	0x8a
	.uleb128 0x3
	.4byte	$LC33
	.byte	0x4
	.byte	0x7
	.uleb128 0x2
	.4byte	$LC34
	.byte	0x2
	.byte	0x3e
	.4byte	0x9c
	.uleb128 0x3
	.4byte	$LC35
	.byte	0x8
	.byte	0x5
	.uleb128 0x2
	.4byte	$LC36
	.byte	0x2
	.byte	0x40
	.4byte	0xae
	.uleb128 0x3
	.4byte	$LC37
	.byte	0x8
	.byte	0x7
	.uleb128 0x2
	.4byte	$LC38
	.byte	0x2
	.byte	0x4b
	.4byte	0x78
	.uleb128 0x2
	.4byte	$LC39
	.byte	0x2
	.byte	0x4c
	.4byte	0x8a
	.uleb128 0x5
	.4byte	0xea
	.byte	0x80
	.byte	0x3
	.byte	0x65
	.uleb128 0x6
	.4byte	$LC40
	.byte	0x3
	.byte	0x63
	.4byte	0xea
	.uleb128 0x6
	.4byte	$LC41
	.byte	0x3
	.byte	0x64
	.4byte	0x91
	.byte	0x0
	.uleb128 0x7
	.4byte	0xfa
	.4byte	0x101
	.uleb128 0x8
	.4byte	0xfa
	.byte	0x7f
	.byte	0x0
	.uleb128 0x3
	.4byte	$LC33
	.byte	0x4
	.byte	0x7
	.uleb128 0x3
	.4byte	$LC42
	.byte	0x1
	.byte	0x6
	.uleb128 0x2
	.4byte	$LC43
	.byte	0x3
	.byte	0x65
	.4byte	0xcb
	.uleb128 0x2
	.4byte	$LC44
	.byte	0x4
	.byte	0x27
	.4byte	0x8a
	.uleb128 0x2
	.4byte	$LC45
	.byte	0x5
	.byte	0x3b
	.4byte	0x129
	.uleb128 0x3
	.4byte	$LC46
	.byte	0x4
	.byte	0x5
	.uleb128 0x2
	.4byte	$LC47
	.byte	0x5
	.byte	0x3c
	.4byte	0x13b
	.uleb128 0x3
	.4byte	$LC48
	.byte	0x4
	.byte	0x7
	.uleb128 0x2
	.4byte	$LC49
	.byte	0x5
	.byte	0x3d
	.4byte	0x129
	.uleb128 0x2
	.4byte	$LC50
	.byte	0x5
	.byte	0x46
	.4byte	0x13b
	.uleb128 0x2
	.4byte	$LC51
	.byte	0x5
	.byte	0x47
	.4byte	0x13b
	.uleb128 0x2
	.4byte	$LC52
	.byte	0x5
	.byte	0x49
	.4byte	0x13b
	.uleb128 0x2
	.4byte	$LC53
	.byte	0x5
	.byte	0x4a
	.4byte	0x13b
	.uleb128 0x2
	.4byte	$LC54
	.byte	0x5
	.byte	0x51
	.4byte	0x129
	.uleb128 0x2
	.4byte	$LC55
	.byte	0x5
	.byte	0x5a
	.4byte	0x18f
	.uleb128 0x9
	.4byte	0x78
	.uleb128 0x2
	.4byte	$LC56
	.byte	0x6
	.byte	0x2c
	.4byte	0x19f
	.uleb128 0xa
	.byte	0x4
	.4byte	0x101
	.uleb128 0x2
	.4byte	$LC57
	.byte	0x6
	.byte	0x2d
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC58
	.byte	0x6
	.byte	0x2e
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC59
	.byte	0x6
	.byte	0x2f
	.4byte	0x5b
	.uleb128 0x2
	.4byte	$LC60
	.byte	0x6
	.byte	0x30
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC61
	.byte	0x6
	.byte	0x31
	.4byte	0x91
	.uleb128 0x2
	.4byte	$LC62
	.byte	0x6
	.byte	0x32
	.4byte	0x6d
	.uleb128 0x2
	.4byte	$LC63
	.byte	0x6
	.byte	0x33
	.4byte	0x37
	.uleb128 0x2
	.4byte	$LC64
	.byte	0x6
	.byte	0x34
	.4byte	0x8a
	.uleb128 0x2
	.4byte	$LC65
	.byte	0x6
	.byte	0x35
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC66
	.byte	0x6
	.byte	0x36
	.4byte	0xa3
	.uleb128 0x2
	.4byte	$LC67
	.byte	0x6
	.byte	0x37
	.4byte	0xa3
	.uleb128 0x2
	.4byte	$LC68
	.byte	0x7
	.byte	0x36
	.4byte	0x25
	.uleb128 0x2
	.4byte	$LC69
	.byte	0x7
	.byte	0x3b
	.4byte	0x37
	.uleb128 0x2
	.4byte	$LC70
	.byte	0x7
	.byte	0x40
	.4byte	0x49
	.uleb128 0x2
	.4byte	$LC71
	.byte	0x7
	.byte	0x45
	.4byte	0x5b
	.uleb128 0x2
	.4byte	$LC72
	.byte	0x7
	.byte	0x4a
	.4byte	0x6d
	.uleb128 0x2
	.4byte	$LC73
	.byte	0x7
	.byte	0x4f
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC74
	.byte	0x7
	.byte	0x54
	.4byte	0x91
	.uleb128 0x2
	.4byte	$LC75
	.byte	0x7
	.byte	0x59
	.4byte	0xa3
	.uleb128 0x2
	.4byte	$LC76
	.byte	0x7
	.byte	0x5d
	.4byte	0x37
	.uleb128 0x2
	.4byte	$LC77
	.byte	0x7
	.byte	0x5e
	.4byte	0x5b
	.uleb128 0x2
	.4byte	$LC78
	.byte	0x7
	.byte	0x5f
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC79
	.byte	0x7
	.byte	0x60
	.4byte	0xa3
	.uleb128 0x2
	.4byte	$LC80
	.byte	0x8
	.byte	0x3a
	.4byte	0x1b0
	.uleb128 0x2
	.4byte	$LC81
	.byte	0x8
	.byte	0x3f
	.4byte	0x1bb
	.uleb128 0x2
	.4byte	$LC82
	.byte	0x7
	.byte	0x65
	.4byte	0x42
	.uleb128 0x2
	.4byte	$LC83
	.byte	0x7
	.byte	0x66
	.4byte	0x66
	.uleb128 0x2
	.4byte	$LC84
	.byte	0x7
	.byte	0x67
	.4byte	0x8a
	.uleb128 0x2
	.4byte	$LC85
	.byte	0x7
	.byte	0x68
	.4byte	0x13b
	.uleb128 0x2
	.4byte	$LC86
	.byte	0x7
	.byte	0x6a
	.4byte	0x42
	.uleb128 0x2
	.4byte	$LC87
	.byte	0x7
	.byte	0x6b
	.4byte	0x66
	.uleb128 0x2
	.4byte	$LC88
	.byte	0x7
	.byte	0x6c
	.4byte	0x8a
	.uleb128 0x2
	.4byte	$LC89
	.byte	0x7
	.byte	0x6d
	.4byte	0x13b
	.uleb128 0x2
	.4byte	$LC90
	.byte	0x7
	.byte	0x6f
	.4byte	0x2d9
	.uleb128 0x2
	.4byte	$LC91
	.byte	0x7
	.byte	0x72
	.4byte	0xa3
	.uleb128 0x2
	.4byte	$LC92
	.byte	0x7
	.byte	0x73
	.4byte	0x91
	.uleb128 0x2
	.4byte	$LC93
	.byte	0x7
	.byte	0x74
	.4byte	0x33c
	.uleb128 0xa
	.byte	0x4
	.4byte	0x326
	.uleb128 0x2
	.4byte	$LC94
	.byte	0x7
	.byte	0x80
	.4byte	0x91
	.uleb128 0x2
	.4byte	$LC95
	.byte	0x7
	.byte	0x81
	.4byte	0xa3
	.uleb128 0x2
	.4byte	$LC96
	.byte	0x7
	.byte	0x83
	.4byte	0x91
	.uleb128 0x2
	.4byte	$LC97
	.byte	0x7
	.byte	0x84
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC98
	.byte	0x7
	.byte	0x87
	.4byte	0x208
	.uleb128 0x2
	.4byte	$LC99
	.byte	0x7
	.byte	0x8c
	.4byte	0x213
	.uleb128 0x2
	.4byte	$LC100
	.byte	0x7
	.byte	0x91
	.4byte	0x194
	.uleb128 0x2
	.4byte	$LC101
	.byte	0x7
	.byte	0x99
	.4byte	0x91
	.uleb128 0x2
	.4byte	$LC102
	.byte	0x7
	.byte	0x9c
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC103
	.byte	0x7
	.byte	0x9d
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC104
	.byte	0x7
	.byte	0xa0
	.4byte	0x1a5
	.uleb128 0x2
	.4byte	$LC105
	.byte	0x7
	.byte	0xa4
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC106
	.byte	0x7
	.byte	0xa5
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC107
	.byte	0x7
	.byte	0xa6
	.4byte	0x129
	.uleb128 0x2
	.4byte	$LC108
	.byte	0x7
	.byte	0xa9
	.4byte	0x1c6
	.uleb128 0x2
	.4byte	$LC109
	.byte	0x7
	.byte	0xad
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC110
	.byte	0x7
	.byte	0xb0
	.4byte	0x1d1
	.uleb128 0x2
	.4byte	$LC111
	.byte	0x7
	.byte	0xb5
	.4byte	0x1dc
	.uleb128 0x2
	.4byte	$LC112
	.byte	0x7
	.byte	0xb8
	.4byte	0x6d
	.uleb128 0x2
	.4byte	$LC113
	.byte	0x7
	.byte	0xb9
	.4byte	0x326
	.uleb128 0x2
	.4byte	$LC114
	.byte	0x7
	.byte	0xba
	.4byte	0x6d
	.uleb128 0x2
	.4byte	$LC115
	.byte	0x7
	.byte	0xbb
	.4byte	0x6d
	.uleb128 0x2
	.4byte	$LC116
	.byte	0x7
	.byte	0xbe
	.4byte	0x1fd
	.uleb128 0x2
	.4byte	$LC117
	.byte	0x7
	.byte	0xc2
	.4byte	0x6d
	.uleb128 0x2
	.4byte	$LC118
	.byte	0x7
	.byte	0xfc
	.4byte	0x13b
	.uleb128 0xb
	.4byte	$LC119
	.byte	0x7
	.2byte	0x107
	.4byte	0x78
	.uleb128 0xb
	.4byte	$LC120
	.byte	0x7
	.2byte	0x10c
	.4byte	0x129
	.uleb128 0xb
	.4byte	$LC121
	.byte	0x7
	.2byte	0x111
	.4byte	0x78
	.uleb128 0xb
	.4byte	$LC122
	.byte	0x7
	.2byte	0x116
	.4byte	0x78
	.uleb128 0xb
	.4byte	$LC123
	.byte	0x7
	.2byte	0x11b
	.4byte	0x78
	.uleb128 0xb
	.4byte	$LC124
	.byte	0x7
	.2byte	0x120
	.4byte	0x8a
	.uleb128 0xb
	.4byte	$LC125
	.byte	0x7
	.2byte	0x12d
	.4byte	0x6d
	.uleb128 0xc
	.4byte	0x4c6
	.4byte	$LC127
	.byte	0x20
	.byte	0x7
	.2byte	0x142
	.uleb128 0xd
	.4byte	$LC126
	.byte	0x7
	.2byte	0x143
	.4byte	0x4c6
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x7
	.4byte	0x4d6
	.4byte	0x49d
	.uleb128 0x8
	.4byte	0xfa
	.byte	0x7
	.byte	0x0
	.uleb128 0xb
	.4byte	$LC127
	.byte	0x7
	.2byte	0x144
	.4byte	0x4a9
	.uleb128 0x2
	.4byte	$LC128
	.byte	0x9
	.byte	0x2e
	.4byte	0x18f
	.uleb128 0xe
	.4byte	0x516
	.4byte	$LC129
	.byte	0x8
	.byte	0x9
	.byte	0x39
	.uleb128 0xf
	.4byte	$LC130
	.byte	0x9
	.byte	0x39
	.4byte	0x51c
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC131
	.byte	0x9
	.byte	0x39
	.4byte	0x522
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x10
	.4byte	$LC276
	.byte	0x1
	.uleb128 0xa
	.byte	0x4
	.4byte	0x516
	.uleb128 0xa
	.byte	0x4
	.4byte	0x51c
	.uleb128 0x2
	.4byte	$LC132
	.byte	0x9
	.byte	0x47
	.4byte	0x51c
	.uleb128 0x2
	.4byte	$LC133
	.byte	0x9
	.byte	0x48
	.4byte	0x53e
	.uleb128 0xe
	.4byte	0x575
	.4byte	$LC134
	.byte	0xc
	.byte	0x9
	.byte	0x3c
	.uleb128 0xf
	.4byte	$LC135
	.byte	0x9
	.byte	0x56
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC136
	.byte	0x9
	.byte	0x58
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.uleb128 0xf
	.4byte	$LC137
	.byte	0x9
	.byte	0x59
	.4byte	0x884
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC138
	.byte	0x9
	.byte	0x49
	.4byte	0x580
	.uleb128 0xe
	.4byte	0x5e1
	.4byte	$LC139
	.byte	0x1c
	.byte	0x9
	.byte	0x3d
	.uleb128 0xf
	.4byte	$LC140
	.byte	0x9
	.byte	0x5d
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC141
	.byte	0x9
	.byte	0x66
	.4byte	0x18f
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.uleb128 0xf
	.4byte	$LC142
	.byte	0x9
	.byte	0x69
	.4byte	0x18f
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.uleb128 0xf
	.4byte	$LC143
	.byte	0x9
	.byte	0x6a
	.4byte	0x528
	.byte	0x2
	.byte	0x10
	.uleb128 0xc
	.uleb128 0xf
	.4byte	$LC144
	.byte	0x9
	.byte	0x6b
	.4byte	0x4ed
	.byte	0x2
	.byte	0x10
	.uleb128 0x10
	.uleb128 0xf
	.4byte	$LC145
	.byte	0x9
	.byte	0x6c
	.4byte	0x884
	.byte	0x2
	.byte	0x10
	.uleb128 0x18
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC146
	.byte	0x9
	.byte	0x4a
	.4byte	0x5ec
	.uleb128 0xe
	.4byte	0x615
	.4byte	$LC147
	.byte	0x8
	.byte	0x9
	.byte	0x3e
	.uleb128 0xf
	.4byte	$LC148
	.byte	0x9
	.byte	0x7c
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC149
	.byte	0x9
	.byte	0x7d
	.4byte	0x884
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC150
	.byte	0x9
	.byte	0x4b
	.4byte	0x620
	.uleb128 0xe
	.4byte	0x673
	.4byte	$LC151
	.byte	0x18
	.byte	0x9
	.byte	0x3f
	.uleb128 0xf
	.4byte	$LC152
	.byte	0x9
	.byte	0x85
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC153
	.byte	0x9
	.byte	0x88
	.4byte	0x18f
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.uleb128 0xf
	.4byte	$LC154
	.byte	0x9
	.byte	0x89
	.4byte	0x4ed
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.uleb128 0xf
	.4byte	$LC155
	.byte	0x9
	.byte	0x8b
	.4byte	0x886
	.byte	0x2
	.byte	0x10
	.uleb128 0x10
	.uleb128 0xf
	.4byte	$LC156
	.byte	0x9
	.byte	0x8c
	.4byte	0x884
	.byte	0x2
	.byte	0x10
	.uleb128 0x14
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC157
	.byte	0x9
	.byte	0x4c
	.4byte	0x67e
	.uleb128 0xe
	.4byte	0x6a7
	.4byte	$LC158
	.byte	0x8
	.byte	0x9
	.byte	0x40
	.uleb128 0xf
	.4byte	$LC159
	.byte	0x9
	.byte	0x9a
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC160
	.byte	0x9
	.byte	0x9b
	.4byte	0x884
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC161
	.byte	0x9
	.byte	0x4d
	.4byte	0x6b2
	.uleb128 0xe
	.4byte	0x6db
	.4byte	$LC162
	.byte	0x20
	.byte	0x9
	.byte	0x4d
	.uleb128 0xf
	.4byte	$LC163
	.byte	0x9
	.byte	0xa2
	.4byte	0x575
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC164
	.byte	0x9
	.byte	0xa3
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC165
	.byte	0x9
	.byte	0x4e
	.4byte	0x6e6
	.uleb128 0xe
	.4byte	0x71d
	.4byte	$LC166
	.byte	0xc
	.byte	0x9
	.byte	0x4e
	.uleb128 0xf
	.4byte	$LC167
	.byte	0x9
	.byte	0xa9
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC168
	.byte	0x9
	.byte	0xaa
	.4byte	0x18f
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.uleb128 0xf
	.4byte	$LC169
	.byte	0x9
	.byte	0xab
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC170
	.byte	0x9
	.byte	0x4f
	.4byte	0x728
	.uleb128 0xe
	.4byte	0x797
	.4byte	$LC171
	.byte	0x24
	.byte	0x9
	.byte	0x42
	.uleb128 0xf
	.4byte	$LC172
	.byte	0x9
	.byte	0xb9
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC173
	.byte	0x9
	.byte	0xbc
	.4byte	0x18f
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.uleb128 0xf
	.4byte	$LC174
	.byte	0x9
	.byte	0xbe
	.4byte	0x4ed
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.uleb128 0xf
	.4byte	$LC175
	.byte	0x9
	.byte	0xbf
	.4byte	0x4ed
	.byte	0x2
	.byte	0x10
	.uleb128 0x10
	.uleb128 0xf
	.4byte	$LC176
	.byte	0x9
	.byte	0xc0
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x18
	.uleb128 0xf
	.4byte	$LC177
	.byte	0x9
	.byte	0xc1
	.4byte	0x528
	.byte	0x2
	.byte	0x10
	.uleb128 0x1c
	.uleb128 0xf
	.4byte	$LC178
	.byte	0x9
	.byte	0xc2
	.4byte	0x884
	.byte	0x2
	.byte	0x10
	.uleb128 0x20
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC179
	.byte	0x9
	.byte	0x50
	.4byte	0x7a2
	.uleb128 0xe
	.4byte	0x7cb
	.4byte	$LC180
	.byte	0x8
	.byte	0x9
	.byte	0x43
	.uleb128 0xf
	.4byte	$LC181
	.byte	0x9
	.byte	0xd2
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC182
	.byte	0x9
	.byte	0xd3
	.4byte	0x884
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC183
	.byte	0x9
	.byte	0x51
	.4byte	0x7d6
	.uleb128 0xe
	.4byte	0x845
	.4byte	$LC184
	.byte	0x20
	.byte	0x9
	.byte	0x44
	.uleb128 0xf
	.4byte	$LC185
	.byte	0x9
	.byte	0xda
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC186
	.byte	0x9
	.byte	0xdd
	.4byte	0x18f
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.uleb128 0xf
	.4byte	$LC187
	.byte	0x9
	.byte	0xdf
	.4byte	0x4ed
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.uleb128 0xf
	.4byte	$LC188
	.byte	0x9
	.byte	0xe0
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x10
	.uleb128 0xf
	.4byte	$LC189
	.byte	0x9
	.byte	0xe1
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x14
	.uleb128 0xf
	.4byte	$LC190
	.byte	0x9
	.byte	0xe2
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x18
	.uleb128 0xf
	.4byte	$LC191
	.byte	0x9
	.byte	0xe4
	.4byte	0x884
	.byte	0x2
	.byte	0x10
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC192
	.byte	0x9
	.byte	0x52
	.4byte	0x850
	.uleb128 0xe
	.4byte	0x879
	.4byte	$LC193
	.byte	0x8
	.byte	0x9
	.byte	0x45
	.uleb128 0xf
	.4byte	$LC194
	.byte	0x9
	.byte	0xeb
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC195
	.byte	0x9
	.byte	0xec
	.4byte	0x884
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC196
	.byte	0x9
	.byte	0x53
	.4byte	0x78
	.uleb128 0x11
	.byte	0x4
	.uleb128 0xa
	.byte	0x4
	.4byte	0x575
	.uleb128 0x2
	.4byte	$LC197
	.byte	0xa
	.byte	0x34
	.4byte	0x78
	.uleb128 0x12
	.4byte	0x8bc
	.byte	0x8
	.byte	0xa
	.byte	0x3b
	.uleb128 0xf
	.4byte	$LC198
	.byte	0xa
	.byte	0x39
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0x13
	.ascii	"rem\000"
	.byte	0xa
	.byte	0x3a
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC199
	.byte	0xa
	.byte	0x3b
	.4byte	0x897
	.uleb128 0x12
	.4byte	0x8ec
	.byte	0x8
	.byte	0xa
	.byte	0x40
	.uleb128 0xf
	.4byte	$LC198
	.byte	0xa
	.byte	0x3e
	.4byte	0x129
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0x13
	.ascii	"rem\000"
	.byte	0xa
	.byte	0x3f
	.4byte	0x129
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC200
	.byte	0xa
	.byte	0x40
	.4byte	0x8c7
	.uleb128 0x12
	.4byte	0x91c
	.byte	0x10
	.byte	0xa
	.byte	0x4a
	.uleb128 0xf
	.4byte	$LC198
	.byte	0xa
	.byte	0x47
	.4byte	0x9c
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0x13
	.ascii	"rem\000"
	.byte	0xa
	.byte	0x49
	.4byte	0x9c
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC201
	.byte	0xa
	.byte	0x4a
	.4byte	0x8f7
	.uleb128 0x12
	.4byte	0x94c
	.byte	0x10
	.byte	0xa
	.byte	0x51
	.uleb128 0xf
	.4byte	$LC198
	.byte	0xa
	.byte	0x4f
	.4byte	0x326
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0x13
	.ascii	"rem\000"
	.byte	0xa
	.byte	0x50
	.4byte	0x326
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC202
	.byte	0xa
	.byte	0x51
	.4byte	0x927
	.uleb128 0xe
	.4byte	0x972
	.4byte	$LC203
	.byte	0x8
	.byte	0xb
	.byte	0x3c
	.uleb128 0xf
	.4byte	$LC204
	.byte	0xb
	.byte	0x3d
	.4byte	0x1d1
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC205
	.byte	0xb
	.byte	0x3e
	.4byte	0x957
	.uleb128 0xe
	.4byte	0x9a6
	.4byte	$LC206
	.byte	0x8
	.byte	0xb
	.byte	0x4a
	.uleb128 0xf
	.4byte	$LC207
	.byte	0xb
	.byte	0x4b
	.4byte	0x9a6
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC208
	.byte	0xb
	.byte	0x4c
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x42
	.uleb128 0xe
	.4byte	0xace
	.4byte	$LC209
	.byte	0x58
	.byte	0xb
	.byte	0x69
	.uleb128 0x13
	.ascii	"_p\000"
	.byte	0xb
	.byte	0x6a
	.4byte	0x9a6
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0x13
	.ascii	"_r\000"
	.byte	0xb
	.byte	0x6b
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.uleb128 0x13
	.ascii	"_w\000"
	.byte	0xb
	.byte	0x6c
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.uleb128 0xf
	.4byte	$LC210
	.byte	0xb
	.byte	0x6d
	.4byte	0x54
	.byte	0x2
	.byte	0x10
	.uleb128 0xc
	.uleb128 0xf
	.4byte	$LC211
	.byte	0xb
	.byte	0x6e
	.4byte	0x54
	.byte	0x2
	.byte	0x10
	.uleb128 0xe
	.uleb128 0x13
	.ascii	"_bf\000"
	.byte	0xb
	.byte	0x6f
	.4byte	0x97d
	.byte	0x2
	.byte	0x10
	.uleb128 0x10
	.uleb128 0xf
	.4byte	$LC212
	.byte	0xb
	.byte	0x70
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x18
	.uleb128 0xf
	.4byte	$LC213
	.byte	0xb
	.byte	0x73
	.4byte	0x884
	.byte	0x2
	.byte	0x10
	.uleb128 0x1c
	.uleb128 0xf
	.4byte	$LC214
	.byte	0xb
	.byte	0x74
	.4byte	0xade
	.byte	0x2
	.byte	0x10
	.uleb128 0x20
	.uleb128 0xf
	.4byte	$LC215
	.byte	0xb
	.byte	0x75
	.4byte	0xafe
	.byte	0x2
	.byte	0x10
	.uleb128 0x24
	.uleb128 0xf
	.4byte	$LC216
	.byte	0xb
	.byte	0x76
	.4byte	0xb1e
	.byte	0x2
	.byte	0x10
	.uleb128 0x28
	.uleb128 0xf
	.4byte	$LC217
	.byte	0xb
	.byte	0x77
	.4byte	0xb49
	.byte	0x2
	.byte	0x10
	.uleb128 0x2c
	.uleb128 0xf
	.4byte	$LC218
	.byte	0xb
	.byte	0x7a
	.4byte	0x97d
	.byte	0x2
	.byte	0x10
	.uleb128 0x30
	.uleb128 0x13
	.ascii	"_up\000"
	.byte	0xb
	.byte	0x7d
	.4byte	0x9a6
	.byte	0x2
	.byte	0x10
	.uleb128 0x38
	.uleb128 0x13
	.ascii	"_ur\000"
	.byte	0xb
	.byte	0x7e
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x3c
	.uleb128 0xf
	.4byte	$LC219
	.byte	0xb
	.byte	0x81
	.4byte	0xb4f
	.byte	0x2
	.byte	0x10
	.uleb128 0x40
	.uleb128 0xf
	.4byte	$LC220
	.byte	0xb
	.byte	0x82
	.4byte	0xb5f
	.byte	0x2
	.byte	0x10
	.uleb128 0x43
	.uleb128 0x13
	.ascii	"_lb\000"
	.byte	0xb
	.byte	0x85
	.4byte	0x97d
	.byte	0x2
	.byte	0x10
	.uleb128 0x44
	.uleb128 0xf
	.4byte	$LC221
	.byte	0xb
	.byte	0x88
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x4c
	.uleb128 0xf
	.4byte	$LC222
	.byte	0xb
	.byte	0x89
	.4byte	0x972
	.byte	0x2
	.byte	0x10
	.uleb128 0x50
	.byte	0x0
	.uleb128 0x14
	.4byte	0xade
	.byte	0x1
	.4byte	0x78
	.uleb128 0x15
	.4byte	0x884
	.byte	0x0
	.uleb128 0xa
	.byte	0x4
	.4byte	0xace
	.uleb128 0x14
	.4byte	0xafe
	.byte	0x1
	.4byte	0x78
	.uleb128 0x15
	.4byte	0x884
	.uleb128 0x15
	.4byte	0x19f
	.uleb128 0x15
	.4byte	0x78
	.byte	0x0
	.uleb128 0xa
	.byte	0x4
	.4byte	0xae4
	.uleb128 0x14
	.4byte	0xb1e
	.byte	0x1
	.4byte	0x972
	.uleb128 0x15
	.4byte	0x884
	.uleb128 0x15
	.4byte	0x972
	.uleb128 0x15
	.4byte	0x78
	.byte	0x0
	.uleb128 0xa
	.byte	0x4
	.4byte	0xb04
	.uleb128 0x14
	.4byte	0xb3e
	.byte	0x1
	.4byte	0x78
	.uleb128 0x15
	.4byte	0x884
	.uleb128 0x15
	.4byte	0xb3e
	.uleb128 0x15
	.4byte	0x78
	.byte	0x0
	.uleb128 0xa
	.byte	0x4
	.4byte	0xb44
	.uleb128 0x16
	.4byte	0x101
	.uleb128 0xa
	.byte	0x4
	.4byte	0xb24
	.uleb128 0x7
	.4byte	0xb5f
	.4byte	0x42
	.uleb128 0x8
	.4byte	0xfa
	.byte	0x2
	.byte	0x0
	.uleb128 0x7
	.4byte	0xb6f
	.4byte	0x42
	.uleb128 0x8
	.4byte	0xfa
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC223
	.byte	0xb
	.byte	0x8a
	.4byte	0x9ac
	.uleb128 0x17
	.4byte	0xb9d
	.4byte	$LC227
	.byte	0x4
	.byte	0xc
	.byte	0x18
	.uleb128 0x6
	.4byte	$LC224
	.byte	0xc
	.byte	0x19
	.4byte	0xb9d
	.uleb128 0x6
	.4byte	$LC225
	.byte	0xc
	.byte	0x1a
	.4byte	0xbad
	.byte	0x0
	.uleb128 0x7
	.4byte	0xbad
	.4byte	0x42
	.uleb128 0x8
	.4byte	0xfa
	.byte	0x3
	.byte	0x0
	.uleb128 0x3
	.4byte	$LC226
	.byte	0x4
	.byte	0x4
	.uleb128 0x17
	.4byte	0xbd7
	.4byte	$LC228
	.byte	0x8
	.byte	0xc
	.byte	0x1d
	.uleb128 0x6
	.4byte	$LC224
	.byte	0xc
	.byte	0x1e
	.4byte	0xbd7
	.uleb128 0x6
	.4byte	$LC225
	.byte	0xc
	.byte	0x1f
	.4byte	0xbe7
	.byte	0x0
	.uleb128 0x7
	.4byte	0xbe7
	.4byte	0x42
	.uleb128 0x8
	.4byte	0xfa
	.byte	0x7
	.byte	0x0
	.uleb128 0x3
	.4byte	$LC229
	.byte	0x8
	.byte	0x4
	.uleb128 0x17
	.4byte	0xc11
	.4byte	$LC230
	.byte	0x8
	.byte	0xc
	.byte	0x22
	.uleb128 0x6
	.4byte	$LC224
	.byte	0xc
	.byte	0x23
	.4byte	0xbd7
	.uleb128 0x6
	.4byte	$LC225
	.byte	0xc
	.byte	0x24
	.4byte	0xc11
	.byte	0x0
	.uleb128 0x3
	.4byte	$LC231
	.byte	0x8
	.byte	0x4
	.uleb128 0x18
	.4byte	0xc3d
	.4byte	$LC284
	.byte	0x4
	.byte	0xc
	.byte	0x81
	.uleb128 0x19
	.4byte	$LC232
	.sleb128 -1
	.uleb128 0x1a
	.4byte	$LC233
	.byte	0x0
	.uleb128 0x1a
	.4byte	$LC234
	.byte	0x1
	.uleb128 0x1a
	.4byte	$LC235
	.byte	0x2
	.byte	0x0
	.uleb128 0xe
	.4byte	0xc90
	.4byte	$LC236
	.byte	0x20
	.byte	0xc
	.byte	0x95
	.uleb128 0xf
	.4byte	$LC237
	.byte	0xc
	.byte	0x96
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC238
	.byte	0xc
	.byte	0x97
	.4byte	0x19f
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.uleb128 0xf
	.4byte	$LC239
	.byte	0xc
	.byte	0x98
	.4byte	0xbe7
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.uleb128 0xf
	.4byte	$LC240
	.byte	0xc
	.byte	0x99
	.4byte	0xbe7
	.byte	0x2
	.byte	0x10
	.uleb128 0x10
	.uleb128 0xf
	.4byte	$LC241
	.byte	0xc
	.byte	0x9a
	.4byte	0xbe7
	.byte	0x2
	.byte	0x10
	.uleb128 0x18
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC242
	.byte	0xd
	.byte	0xe9
	.4byte	0xb5
	.uleb128 0xe
	.4byte	0xce0
	.4byte	$LC243
	.byte	0x10
	.byte	0xe
	.byte	0x36
	.uleb128 0xf
	.4byte	$LC238
	.byte	0xe
	.byte	0x38
	.4byte	0xb3e
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC244
	.byte	0xe
	.byte	0x3d
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.uleb128 0xf
	.4byte	$LC245
	.byte	0xe
	.byte	0x3f
	.4byte	0xce0
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.uleb128 0x13
	.ascii	"val\000"
	.byte	0xe
	.byte	0x41
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0xc
	.byte	0x0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x78
	.uleb128 0xe
	.4byte	0xd0f
	.4byte	$LC246
	.byte	0x8
	.byte	0x1
	.byte	0xa
	.uleb128 0xf
	.4byte	$LC247
	.byte	0x1
	.byte	0xb
	.4byte	0xbad
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC248
	.byte	0x1
	.byte	0xc
	.4byte	0xbad
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC246
	.byte	0x1
	.byte	0xd
	.4byte	0xce6
	.uleb128 0x1b
	.byte	0x1
	.4byte	$LC285
	.byte	0x1
	.byte	0xf
	.4byte	$LFB29
	.4byte	$LFE29
	.4byte	$LSFDE0
	.byte	0x1
	.byte	0x6e
	.uleb128 0x1c
	.4byte	0xf54
	.byte	0x1
	.4byte	$LC286
	.byte	0x1
	.byte	0x14
	.byte	0x1
	.4byte	0x78
	.4byte	$LFB31
	.4byte	$LFE31
	.4byte	$LSFDE2
	.byte	0x1
	.byte	0x6e
	.uleb128 0x1d
	.4byte	$LC249
	.byte	0x1
	.byte	0x14
	.4byte	0x78
	.byte	0x3
	.byte	0x91
	.sleb128 192
	.uleb128 0x1d
	.4byte	$LC250
	.byte	0x1
	.byte	0x14
	.4byte	0xf54
	.byte	0x3
	.byte	0x91
	.sleb128 196
	.uleb128 0x1e
	.4byte	$LC251
	.byte	0x1
	.byte	0x15
	.4byte	0x19f
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x1e
	.4byte	$LC243
	.byte	0x1
	.byte	0x16
	.4byte	0x78
	.byte	0x2
	.byte	0x91
	.sleb128 36
	.uleb128 0x1e
	.4byte	$LC252
	.byte	0x1
	.byte	0x17
	.4byte	0x78
	.byte	0x2
	.byte	0x91
	.sleb128 40
	.uleb128 0x1e
	.4byte	$LC253
	.byte	0x1
	.byte	0x18
	.4byte	0x78
	.byte	0x2
	.byte	0x91
	.sleb128 44
	.uleb128 0x1e
	.4byte	$LC254
	.byte	0x1
	.byte	0x19
	.4byte	0x78
	.byte	0x2
	.byte	0x91
	.sleb128 48
	.uleb128 0x1e
	.4byte	$LC255
	.byte	0x1
	.byte	0x1a
	.4byte	0x78
	.byte	0x2
	.byte	0x91
	.sleb128 52
	.uleb128 0x1e
	.4byte	$LC256
	.byte	0x1
	.byte	0x1b
	.4byte	0x78
	.byte	0x2
	.byte	0x91
	.sleb128 56
	.uleb128 0x1e
	.4byte	$LC257
	.byte	0x1
	.byte	0x1c
	.4byte	0x78
	.byte	0x2
	.byte	0x91
	.sleb128 60
	.uleb128 0x1e
	.4byte	$LC258
	.byte	0x1
	.byte	0x1d
	.4byte	0x78
	.byte	0x3
	.byte	0x91
	.sleb128 64
	.uleb128 0x1e
	.4byte	$LC259
	.byte	0x1
	.byte	0x1e
	.4byte	0x19f
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x1e
	.4byte	$LC260
	.byte	0x1
	.byte	0x1f
	.4byte	0x19f
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x1e
	.4byte	$LC261
	.byte	0x1
	.byte	0x20
	.4byte	0x19f
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0x1f
	.ascii	"res\000"
	.byte	0x1
	.byte	0x21
	.4byte	0x19f
	.byte	0x3
	.byte	0x91
	.sleb128 80
	.uleb128 0x1e
	.4byte	$LC262
	.byte	0x1
	.byte	0x22
	.4byte	0x101
	.byte	0x3
	.byte	0x91
	.sleb128 84
	.uleb128 0x1e
	.4byte	$LC263
	.byte	0x1
	.byte	0x23
	.4byte	0xd0f
	.byte	0x3
	.byte	0x91
	.sleb128 88
	.uleb128 0x1e
	.4byte	$LC264
	.byte	0x1
	.byte	0x24
	.4byte	0xd0f
	.byte	0x3
	.byte	0x91
	.sleb128 96
	.uleb128 0x1e
	.4byte	$LC265
	.byte	0x1
	.byte	0x25
	.4byte	0xd0f
	.byte	0x3
	.byte	0x91
	.sleb128 104
	.uleb128 0x1e
	.4byte	$LC266
	.byte	0x1
	.byte	0x26
	.4byte	0x78
	.byte	0x3
	.byte	0x91
	.sleb128 112
	.uleb128 0x1e
	.4byte	$LC267
	.byte	0x1
	.byte	0x26
	.4byte	0x78
	.byte	0x3
	.byte	0x91
	.sleb128 116
	.uleb128 0x1e
	.4byte	$LC268
	.byte	0x1
	.byte	0x27
	.4byte	0xbad
	.byte	0x3
	.byte	0x91
	.sleb128 120
	.uleb128 0x1e
	.4byte	$LC269
	.byte	0x1
	.byte	0x28
	.4byte	0xbad
	.byte	0x3
	.byte	0x91
	.sleb128 124
	.uleb128 0x1e
	.4byte	$LC270
	.byte	0x1
	.byte	0x67
	.4byte	0x78
	.byte	0x3
	.byte	0x91
	.sleb128 128
	.uleb128 0x1e
	.4byte	$LC271
	.byte	0x1
	.byte	0x8f
	.4byte	0xbad
	.byte	0x3
	.byte	0x91
	.sleb128 136
	.uleb128 0x1e
	.4byte	$LC272
	.byte	0x1
	.byte	0x90
	.4byte	0xbad
	.byte	0x3
	.byte	0x91
	.sleb128 140
	.uleb128 0x1e
	.4byte	$LC273
	.byte	0x1
	.byte	0x91
	.4byte	0x78
	.byte	0x3
	.byte	0x91
	.sleb128 132
	.uleb128 0x1e
	.4byte	$LC274
	.byte	0x1
	.byte	0x92
	.4byte	0xbad
	.byte	0x3
	.byte	0x91
	.sleb128 144
	.uleb128 0x1e
	.4byte	$LC275
	.byte	0x1
	.byte	0x92
	.4byte	0xbad
	.byte	0x3
	.byte	0x91
	.sleb128 148
	.uleb128 0x1f
	.ascii	"fp\000"
	.byte	0x1
	.byte	0x94
	.4byte	0xf5f
	.byte	0x3
	.byte	0x91
	.sleb128 152
	.uleb128 0x20
	.4byte	0xf25
	.4byte	$LBB3
	.4byte	$LBE3
	.uleb128 0x1e
	.4byte	$LC270
	.byte	0x1
	.byte	0x81
	.4byte	0x78
	.byte	0x3
	.byte	0x91
	.sleb128 132
	.byte	0x0
	.uleb128 0x21
	.4byte	$LBB4
	.4byte	$LBE4
	.uleb128 0x1f
	.ascii	"y\000"
	.byte	0x1
	.byte	0xa1
	.4byte	0x78
	.byte	0x3
	.byte	0x91
	.sleb128 156
	.uleb128 0x21
	.4byte	$LBB5
	.4byte	$LBE5
	.uleb128 0x1f
	.ascii	"x\000"
	.byte	0x1
	.byte	0xa2
	.4byte	0x78
	.byte	0x3
	.byte	0x91
	.sleb128 160
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.byte	0x4
	.4byte	0xf5a
	.uleb128 0x16
	.4byte	0x19f
	.uleb128 0xa
	.byte	0x4
	.4byte	0xb6f
	.uleb128 0x10
	.4byte	$LC277
	.byte	0x1
	.uleb128 0x22
	.byte	0x1
	.4byte	0xb6f
	.uleb128 0x23
	.4byte	$LC278
	.byte	0xb
	.byte	0x8d
	.4byte	0xf6b
	.byte	0x1
	.byte	0x1
	.uleb128 0x23
	.4byte	$LC279
	.byte	0xd
	.byte	0x9a
	.4byte	0x19f
	.byte	0x1
	.byte	0x1
	.uleb128 0x10
	.4byte	$LC280
	.byte	0x1
	.byte	0x0
	.section	.debug_abbrev
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x10
	.uleb128 0x6
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.uleb128 0x17
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
	.uleb128 0x35
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
	.uleb128 0x13
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x16
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.uleb128 0x17
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x18
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x19
	.uleb128 0x28
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0x0
	.byte	0x0
	.uleb128 0x1a
	.uleb128 0x28
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0x0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x2001
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x2001
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1e
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1f
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x21
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x0
	.uleb128 0x3c
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",@progbits
	.4byte	0x27
	.2byte	0x2
	.4byte	$Ldebug_info0
	.4byte	0xf92
	.4byte	0xd1a
	.ascii	"print_usage\000"
	.4byte	0xd30
	.ascii	"main\000"
	.4byte	0x0
	.section	.debug_aranges,"",@progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	$Ldebug_info0
	.byte	0x4
	.byte	0x0
	.2byte	0x0
	.2byte	0x0
	.4byte	$Ltext0
	.4byte	$Letext0-$Ltext0
	.4byte	0x0
	.4byte	0x0
	.section	.debug_str,"MS",@progbits,1
$LC218:
	.ascii	"_ext\000"
$LC243:
	.ascii	"option\000"
$LC186:
	.ascii	"ptb_lock\000"
$LC122:
	.ascii	"timer_t\000"
$LC138:
	.ascii	"pthread_mutex_t\000"
$LC180:
	.ascii	"__pthread_rwlockattr_st\000"
$LC134:
	.ascii	"__pthread_attr_st\000"
$LC142:
	.ascii	"ptm_interlock\000"
$LC141:
	.ascii	"ptm_lock\000"
$LC30:
	.ascii	"short unsigned int\000"
$LC226:
	.ascii	"float\000"
$LC212:
	.ascii	"_lbfsize\000"
$LC129:
	.ascii	"pthread_queue_t\000"
$LC26:
	.ascii	"unsigned char\000"
$LC269:
	.ascii	"altoRectangulo\000"
$LC242:
	.ascii	"intptr_t\000"
$LC162:
	.ascii	"__pthread_once_st\000"
$LC108:
	.ascii	"mode_t\000"
$LC124:
	.ascii	"useconds_t\000"
$LC187:
	.ascii	"ptb_waiters\000"
$LC182:
	.ascii	"ptra_private\000"
$LC149:
	.ascii	"ptma_private\000"
$LC110:
	.ascii	"off_t\000"
$LC225:
	.ascii	"__val\000"
$LC176:
	.ascii	"ptr_nreaders\000"
$LC280:
	.ascii	"timeval\000"
$LC178:
	.ascii	"ptr_private\000"
$LC206:
	.ascii	"__sbuf\000"
$LC216:
	.ascii	"_seek\000"
$LC59:
	.ascii	"__in_port_t\000"
$LC44:
	.ascii	"size_t\000"
$LC94:
	.ascii	"longlong_t\000"
$LC105:
	.ascii	"id_t\000"
$LC215:
	.ascii	"_read\000"
$LC279:
	.ascii	"optarg\000"
$LC95:
	.ascii	"u_longlong_t\000"
$LC61:
	.ascii	"__off_t\000"
$LC172:
	.ascii	"ptr_magic\000"
$LC181:
	.ascii	"ptra_magic\000"
$LC255:
	.ascii	"encontroConst\000"
$LC245:
	.ascii	"flag\000"
$LC164:
	.ascii	"pto_done\000"
$LC49:
	.ascii	"mips_fpreg_t\000"
$LC67:
	.ascii	"__fsfilcnt_t\000"
$LC123:
	.ascii	"suseconds_t\000"
$LC99:
	.ascii	"fsfilcnt_t\000"
$LC90:
	.ascii	"cpuid_t\000"
$LC252:
	.ascii	"encontroRes\000"
$LC209:
	.ascii	"__sFILE\000"
$LC40:
	.ascii	"__mbstate8\000"
$LC47:
	.ascii	"mips_ureg_t\000"
$LC130:
	.ascii	"ptqh_first\000"
$LC84:
	.ascii	"u_int\000"
$LC68:
	.ascii	"int8_t\000"
$LC125:
	.ascii	"__fd_mask\000"
$LC41:
	.ascii	"__mbstateL\000"
$LC237:
	.ascii	"type\000"
$LC273:
	.ascii	"contadorBrillo\000"
$LC86:
	.ascii	"unchar\000"
$LC97:
	.ascii	"blksize_t\000"
$LC263:
	.ascii	"constanteC\000"
$LC150:
	.ascii	"pthread_cond_t\000"
$LC261:
	.ascii	"output\000"
$LC145:
	.ascii	"ptm_private\000"
$LC239:
	.ascii	"arg1\000"
$LC240:
	.ascii	"arg2\000"
$LC148:
	.ascii	"ptma_magic\000"
$LC199:
	.ascii	"div_t\000"
$LC202:
	.ascii	"qdiv_t\000"
$LC260:
	.ascii	"constante\000"
$LC274:
	.ascii	"temp\000"
$LC51:
	.ascii	"psize_t\000"
$LC208:
	.ascii	"_size\000"
$LC214:
	.ascii	"_close\000"
$LC175:
	.ascii	"ptr_wblocked\000"
$LC106:
	.ascii	"ino_t\000"
$LC205:
	.ascii	"fpos_t\000"
$LC36:
	.ascii	"__uint64_t\000"
$LC249:
	.ascii	"argc\000"
$LC111:
	.ascii	"pid_t\000"
$LC53:
	.ascii	"vsize_t\000"
$LC75:
	.ascii	"uint64_t\000"
$LC238:
	.ascii	"name\000"
$LC127:
	.ascii	"fd_set\000"
$LC250:
	.ascii	"argv\000"
$LC213:
	.ascii	"_cookie\000"
$LC201:
	.ascii	"lldiv_t\000"
$LC207:
	.ascii	"_base\000"
$LC160:
	.ascii	"ptca_private\000"
$LC224:
	.ascii	"__dummy\000"
$LC278:
	.ascii	"__sF\000"
$LC203:
	.ascii	"__sfpos\000"
$LC62:
	.ascii	"__pid_t\000"
$LC221:
	.ascii	"_blksize\000"
$LC232:
	.ascii	"fdlibm_ieee\000"
$LC48:
	.ascii	"long unsigned int\000"
$LC228:
	.ascii	"__double_u\000"
$LC107:
	.ascii	"key_t\000"
$LC93:
	.ascii	"qaddr_t\000"
$LC265:
	.ascii	"pixel\000"
$LC32:
	.ascii	"__uint32_t\000"
$LC183:
	.ascii	"pthread_barrier_t\000"
$LC156:
	.ascii	"ptc_private\000"
$LC264:
	.ascii	"origen\000"
$LC222:
	.ascii	"_offset\000"
$LC198:
	.ascii	"quot\000"
$LC244:
	.ascii	"has_arg\000"
$LC102:
	.ascii	"dev_t\000"
$LC262:
	.ascii	"controli\000"
$LC118:
	.ascii	"clock_t\000"
$LC112:
	.ascii	"lwpid_t\000"
$LC271:
	.ascii	"pasoHorizontal\000"
$LC236:
	.ascii	"exception\000"
$LC219:
	.ascii	"_ubuf\000"
$LC220:
	.ascii	"_nbuf\000"
$LC275:
	.ascii	"valorAbsoluto\000"
$LC28:
	.ascii	"short int\000"
$LC76:
	.ascii	"u_int8_t\000"
$LC157:
	.ascii	"pthread_condattr_t\000"
$LC74:
	.ascii	"int64_t\000"
$LC116:
	.ascii	"uid_t\000"
$LC194:
	.ascii	"ptba_magic\000"
$LC227:
	.ascii	"__float_u\000"
$LC231:
	.ascii	"long double\000"
$LC235:
	.ascii	"fdlibm_posix\000"
$LC35:
	.ascii	"long long int\000"
$LC193:
	.ascii	"__pthread_barrierattr_st\000"
$LC179:
	.ascii	"pthread_rwlockattr_t\000"
$LC103:
	.ascii	"fixpt_t\000"
$LC101:
	.ascii	"daddr_t\000"
$LC286:
	.ascii	"main\000"
$LC37:
	.ascii	"long long unsigned int\000"
$LC283:
	.ascii	"GNU C 3.3.3 (NetBSD nb3 20040520) -g\000"
$LC65:
	.ascii	"__uid_t\000"
$LC266:
	.ascii	"resolucionHorizontal\000"
$LC223:
	.ascii	"FILE\000"
$LC29:
	.ascii	"__uint16_t\000"
$LC109:
	.ascii	"nlink_t\000"
$LC115:
	.ascii	"swblk_t\000"
$LC128:
	.ascii	"pthread_spin_t\000"
$LC114:
	.ascii	"segsz_t\000"
$LC192:
	.ascii	"pthread_barrierattr_t\000"
$LC117:
	.ascii	"dtime_t\000"
$LC42:
	.ascii	"char\000"
$LC200:
	.ascii	"ldiv_t\000"
$LC159:
	.ascii	"ptca_magic\000"
$LC50:
	.ascii	"paddr_t\000"
$LC230:
	.ascii	"__long_double_u\000"
$LC248:
	.ascii	"parteImaginaria\000"
$LC189:
	.ascii	"ptb_curcount\000"
$LC72:
	.ascii	"int32_t\000"
$LC161:
	.ascii	"pthread_once_t\000"
$LC52:
	.ascii	"vaddr_t\000"
$LC195:
	.ascii	"ptba_private\000"
$LC204:
	.ascii	"_pos\000"
$LC136:
	.ascii	"pta_flags\000"
$LC69:
	.ascii	"uint8_t\000"
$LC153:
	.ascii	"ptc_lock\000"
$LC45:
	.ascii	"mips_reg_t\000"
$LC174:
	.ascii	"ptr_rblocked\000"
$LC251:
	.ascii	"pathToExe\000"
$LC100:
	.ascii	"caddr_t\000"
$LC166:
	.ascii	"__pthread_spinlock_st\000"
$LC191:
	.ascii	"ptb_private\000"
$LC171:
	.ascii	"__pthread_rwlock_st\000"
$LC152:
	.ascii	"ptc_magic\000"
$LC88:
	.ascii	"uint\000"
$LC253:
	.ascii	"encontroAlto\000"
$LC158:
	.ascii	"__pthread_condattr_st\000"
$LC241:
	.ascii	"retval\000"
$LC169:
	.ascii	"pts_flags\000"
$LC155:
	.ascii	"ptc_mutex\000"
$LC276:
	.ascii	"__pthread_st\000"
$LC210:
	.ascii	"_flags\000"
$LC170:
	.ascii	"pthread_rwlock_t\000"
$LC38:
	.ascii	"__intptr_t\000"
$LC185:
	.ascii	"ptb_magic\000"
$LC70:
	.ascii	"int16_t\000"
$LC246:
	.ascii	"complejo\000"
$LC96:
	.ascii	"blkcnt_t\000"
$LC197:
	.ascii	"wchar_t\000"
$LC163:
	.ascii	"pto_mutex\000"
$LC234:
	.ascii	"fdlibm_xopen\000"
$LC267:
	.ascii	"resolucionVertical\000"
$LC165:
	.ascii	"pthread_spinlock_t\000"
$LC247:
	.ascii	"parteReal\000"
$LC137:
	.ascii	"pta_private\000"
$LC25:
	.ascii	"signed char\000"
$LC282:
	.ascii	"/root/home/root/orga_compu\000"
$LC139:
	.ascii	"__pthread_mutex_st\000"
$LC60:
	.ascii	"__mode_t\000"
$LC54:
	.ascii	"register_t\000"
$LC144:
	.ascii	"ptm_blocked\000"
$LC284:
	.ascii	"fdversion\000"
$LC121:
	.ascii	"clockid_t\000"
$LC190:
	.ascii	"ptb_generation\000"
$LC33:
	.ascii	"unsigned int\000"
$LC92:
	.ascii	"quad_t\000"
$LC85:
	.ascii	"u_long\000"
$LC177:
	.ascii	"ptr_writer\000"
$LC173:
	.ascii	"ptr_interlock\000"
$LC79:
	.ascii	"u_int64_t\000"
$LC146:
	.ascii	"pthread_mutexattr_t\000"
$LC143:
	.ascii	"ptm_owner\000"
$LC196:
	.ascii	"pthread_key_t\000"
$LC89:
	.ascii	"ulong\000"
$LC82:
	.ascii	"u_char\000"
$LC64:
	.ascii	"__socklen_t\000"
$LC119:
	.ascii	"ssize_t\000"
$LC151:
	.ascii	"__pthread_cond_st\000"
$LC34:
	.ascii	"__int64_t\000"
$LC132:
	.ascii	"pthread_t\000"
$LC281:
	.ascii	"tp0f.c\000"
$LC257:
	.ascii	"encontroOrigen\000"
$LC272:
	.ascii	"pasoVertical\000"
$LC211:
	.ascii	"_file\000"
$LC80:
	.ascii	"in_addr_t\000"
$LC23:
	.ascii	"__int8_t\000"
$LC66:
	.ascii	"__fsblkcnt_t\000"
$LC104:
	.ascii	"gid_t\000"
$LC270:
	.ascii	"scanResult\000"
$LC98:
	.ascii	"fsblkcnt_t\000"
$LC254:
	.ascii	"encontroAncho\000"
$LC55:
	.ascii	"__cpu_simple_lock_t\000"
$LC78:
	.ascii	"u_int32_t\000"
$LC258:
	.ascii	"salidaConsola\000"
$LC168:
	.ascii	"pts_spin\000"
$LC256:
	.ascii	"encontroOutput\000"
$LC43:
	.ascii	"__mbstate_t\000"
$LC268:
	.ascii	"anchoRectangulo\000"
$LC131:
	.ascii	"ptqh_last\000"
$LC87:
	.ascii	"ushort\000"
$LC39:
	.ascii	"__uintptr_t\000"
$LC57:
	.ascii	"__gid_t\000"
$LC233:
	.ascii	"fdlibm_svid\000"
$LC31:
	.ascii	"__int32_t\000"
$LC188:
	.ascii	"ptb_initcount\000"
$LC147:
	.ascii	"__pthread_mutexattr_st\000"
$LC217:
	.ascii	"_write\000"
$LC24:
	.ascii	"__uint8_t\000"
$LC126:
	.ascii	"fds_bits\000"
$LC135:
	.ascii	"pta_magic\000"
$LC285:
	.ascii	"print_usage\000"
$LC277:
	.ascii	"__pthread_spin_st\000"
$LC71:
	.ascii	"uint16_t\000"
$LC46:
	.ascii	"long int\000"
$LC73:
	.ascii	"uint32_t\000"
$LC133:
	.ascii	"pthread_attr_t\000"
$LC56:
	.ascii	"__caddr_t\000"
$LC81:
	.ascii	"in_port_t\000"
$LC184:
	.ascii	"__pthread_barrier_st\000"
$LC77:
	.ascii	"u_int16_t\000"
$LC259:
	.ascii	"ptrOrigen\000"
$LC229:
	.ascii	"double\000"
$LC120:
	.ascii	"time_t\000"
$LC140:
	.ascii	"ptm_magic\000"
$LC91:
	.ascii	"u_quad_t\000"
$LC167:
	.ascii	"pts_magic\000"
$LC58:
	.ascii	"__in_addr_t\000"
$LC113:
	.ascii	"rlim_t\000"
$LC63:
	.ascii	"__sa_family_t\000"
$LC83:
	.ascii	"u_short\000"
$LC27:
	.ascii	"__int16_t\000"
$LC154:
	.ascii	"ptc_waiters\000"
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
