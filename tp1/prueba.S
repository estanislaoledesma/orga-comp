	.file	1 "prueba.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.rdata
	.align	2
$LC0:
	.ascii	"Hola\n\000"
	.text
	.align	2
	.globl	hola_mundo
	.ent	hola_mundo
hola_mundo:
	.frame	$fp,40,$ra		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$ra,32($sp)
	sw	$fp,28($sp)
	sw	$gp,24($sp)
	move	$fp,$sp
	sw	$a0,40($fp)
	lw	$v1,40($fp)
	li	$v0,3			# 0x3
	sw	$v0,0($v1)
	lw	$a1,40($fp)
	lw	$v0,40($fp)
	lw	$v1,40($fp)
	lw	$a0,20($v0)
	lw	$v0,24($v1)
	addu	$v0,$a0,$v0
	sw	$v0,16($a1)
	la	$a0,$LC0
	la	$t9,printf
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	hola_mundo
	.size	hola_mundo, .-hola_mundo
	.align	2
	.globl	main
	.ent	main
main:
	.frame	$fp,88,$ra		# vars= 48, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,88
	.cprestore 16
	sw	$ra,80($sp)
	sw	$fp,76($sp)
	sw	$gp,72($sp)
	move	$fp,$sp
	sw	$a0,88($fp)
	sw	$a1,92($fp)
	li	$v0,1			# 0x1
	sw	$v0,24($fp)
	li	$v0,1			# 0x1
	sw	$v0,28($fp)
	li	$v0,1			# 0x1
	sw	$v0,32($fp)
	li	$v0,1			# 0x1
	sw	$v0,36($fp)
	li	$v0,1			# 0x1
	sw	$v0,40($fp)
	li	$v0,1			# 0x1
	sw	$v0,44($fp)
	li	$v0,1			# 0x1
	sw	$v0,48($fp)
	addu	$a0,$fp,24
	la	$t9,hola_mundo
	jal	$ra,$t9
	move	$v0,$zero
	move	$sp,$fp
	lw	$ra,80($sp)
	lw	$fp,76($sp)
	addu	$sp,$sp,88
	j	$ra
	.end	main
	.size	main, .-main
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
