	.set	noreorder
	.set	nomacro
	j	main
	
factorial:
	addiu	$sp,$sp,-16
	sw	$fp,8($sp)
	nop
	nop
	nop
	nop
	nop
	move	$fp,$sp
	sw	$4,16($fp)
	nop
	nop
	nop
	nop
	nop
	lw	$2,16($fp)
	nop
	nop
	nop
	nop
	nop
	slt	$2,$2,2
	beq	$2,$0,$L2
	nop

	li	$2,1			# 0x1
	sw	$2,0($fp)
	nop
	nop
	nop
	nop
	nop
	j	$L4
	nop

$L2:
	sw	$0,0($fp)
	nop
	nop
	nop
	nop
	nop
$L4:
	lw	$2,0($fp)
	nop
	nop
	nop
	nop
	nop
	move	$sp,$fp
	lw	$fp,8($sp)
	nop
	nop
	nop
	nop
	nop
	addiu	$sp,$sp,16
	j	$31
	nop

main:
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	nop
	nop
	nop
	nop
	nop
	sw	$fp,24($sp)
	nop
	nop
	nop
	nop
	nop
	move	$fp,$sp
	sw	$0,20($fp)
	nop
	nop
	nop
	nop
	nop
	li	$2,16			# 0x10
	sw	$2,16($fp)
	nop
	nop
	nop
	nop
	nop
	lw	$3,20($fp)
	nop
	nop
	nop
	nop
	nop
	li	$2,3			# 0x3
	sw	$2,0($3)
	nop
	nop
	nop
	nop
	nop
	li	$4,3			# 0x3
	jal	factorial
	nop

	move	$3,$2
	lw	$2,16($fp)
	nop
	nop
	nop
	nop
	nop
	sw	$3,0($2)
	nop
	nop
	nop
	nop
	nop
	move	$sp,$fp
	lw	$31,28($sp)
	nop
	nop
	nop
	nop
	nop
	lw	$fp,24($sp)
	nop
	nop
	nop
	nop
	nop
	addiu	$sp,$sp,32
