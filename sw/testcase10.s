		.set	noreorder
		.set	nomacro
        j main
        nop
	isAvailable:
 		addiu	$sp,$sp,-32
 		sw	$fp,24($sp)
        nop
 		move	$fp,$sp
 		sw	$4,32($fp)
        nop
 		sw	$5,36($fp)
        nop
 		sw	$6,40($fp)
        nop
 		sw	$7,44($fp)
        nop
 		lw	$4,36($fp)
        nop
 		li	$2,1431633920			# 0x55550000
 		ori	$2,$2,0x5556
 		mult	$4,$2
 		mfhi	$3
 		sra	$2,$4,31
 		subu	$3,$3,$2
 		move	$2,$3
 		sll	$2,$2,1
 		addu	$2,$2,$3
 		sw	$2,12($fp)
        nop
 		lw	$4,40($fp)
        nop
 		li	$2,1431633920			# 0x55550000
 		ori	$2,$2,0x5556
 		mult	$4,$2
 		mfhi	$3
 		sra	$2,$4,31
 		subu	$3,$3,$2
 		move	$2,$3
 		sll	$2,$2,1
 		addu	$2,$2,$3
 		sw	$2,8($fp)
        nop
 		sw	$0,4($fp)
        nop
 		j	$L2
 		nop
	$L3:
 		lw	$2,36($fp)
        nop
 		sll	$3,$2,2
 		sll	$2,$3,3
 		addu	$2,$3,$2
 		move	$3,$2
 		lw	$2,32($fp)
        nop
 		addu	$3,$3,$2
 		lw	$2,4($fp)
        nop
 		sll	$2,$2,2
 		addu	$2,$2,$3
 		lw	$3,0($2)
        nop
 		lw	$2,44($fp)
        nop
 		bne	$3,$2,$L4
 		nop
 		sw	$0,20($fp)
        nop
 		j	$L6
 		nop
	$L4:
 		lw	$2,4($fp)
        nop
 		sll	$3,$2,2
 		sll	$2,$3,3
 		addu	$2,$3,$2
 		move	$3,$2
 		lw	$2,32($fp)
        nop
 		addu	$3,$3,$2
 		lw	$2,40($fp)
        nop
 		sll	$2,$2,2
 		addu	$2,$2,$3
 		lw	$3,0($2)
        nop
 		lw	$2,44($fp)
        nop
 		bne	$3,$2,$L7
 		nop
 		sw	$0,20($fp)
        nop
 		j	$L6
 		nop
	$L7:
 		lw	$4,4($fp)
        nop
 		li	$2,1431633920			# 0x55550000
 		ori	$2,$2,0x5556
 		mult	$4,$2
 		mfhi	$3
 		sra	$2,$4,31
 		subu	$3,$3,$2
 		sw	$3,16($fp)
        nop
 		lw	$2,16($fp)
        nop
 		sll	$2,$2,1
 		lw	$3,16($fp)
        nop
 		addu	$2,$2,$3
 		subu	$4,$4,$2
 		sw	$4,16($fp)
        nop
 		lw	$2,12($fp)
        nop
 		lw	$3,16($fp)
        nop
 		addu	$2,$3,$2
 		sll	$3,$2,2
 		sll	$2,$3,3
 		addu	$2,$3,$2
 		move	$3,$2
 		lw	$2,32($fp)
        nop
 		addu	$5,$3,$2
 		lw	$4,4($fp)
        nop
 		li	$2,1431633920			# 0x55550000
 		ori	$2,$2,0x5556
 		mult	$4,$2
 		mfhi	$3
 		sra	$2,$4,31
 		subu	$3,$3,$2
 		lw	$2,8($fp)
        nop
 		addu	$2,$3,$2
 		sll	$2,$2,2
 		addu	$2,$2,$5
 		lw	$3,0($2)
        nop
 		lw	$2,44($fp)
        nop
 		bne	$3,$2,$L9
 		nop
 		sw	$0,20($fp)
        nop
 		j	$L6
 		nop
	$L9:
 		lw	$2,4($fp)
        nop
 		addiu	$2,$2,1
 		sw	$2,4($fp)
        nop
	$L2:
 		lw	$2,4($fp)
        nop
 		slt	$2,$2,9
 		bne	$2,$0,$L3
 		nop
 		li	$2,1			# 0x1
 		sw	$2,20($fp)
        nop
	$L6:
 		lw	$2,20($fp)
        nop
 		move	$sp,$fp
 		lw	$fp,24($sp)
        nop
 		addiu	$sp,$sp,32
 		j	$31
 		nop
	fillSudoku:
 		addiu	$sp,$sp,-40
 		sw	$31,36($sp)
        nop
 		sw	$fp,32($sp)
        nop
 		move	$fp,$sp
 		sw	$4,40($fp)
        nop
 		sw	$5,44($fp)
        nop
 		sw	$6,48($fp)
        nop
 		lw	$2,44($fp)
        nop
 		slt	$2,$2,9
 		beq	$2,$0,$L14
 		nop
 		lw	$2,48($fp)
        nop
 		slt	$2,$2,9
 		beq	$2,$0,$L14
 		nop
 		lw	$2,44($fp)
        nop
 		sll	$3,$2,2
 		sll	$2,$3,3
 		addu	$2,$3,$2
 		move	$3,$2
 		lw	$2,40($fp)
        nop
 		addu	$3,$3,$2
 		lw	$2,48($fp)
        nop
 		sll	$2,$2,2
 		addu	$2,$2,$3
 		lw	$2,0($2)
        nop
 		beq	$2,$0,$L17
 		nop
 		lw	$2,48($fp)
        nop
 		slt	$2,$2,8
 		beq	$2,$0,$L19
 		nop
 		lw	$2,48($fp)
        nop
 		addiu	$2,$2,1
 		lw	$4,40($fp)
        nop
 		lw	$5,44($fp)
        nop
 		move	$6,$2
 		jal	fillSudoku
 		nop
 		sw	$2,24($fp)
        nop
 		j	$L21
 		nop
	$L19:
 		lw	$2,44($fp)
        nop
 		slt	$2,$2,8
 		beq	$2,$0,$L22
 		nop
 		lw	$2,44($fp)
        nop
 		addiu	$2,$2,1
 		lw	$4,40($fp)
        nop
 		move	$5,$2
 		move	$6,$0
 		jal	fillSudoku
 		nop
 		sw	$2,24($fp)
        nop
 		j	$L21
 		nop
	$L22:
 		li	$2,1			# 0x1
 		sw	$2,24($fp)
        nop
 		j	$L21
 		nop
	$L17:
 		sw	$0,16($fp)
        nop
 		j	$L24
 		nop
	$L25:
 		lw	$2,16($fp)
        nop
 		addiu	$2,$2,1
 		lw	$4,40($fp)
        nop
 		lw	$5,44($fp)
        nop
 		lw	$6,48($fp)
        nop
 		move	$7,$2
 		jal	isAvailable
 		nop
 		beq	$2,$0,$L26
 		nop
 		lw	$2,44($fp)
        nop
 		sll	$3,$2,2
 		sll	$2,$3,3
 		addu	$2,$3,$2
 		move	$3,$2
 		lw	$2,40($fp)
        nop
 		addu	$5,$3,$2
 		lw	$3,48($fp)
        nop
 		lw	$2,16($fp)
        nop
 		addiu	$4,$2,1
 		sll	$2,$3,2
 		addu	$2,$2,$5
 		sw	$4,0($2)
        nop
 		lw	$2,48($fp)
        nop
 		slt	$2,$2,8
 		beq	$2,$0,$L28
 		nop
 		lw	$2,48($fp)
        nop
 		addiu	$2,$2,1
 		lw	$4,40($fp)
        nop
 		lw	$5,44($fp)
        nop
 		move	$6,$2
 		jal	fillSudoku
 		nop
 		beq	$2,$0,$L30
 		nop
 		li	$2,1			# 0x1
 		sw	$2,24($fp)
        nop
 		j	$L21
 		nop
	$L30:
 		lw	$2,44($fp)
        nop
 		sll	$3,$2,2
 		sll	$2,$3,3
 		addu	$2,$3,$2
 		move	$3,$2
 		lw	$2,40($fp)
        nop
 		addu	$3,$3,$2
 		lw	$2,48($fp)
        nop
 		sll	$2,$2,2
 		addu	$2,$2,$3
 		sw	$0,0($2)
        nop
 		j	$L26
 		nop
	$L28:
 		lw	$2,44($fp)
        nop
 		slt	$2,$2,8
 		beq	$2,$0,$L32
 		nop
 		lw	$2,44($fp)
        nop
 		addiu	$2,$2,1
 		lw	$4,40($fp)
        nop
 		move	$5,$2
 		move	$6,$0
 		jal	fillSudoku
 		nop
 		beq	$2,$0,$L34
 		nop
 		li	$2,1			# 0x1
 		sw	$2,24($fp)
        nop
 		j	$L21
 		nop
	$L34:
 		lw	$2,44($fp)
        nop
 		sll	$3,$2,2
 		sll	$2,$3,3
 		addu	$2,$3,$2
 		move	$3,$2
 		lw	$2,40($fp)
        nop
 		addu	$3,$3,$2
 		lw	$2,48($fp)
        nop
 		sll	$2,$2,2
 		addu	$2,$2,$3
 		sw	$0,0($2)
        nop
 		j	$L26
 		nop
	$L32:
 		li	$2,1			# 0x1
 		sw	$2,24($fp)
        nop
 		j	$L21
 		nop
	$L26:
 		lw	$2,16($fp)
        nop
 		addiu	$2,$2,1
 		sw	$2,16($fp)
        nop
	$L24:
 		lw	$2,16($fp)
        nop
 		slt	$2,$2,9
 		bne	$2,$0,$L25
 		nop
 		sw	$0,24($fp)
        nop
 		j	$L21
 		nop
	$L14:
 		li	$2,1			# 0x1
 		sw	$2,24($fp)
        nop
	$L21:
 		lw	$2,24($fp)
        nop
 		move	$sp,$fp
 		lw	$31,36($sp)
        nop
 		lw	$fp,32($sp)
        nop
 		addiu	$sp,$sp,40
 		j	$31
 		nop
	main:
 		addiu	$sp,$sp,-344
 		sw	$fp,336($sp)
        nop
 		move	$fp,$sp
 		sw	$0,12($fp)
        nop
 		sw	$0,16($fp)
        nop
 		sw	$0,20($fp)
        nop
 		sw	$0,24($fp)
        nop
 		sw	$0,28($fp)
        nop
 		sw	$0,32($fp)
        nop
 		sw	$0,36($fp)
        nop
 		li	$2,9			# 0x9
 		sw	$2,40($fp)
        nop
 		sw	$0,44($fp)
        nop
 		li	$2,1			# 0x1
 		sw	$2,48($fp)
        nop
 		li	$2,9			# 0x9
 		sw	$2,52($fp)
        nop
 		sw	$0,56($fp)
        nop
 		li	$2,4			# 0x4
 		sw	$2,60($fp)
        nop
 		li	$2,7			# 0x7
 		sw	$2,64($fp)
        nop
 		sw	$0,68($fp)
        nop
 		li	$2,6			# 0x6
 		sw	$2,72($fp)
        nop
 		sw	$0,76($fp)
        nop
 		li	$2,8			# 0x8
 		sw	$2,80($fp)
        nop
 		sw	$0,84($fp)
        nop
 		li	$2,5			# 0x5
 		sw	$2,88($fp)
        nop
 		li	$2,2			# 0x2
 		sw	$2,92($fp)
        nop
 		li	$2,8			# 0x8
 		sw	$2,96($fp)
        nop
 		li	$2,1			# 0x1
 		sw	$2,100($fp)
        nop
 		li	$2,9			# 0x9
 		sw	$2,104($fp)
        nop
 		li	$2,4			# 0x4
 		sw	$2,108($fp)
        nop
 		sw	$0,112($fp)
        nop
 		li	$2,7			# 0x7
 		sw	$2,116($fp)
        nop
 		li	$2,2			# 0x2
 		sw	$2,120($fp)
        nop
 		sw	$0,124($fp)
        nop
 		sw	$0,128($fp)
        nop
 		sw	$0,132($fp)
        nop
 		li	$2,4			# 0x4
 		sw	$2,136($fp)
        nop
 		li	$2,8			# 0x8
 		sw	$2,140($fp)
        nop
 		sw	$0,144($fp)
        nop
 		sw	$0,148($fp)
        nop
 		sw	$0,152($fp)
        nop
 		sw	$0,156($fp)
        nop
 		sw	$0,160($fp)
        nop
 		li	$2,9			# 0x9
 		sw	$2,164($fp)
        nop
 		sw	$0,168($fp)
        nop
 		sw	$0,172($fp)
        nop
 		sw	$0,176($fp)
        nop
 		li	$2,5			# 0x5
 		sw	$2,180($fp)
        nop
 		sw	$0,184($fp)
        nop
 		sw	$0,188($fp)
        nop
 		sw	$0,192($fp)
        nop
 		sw	$0,196($fp)
        nop
 		sw	$0,200($fp)
        nop
 		li	$2,7			# 0x7
 		sw	$2,204($fp)
        nop
 		li	$2,5			# 0x5
 		sw	$2,208($fp)
        nop
 		sw	$0,212($fp)
        nop
 		sw	$0,216($fp)
        nop
 		sw	$0,220($fp)
        nop
 		li	$2,9			# 0x9
 		sw	$2,224($fp)
        nop
 		li	$2,9			# 0x9
 		sw	$2,228($fp)
        nop
 		sw	$0,232($fp)
        nop
 		li	$2,7			# 0x7
 		sw	$2,236($fp)
        nop
 		li	$2,3			# 0x3
 		sw	$2,240($fp)
        nop
 		li	$2,6			# 0x6
 		sw	$2,244($fp)
        nop
 		li	$2,4			# 0x4
 		sw	$2,248($fp)
        nop
 		li	$2,1			# 0x1
 		sw	$2,252($fp)
        nop
 		li	$2,8			# 0x8
 		sw	$2,256($fp)
        nop
 		sw	$0,260($fp)
        nop
 		li	$2,5			# 0x5
 		sw	$2,264($fp)
        nop
 		sw	$0,268($fp)
        nop
 		li	$2,6			# 0x6
 		sw	$2,272($fp)
        nop
 		sw	$0,276($fp)
        nop
 		li	$2,8			# 0x8
 		sw	$2,280($fp)
        nop
 		li	$2,1			# 0x1
 		sw	$2,284($fp)
        nop
 		sw	$0,288($fp)
        nop
 		li	$2,7			# 0x7
 		sw	$2,292($fp)
        nop
 		li	$2,4			# 0x4
 		sw	$2,296($fp)
        nop
 		sw	$0,300($fp)
        nop
 		li	$2,8			# 0x8
 		sw	$2,304($fp)
        nop
 		sw	$0,308($fp)
        nop
 		sw	$0,312($fp)
        nop
 		sw	$0,316($fp)
        nop
 		sw	$0,320($fp)
        nop
 		sw	$0,324($fp)
        nop
 		sw	$0,328($fp)
        nop
 		sw	$0,332($fp)
        nop
 		sw	$0,0($fp)
        nop
 		sw	$0,8($fp)
        nop
 		j	$L39
 		nop
	$L40:
 		sw	$0,4($fp)
        nop
 		j	$L41
 		nop
	$L42:
 		lw	$3,8($fp)
        nop
 		lw	$4,4($fp)
        nop
 		move	$2,$3
 		sll	$2,$2,3
 		addu	$2,$2,$3
 		addu	$2,$2,$4
 		sll	$2,$2,2
 		addu	$2,$2,$fp
 		lw	$3,12($2)
        nop
 		lw	$2,0($fp)
        nop
 		addu	$2,$2,$3
 		sw	$2,0($fp)
        nop
        nop
 		lw	$2,4($fp)
        nop
 		addiu	$2,$2,1
 		sw	$2,4($fp)
        nop
        nop
	$L41:
 		lw	$2,4($fp)
        nop
 		slt	$2,$2,9
 		bne	$2,$0,$L42
 		nop
 		lw	$2,8($fp)
        nop
 		addiu	$2,$2,1
 		sw	$2,8($fp)
        nop
	$L39:
 		lw	$2,8($fp)
        nop
 		slt	$2,$2,9
 		bne	$2,$0,$L40
 		nop
 		move	$2,$0
 		move	$sp,$fp
 		lw	$fp,336($sp)
        nop
 		addiu	$sp,$sp,344
 		nop
        nop
        nop
