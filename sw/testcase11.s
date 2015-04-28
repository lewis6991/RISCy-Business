		.set	noreorder
		.set	nomacro
		nop
		nop
		nop
		nop
        j main
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
	isAvailable:
		nop
		nop
		nop
		nop
 		addiu	$sp,$sp,-32
		nop
		nop
		nop
		nop
 		sw	$fp,24($sp)
		nop
		nop
		nop
		nop
 		move	$fp,$sp
		nop
		nop
		nop
		nop
 		sw	$4,32($fp)
		nop
		nop
		nop
		nop
 		sw	$5,36($fp)
		nop
		nop
		nop
		nop
 		sw	$6,40($fp)
		nop
		nop
		nop
		nop
 		sw	$7,44($fp)
		nop
		nop
		nop
		nop
 		lw	$4,36($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		li	$2,1431633920			# 0x55550000
		nop
		nop
		nop
		nop
 		ori	$2,$2,0x5556
		nop
		nop
		nop
		nop
 		mult	$4,$2
		nop
		nop
		nop
		nop
 		mfhi	$3
		nop
		nop
		nop
		nop
 		sra	$2,$4,31
		nop
		nop
		nop
		nop
 		subu	$3,$3,$2
		nop
		nop
		nop
		nop
 		move	$2,$3
		nop
		nop
		nop
		nop
 		sll	$2,$2,1
		nop
		nop
		nop
		nop
 		addu	$2,$2,$3
		nop
		nop
		nop
		nop
 		sw	$2,12($fp)
		nop
		nop
		nop
		nop
 		lw	$4,40($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		li	$2,1431633920			# 0x55550000
		nop
		nop
		nop
		nop
 		ori	$2,$2,0x5556
		nop
		nop
		nop
		nop
 		mult	$4,$2
		nop
		nop
		nop
		nop
 		mfhi	$3
		nop
		nop
		nop
		nop
 		sra	$2,$4,31
		nop
		nop
		nop
		nop
 		subu	$3,$3,$2
		nop
		nop
		nop
		nop
 		move	$2,$3
		nop
		nop
		nop
		nop
 		sll	$2,$2,1
		nop
		nop
		nop
		nop
 		addu	$2,$2,$3
		nop
		nop
		nop
		nop
 		sw	$2,8($fp)
		nop
		nop
		nop
		nop
 		sw	$0,4($fp)
		nop
		nop
		nop
		nop
 		j	$L2
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
	$L3:
		nop
		nop
		nop
		nop
 		lw	$2,36($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		sll	$3,$2,2
		nop
		nop
		nop
		nop
 		sll	$2,$3,3
		nop
		nop
		nop
		nop
 		addu	$2,$3,$2
		nop
		nop
		nop
		nop
 		move	$3,$2
		nop
		nop
		nop
		nop
 		lw	$2,32($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		addu	$3,$3,$2
		nop
		nop
		nop
		nop
 		lw	$2,4($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		sll	$2,$2,2
		nop
		nop
		nop
		nop
 		addu	$2,$2,$3
		nop
		nop
		nop
		nop
 		lw	$3,0($2)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		lw	$2,44($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		bne	$3,$2,$L4
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
 		sw	$0,20($fp)
		nop
		nop
		nop
		nop
 		j	$L6
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
	$L4:
		nop
		nop
		nop
		nop
 		lw	$2,4($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		sll	$3,$2,2
		nop
		nop
		nop
		nop
 		sll	$2,$3,3
		nop
		nop
		nop
		nop
 		addu	$2,$3,$2
		nop
		nop
		nop
		nop
 		move	$3,$2
		nop
		nop
		nop
		nop
 		lw	$2,32($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		addu	$3,$3,$2
		nop
		nop
		nop
		nop
 		lw	$2,40($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		sll	$2,$2,2
		nop
		nop
		nop
		nop
 		addu	$2,$2,$3
		nop
		nop
		nop
		nop
 		lw	$3,0($2)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		lw	$2,44($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		bne	$3,$2,$L7
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
 		sw	$0,20($fp)
		nop
		nop
		nop
		nop
 		j	$L6
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
	$L7:
		nop
		nop
		nop
		nop
 		lw	$4,4($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		li	$2,1431633920			# 0x55550000
		nop
		nop
		nop
		nop
 		ori	$2,$2,0x5556
		nop
		nop
		nop
		nop
 		mult	$4,$2
		nop
		nop
		nop
		nop
 		mfhi	$3
		nop
		nop
		nop
		nop
 		sra	$2,$4,31
		nop
		nop
		nop
		nop
 		subu	$3,$3,$2
		nop
		nop
		nop
		nop
 		sw	$3,16($fp)
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
		nop
		nop
		nop
		nop
 		sll	$2,$2,1
		nop
		nop
		nop
		nop
 		lw	$3,16($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		addu	$2,$2,$3
		nop
		nop
		nop
		nop
 		subu	$4,$4,$2
		nop
		nop
		nop
		nop
 		sw	$4,16($fp)
		nop
		nop
		nop
		nop
 		lw	$2,12($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		lw	$3,16($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		addu	$2,$3,$2
		nop
		nop
		nop
		nop
 		sll	$3,$2,2
		nop
		nop
		nop
		nop
 		sll	$2,$3,3
		nop
		nop
		nop
		nop
 		addu	$2,$3,$2
		nop
		nop
		nop
		nop
 		move	$3,$2
		nop
		nop
		nop
		nop
 		lw	$2,32($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		addu	$5,$3,$2
		nop
		nop
		nop
		nop
 		lw	$4,4($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		li	$2,1431633920			# 0x55550000
		nop
		nop
		nop
		nop
 		ori	$2,$2,0x5556
		nop
		nop
		nop
		nop
 		mult	$4,$2
		nop
		nop
		nop
		nop
 		mfhi	$3
		nop
		nop
		nop
		nop
 		sra	$2,$4,31
		nop
		nop
		nop
		nop
 		subu	$3,$3,$2
		nop
		nop
		nop
		nop
 		lw	$2,8($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		addu	$2,$3,$2
		nop
		nop
		nop
		nop
 		sll	$2,$2,2
		nop
		nop
		nop
		nop
 		addu	$2,$2,$5
		nop
		nop
		nop
		nop
 		lw	$3,0($2)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		lw	$2,44($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		bne	$3,$2,$L9
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
 		sw	$0,20($fp)
		nop
		nop
		nop
		nop
 		j	$L6
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
	$L9:
		nop
		nop
		nop
		nop
 		lw	$2,4($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		addiu	$2,$2,1
		nop
		nop
		nop
		nop
 		sw	$2,4($fp)
		nop
		nop
		nop
		nop
	$L2:
		nop
		nop
		nop
		nop
 		lw	$2,4($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		slt	$2,$2,9
		nop
		nop
		nop
		nop
 		bne	$2,$0,$L3
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
 		li	$2,1			# 0x1
		nop
		nop
		nop
		nop
 		sw	$2,20($fp)
		nop
		nop
		nop
		nop
	$L6:
		nop
		nop
		nop
		nop
 		lw	$2,20($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		move	$sp,$fp
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
		nop
		nop
		nop
		nop
 		addiu	$sp,$sp,32
		nop
		nop
		nop
		nop
 		j	$31
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
	fillSudoku:
		nop
		nop
		nop
		nop
 		addiu	$sp,$sp,-40
		nop
		nop
		nop
		nop
 		sw	$31,36($sp)
		nop
		nop
		nop
		nop
 		sw	$fp,32($sp)
		nop
		nop
		nop
		nop
 		move	$fp,$sp
		nop
		nop
		nop
		nop
 		sw	$4,40($fp)
		nop
		nop
		nop
		nop
 		sw	$5,44($fp)
		nop
		nop
		nop
		nop
 		sw	$6,48($fp)
		nop
		nop
		nop
		nop
 		lw	$2,44($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		slt	$2,$2,9
		nop
		nop
		nop
		nop
 		beq	$2,$0,$L14
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
 		lw	$2,48($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		slt	$2,$2,9
		nop
		nop
		nop
		nop
 		beq	$2,$0,$L14
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
 		lw	$2,44($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		sll	$3,$2,2
		nop
		nop
		nop
		nop
 		sll	$2,$3,3
		nop
		nop
		nop
		nop
 		addu	$2,$3,$2
		nop
		nop
		nop
		nop
 		move	$3,$2
		nop
		nop
		nop
		nop
 		lw	$2,40($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		addu	$3,$3,$2
		nop
		nop
		nop
		nop
 		lw	$2,48($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		sll	$2,$2,2
		nop
		nop
		nop
		nop
 		addu	$2,$2,$3
		nop
		nop
		nop
		nop
 		lw	$2,0($2)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		beq	$2,$0,$L17
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
 		lw	$2,48($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		slt	$2,$2,8
		nop
		nop
		nop
		nop
 		beq	$2,$0,$L19
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
 		lw	$2,48($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		addiu	$2,$2,1
		nop
		nop
		nop
		nop
 		lw	$4,40($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		lw	$5,44($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		move	$6,$2
		nop
		nop
		nop
		nop
 		jal	fillSudoku
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
 		sw	$2,24($fp)
		nop
		nop
		nop
		nop
 		j	$L21
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
	$L19:
		nop
		nop
		nop
		nop
 		lw	$2,44($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		slt	$2,$2,8
		nop
		nop
		nop
		nop
 		beq	$2,$0,$L22
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
 		lw	$2,44($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		addiu	$2,$2,1
		nop
		nop
		nop
		nop
 		lw	$4,40($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		move	$5,$2
		nop
		nop
		nop
		nop
 		move	$6,$0
		nop
		nop
		nop
		nop
 		jal	fillSudoku
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
 		sw	$2,24($fp)
		nop
		nop
		nop
		nop
 		j	$L21
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
	$L22:
		nop
		nop
		nop
		nop
 		li	$2,1			# 0x1
		nop
		nop
		nop
		nop
 		sw	$2,24($fp)
		nop
		nop
		nop
		nop
 		j	$L21
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
	$L17:
		nop
		nop
		nop
		nop
 		sw	$0,16($fp)
		nop
		nop
		nop
		nop
 		j	$L24
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
	$L25:
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
		nop
		nop
		nop
		nop
 		addiu	$2,$2,1
		nop
		nop
		nop
		nop
 		lw	$4,40($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		lw	$5,44($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		lw	$6,48($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		move	$7,$2
		nop
		nop
		nop
		nop
 		jal	isAvailable
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
 		beq	$2,$0,$L26
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
 		lw	$2,44($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		sll	$3,$2,2
		nop
		nop
		nop
		nop
 		sll	$2,$3,3
		nop
		nop
		nop
		nop
 		addu	$2,$3,$2
		nop
		nop
		nop
		nop
 		move	$3,$2
		nop
		nop
		nop
		nop
 		lw	$2,40($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		addu	$5,$3,$2
		nop
		nop
		nop
		nop
 		lw	$3,48($fp)
		nop
		nop
		nop
		nop
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
		nop
		nop
		nop
		nop
 		addiu	$4,$2,1
		nop
		nop
		nop
		nop
 		sll	$2,$3,2
		nop
		nop
		nop
		nop
 		addu	$2,$2,$5
		nop
		nop
		nop
		nop
 		sw	$4,0($2)
		nop
		nop
		nop
		nop
 		lw	$2,48($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		slt	$2,$2,8
		nop
		nop
		nop
		nop
 		beq	$2,$0,$L28
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
 		lw	$2,48($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		addiu	$2,$2,1
		nop
		nop
		nop
		nop
 		lw	$4,40($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		lw	$5,44($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		move	$6,$2
		nop
		nop
		nop
		nop
 		jal	fillSudoku
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
 		beq	$2,$0,$L30
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
 		li	$2,1			# 0x1
		nop
		nop
		nop
		nop
 		sw	$2,24($fp)
		nop
		nop
		nop
		nop
 		j	$L21
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
	$L30:
		nop
		nop
		nop
		nop
 		lw	$2,44($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		sll	$3,$2,2
		nop
		nop
		nop
		nop
 		sll	$2,$3,3
		nop
		nop
		nop
		nop
 		addu	$2,$3,$2
		nop
		nop
		nop
		nop
 		move	$3,$2
		nop
		nop
		nop
		nop
 		lw	$2,40($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		addu	$3,$3,$2
		nop
		nop
		nop
		nop
 		lw	$2,48($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		sll	$2,$2,2
		nop
		nop
		nop
		nop
 		addu	$2,$2,$3
		nop
		nop
		nop
		nop
 		sw	$0,0($2)
		nop
		nop
		nop
		nop
 		j	$L26
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
	$L28:
		nop
		nop
		nop
		nop
 		lw	$2,44($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		slt	$2,$2,8
		nop
		nop
		nop
		nop
 		beq	$2,$0,$L32
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
 		lw	$2,44($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		addiu	$2,$2,1
		nop
		nop
		nop
		nop
 		lw	$4,40($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		move	$5,$2
		nop
		nop
		nop
		nop
 		move	$6,$0
		nop
		nop
		nop
		nop
 		jal	fillSudoku
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
 		beq	$2,$0,$L34
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
 		li	$2,1			# 0x1
		nop
		nop
		nop
		nop
 		sw	$2,24($fp)
		nop
		nop
		nop
		nop
 		j	$L21
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
	$L34:
		nop
		nop
		nop
		nop
 		lw	$2,44($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		sll	$3,$2,2
		nop
		nop
		nop
		nop
 		sll	$2,$3,3
		nop
		nop
		nop
		nop
 		addu	$2,$3,$2
		nop
		nop
		nop
		nop
 		move	$3,$2
		nop
		nop
		nop
		nop
 		lw	$2,40($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		addu	$3,$3,$2
		nop
		nop
		nop
		nop
 		lw	$2,48($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		sll	$2,$2,2
		nop
		nop
		nop
		nop
 		addu	$2,$2,$3
		nop
		nop
		nop
		nop
 		sw	$0,0($2)
		nop
		nop
		nop
		nop
 		j	$L26
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
	$L32:
		nop
		nop
		nop
		nop
 		li	$2,1			# 0x1
		nop
		nop
		nop
		nop
 		sw	$2,24($fp)
		nop
		nop
		nop
		nop
 		j	$L21
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
	$L26:
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
		nop
		nop
		nop
		nop
 		addiu	$2,$2,1
		nop
		nop
		nop
		nop
 		sw	$2,16($fp)
		nop
		nop
		nop
		nop
	$L24:
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
		nop
		nop
		nop
		nop
 		slt	$2,$2,9
		nop
		nop
		nop
		nop
 		bne	$2,$0,$L25
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
 		sw	$0,24($fp)
		nop
		nop
		nop
		nop
 		j	$L21
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
	$L14:
		nop
		nop
		nop
		nop
 		li	$2,1			# 0x1
		nop
		nop
		nop
		nop
 		sw	$2,24($fp)
		nop
		nop
		nop
		nop
	$L21:
		nop
		nop
		nop
		nop
 		lw	$2,24($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		move	$sp,$fp
		nop
		nop
		nop
		nop
 		lw	$31,36($sp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		lw	$fp,32($sp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		addiu	$sp,$sp,40
		nop
		nop
		nop
		nop
 		j	$31
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
	main:
		nop
		nop
		nop
		nop
 		addiu	$sp,$sp,-360
		nop
		nop
		nop
		nop
 		sw	$31,356($sp)
		nop
		nop
		nop
		nop
 		sw	$fp,352($sp)
		nop
		nop
		nop
		nop
 		move	$fp,$sp
		nop
		nop
		nop
		nop
 		sw	$0,28($fp)
		nop
		nop
		nop
		nop
 		sw	$0,32($fp)
		nop
		nop
		nop
		nop
 		sw	$0,36($fp)
		nop
		nop
		nop
		nop
 		sw	$0,40($fp)
		nop
		nop
		nop
		nop
 		sw	$0,44($fp)
		nop
		nop
		nop
		nop
 		sw	$0,48($fp)
		nop
		nop
		nop
		nop
 		sw	$0,52($fp)
		nop
		nop
		nop
		nop
 		li	$2,9			# 0x9
		nop
		nop
		nop
		nop
 		sw	$2,56($fp)
		nop
		nop
		nop
		nop
 		sw	$0,60($fp)
		nop
		nop
		nop
		nop
 		li	$2,1			# 0x1
		nop
		nop
		nop
		nop
 		sw	$2,64($fp)
		nop
		nop
		nop
		nop
 		li	$2,9			# 0x9
		nop
		nop
		nop
		nop
 		sw	$2,68($fp)
		nop
		nop
		nop
		nop
 		sw	$0,72($fp)
		nop
		nop
		nop
		nop
 		li	$2,4			# 0x4
		nop
		nop
		nop
		nop
 		sw	$2,76($fp)
		nop
		nop
		nop
		nop
 		li	$2,7			# 0x7
		nop
		nop
		nop
		nop
 		sw	$2,80($fp)
		nop
		nop
		nop
		nop
 		sw	$0,84($fp)
		nop
		nop
		nop
		nop
 		li	$2,6			# 0x6
		nop
		nop
		nop
		nop
 		sw	$2,88($fp)
		nop
		nop
		nop
		nop
 		sw	$0,92($fp)
		nop
		nop
		nop
		nop
 		li	$2,8			# 0x8
		nop
		nop
		nop
		nop
 		sw	$2,96($fp)
		nop
		nop
		nop
		nop
 		sw	$0,100($fp)
		nop
		nop
		nop
		nop
 		li	$2,5			# 0x5
		nop
		nop
		nop
		nop
 		sw	$2,104($fp)
		nop
		nop
		nop
		nop
 		li	$2,2			# 0x2
		nop
		nop
		nop
		nop
 		sw	$2,108($fp)
		nop
		nop
		nop
		nop
 		li	$2,8			# 0x8
		nop
		nop
		nop
		nop
 		sw	$2,112($fp)
		nop
		nop
		nop
		nop
 		li	$2,1			# 0x1
		nop
		nop
		nop
		nop
 		sw	$2,116($fp)
		nop
		nop
		nop
		nop
 		li	$2,9			# 0x9
		nop
		nop
		nop
		nop
 		sw	$2,120($fp)
		nop
		nop
		nop
		nop
 		li	$2,4			# 0x4
		nop
		nop
		nop
		nop
 		sw	$2,124($fp)
		nop
		nop
		nop
		nop
 		sw	$0,128($fp)
		nop
		nop
		nop
		nop
 		li	$2,7			# 0x7
		nop
		nop
		nop
		nop
 		sw	$2,132($fp)
		nop
		nop
		nop
		nop
 		li	$2,2			# 0x2
		nop
		nop
		nop
		nop
 		sw	$2,136($fp)
		nop
		nop
		nop
		nop
 		sw	$0,140($fp)
		nop
		nop
		nop
		nop
 		sw	$0,144($fp)
		nop
		nop
		nop
		nop
 		sw	$0,148($fp)
		nop
		nop
		nop
		nop
 		li	$2,4			# 0x4
		nop
		nop
		nop
		nop
 		sw	$2,152($fp)
		nop
		nop
		nop
		nop
 		li	$2,8			# 0x8
		nop
		nop
		nop
		nop
 		sw	$2,156($fp)
		nop
		nop
		nop
		nop
 		sw	$0,160($fp)
		nop
		nop
		nop
		nop
 		sw	$0,164($fp)
		nop
		nop
		nop
		nop
 		sw	$0,168($fp)
		nop
		nop
		nop
		nop
 		sw	$0,172($fp)
		nop
		nop
		nop
		nop
 		sw	$0,176($fp)
		nop
		nop
		nop
		nop
 		li	$2,9			# 0x9
		nop
		nop
		nop
		nop
 		sw	$2,180($fp)
		nop
		nop
		nop
		nop
 		sw	$0,184($fp)
		nop
		nop
		nop
		nop
 		sw	$0,188($fp)
		nop
		nop
		nop
		nop
 		sw	$0,192($fp)
		nop
		nop
		nop
		nop
 		li	$2,5			# 0x5
		nop
		nop
		nop
		nop
 		sw	$2,196($fp)
		nop
		nop
		nop
		nop
 		sw	$0,200($fp)
		nop
		nop
		nop
		nop
 		sw	$0,204($fp)
		nop
		nop
		nop
		nop
 		sw	$0,208($fp)
		nop
		nop
		nop
		nop
 		sw	$0,212($fp)
		nop
		nop
		nop
		nop
 		sw	$0,216($fp)
		nop
		nop
		nop
		nop
 		li	$2,7			# 0x7
		nop
		nop
		nop
		nop
 		sw	$2,220($fp)
		nop
		nop
		nop
		nop
 		li	$2,5			# 0x5
		nop
		nop
		nop
		nop
 		sw	$2,224($fp)
		nop
		nop
		nop
		nop
 		sw	$0,228($fp)
		nop
		nop
		nop
		nop
 		sw	$0,232($fp)
		nop
		nop
		nop
		nop
 		sw	$0,236($fp)
		nop
		nop
		nop
		nop
 		li	$2,9			# 0x9
		nop
		nop
		nop
		nop
 		sw	$2,240($fp)
		nop
		nop
		nop
		nop
 		li	$2,9			# 0x9
		nop
		nop
		nop
		nop
 		sw	$2,244($fp)
		nop
		nop
		nop
		nop
 		sw	$0,248($fp)
		nop
		nop
		nop
		nop
 		li	$2,7			# 0x7
		nop
		nop
		nop
		nop
 		sw	$2,252($fp)
		nop
		nop
		nop
		nop
 		li	$2,3			# 0x3
		nop
		nop
		nop
		nop
 		sw	$2,256($fp)
		nop
		nop
		nop
		nop
 		li	$2,6			# 0x6
		nop
		nop
		nop
		nop
 		sw	$2,260($fp)
		nop
		nop
		nop
		nop
 		li	$2,4			# 0x4
		nop
		nop
		nop
		nop
 		sw	$2,264($fp)
		nop
		nop
		nop
		nop
 		li	$2,1			# 0x1
		nop
		nop
		nop
		nop
 		sw	$2,268($fp)
		nop
		nop
		nop
		nop
 		li	$2,8			# 0x8
		nop
		nop
		nop
		nop
 		sw	$2,272($fp)
		nop
		nop
		nop
		nop
 		sw	$0,276($fp)
		nop
		nop
		nop
		nop
 		li	$2,5			# 0x5
		nop
		nop
		nop
		nop
 		sw	$2,280($fp)
		nop
		nop
		nop
		nop
 		sw	$0,284($fp)
		nop
		nop
		nop
		nop
 		li	$2,6			# 0x6
		nop
		nop
		nop
		nop
 		sw	$2,288($fp)
		nop
		nop
		nop
		nop
 		sw	$0,292($fp)
		nop
		nop
		nop
		nop
 		li	$2,8			# 0x8
		nop
		nop
		nop
		nop
 		sw	$2,296($fp)
		nop
		nop
		nop
		nop
 		li	$2,1			# 0x1
		nop
		nop
		nop
		nop
 		sw	$2,300($fp)
		nop
		nop
		nop
		nop
 		sw	$0,304($fp)
		nop
		nop
		nop
		nop
 		li	$2,7			# 0x7
		nop
		nop
		nop
		nop
 		sw	$2,308($fp)
		nop
		nop
		nop
		nop
 		li	$2,4			# 0x4
		nop
		nop
		nop
		nop
 		sw	$2,312($fp)
		nop
		nop
		nop
		nop
 		sw	$0,316($fp)
		nop
		nop
		nop
		nop
 		li	$2,8			# 0x8
		nop
		nop
		nop
		nop
 		sw	$2,320($fp)
		nop
		nop
		nop
		nop
 		sw	$0,324($fp)
		nop
		nop
		nop
		nop
 		sw	$0,328($fp)
		nop
		nop
		nop
		nop
 		sw	$0,332($fp)
		nop
		nop
		nop
		nop
 		sw	$0,336($fp)
		nop
		nop
		nop
		nop
 		sw	$0,340($fp)
		nop
		nop
		nop
		nop
 		sw	$0,344($fp)
		nop
		nop
		nop
		nop
 		sw	$0,348($fp)
		nop
		nop
		nop
		nop
 		sw	$0,16($fp)
		nop
		nop
		nop
		nop
 		addiu	$2,$fp,28
		nop
		nop
		nop
		nop
 		move	$4,$2
		nop
		nop
		nop
		nop
 		move	$5,$0
		nop
		nop
		nop
		nop
 		move	$6,$0
		nop
		nop
		nop
		nop
 		jal	fillSudoku
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
 		beq	$2,$0,$L39
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
 		li	$2,1			# 0x1
		nop
		nop
		nop
		nop
 		sw	$2,24($fp)
		nop
		nop
		nop
		nop
 		j	$L41
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
	$L42:
		nop
		nop
		nop
		nop
 		lw	$2,24($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		addiu	$2,$2,1
		nop
		nop
		nop
		nop
 		sw	$2,24($fp)
		nop
		nop
		nop
		nop
	$L41:
		nop
		nop
		nop
		nop
 		lw	$2,24($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		slt	$2,$2,10
		nop
		nop
		nop
		nop
 		bne	$2,$0,$L42
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
	$L39:
		nop
		nop
		nop
		nop
 		sw	$0,24($fp)
		nop
		nop
		nop
		nop
 		j	$L43
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
	$L44:
		nop
		nop
		nop
		nop
 		sw	$0,20($fp)
		nop
		nop
		nop
		nop
 		j	$L45
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
	$L46:
		nop
		nop
		nop
		nop
 		lw	$3,24($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		lw	$4,20($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		move	$2,$3
		nop
		nop
		nop
		nop
 		sll	$2,$2,3
		nop
		nop
		nop
		nop
 		addu	$2,$2,$3
		nop
		nop
		nop
		nop
 		addu	$2,$2,$4
		nop
		nop
		nop
		nop
 		sll	$2,$2,2
		nop
		nop
		nop
		nop
 		addiu	$3,$fp,16
		nop
		nop
		nop
		nop
 		addu	$2,$2,$3
		nop
		nop
		nop
		nop
 		lw	$3,12($2)
		nop
		nop
		nop
		nop
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
		nop
		nop
		nop
		nop
 		addu	$2,$2,$3
		nop
		nop
		nop
		nop
 		sw	$2,16($fp)
		nop
		nop
		nop
		nop
 		lw	$2,20($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		addiu	$2,$2,1
		nop
		nop
		nop
		nop
 		sw	$2,20($fp)
		nop
		nop
		nop
		nop
	$L45:
		nop
		nop
		nop
		nop
 		lw	$2,20($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		slt	$2,$2,9
		nop
		nop
		nop
		nop
 		bne	$2,$0,$L46
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
 		lw	$2,24($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		addiu	$2,$2,1
		nop
		nop
		nop
		nop
 		sw	$2,24($fp)
		nop
		nop
		nop
		nop
	$L43:
		nop
		nop
		nop
		nop
 		lw	$2,24($fp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		slt	$2,$2,9
		nop
		nop
		nop
		nop
 		bne	$2,$0,$L44
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
 		move	$2,$0
		nop
		nop
		nop
		nop
 		move	$sp,$fp
		nop
		nop
		nop
		nop
 		lw	$31,356($sp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		lw	$fp,352($sp)
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
 		addiu	$sp,$sp,360
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
 		nop
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
        nop
		nop
		nop
		nop
		nop
