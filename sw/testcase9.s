		.set	noreorder
		.set	nomacro
        j main
        nop
	isAvailable:
 		addiu	$sp,$sp,-32
 		sw	$fp,24($sp)
 		move	$fp,$sp
 		sw	$4,32($fp)
 		sw	$5,36($fp)
 		sw	$6,40($fp)
 		sw	$7,44($fp)
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
 		sw	$0,4($fp)
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
 		lw	$2,16($fp)
        nop
 		sll	$2,$2,1
 		lw	$3,16($fp)
        nop
 		addu	$2,$2,$3
 		subu	$4,$4,$2
 		sw	$4,16($fp)
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
 		j	$L6
 		nop
	$L9:
 		lw	$2,4($fp)
        nop
 		addiu	$2,$2,1
 		sw	$2,4($fp)
	$L2:
 		lw	$2,4($fp)
        nop
 		slt	$2,$2,9
 		bne	$2,$0,$L3
 		nop
 		li	$2,1			# 0x1
 		sw	$2,20($fp)
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
 		sw	$fp,32($sp)
 		move	$fp,$sp
 		sw	$4,40($fp)
 		sw	$5,44($fp)
 		sw	$6,48($fp)
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
 		j	$L21
 		nop
	$L22:
 		li	$2,1			# 0x1
 		sw	$2,24($fp)
 		j	$L21
 		nop
	$L17:
 		sw	$0,16($fp)
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
 		j	$L26
 		nop
	$L32:
 		li	$2,1			# 0x1
 		sw	$2,24($fp)
 		j	$L21
 		nop
	$L26:
 		lw	$2,16($fp)
        nop
 		addiu	$2,$2,1
 		sw	$2,16($fp)
	$L24:
 		lw	$2,16($fp)
        nop
 		slt	$2,$2,9
 		bne	$2,$0,$L25
 		nop
 		sw	$0,24($fp)
 		j	$L21
 		nop
	$L14:
 		li	$2,1			# 0x1
 		sw	$2,24($fp)
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
 		addiu	$sp,$sp,-360
 		sw	$31,356($sp)
 		sw	$fp,352($sp)
 		move	$fp,$sp
 		sw	$0,28($fp)
 		sw	$0,32($fp)
 		sw	$0,36($fp)
 		sw	$0,40($fp)
 		sw	$0,44($fp)
 		sw	$0,48($fp)
 		sw	$0,52($fp)
 		li	$2,9			# 0x9
 		sw	$2,56($fp)
 		sw	$0,60($fp)
 		li	$2,1			# 0x1
 		sw	$2,64($fp)
 		li	$2,9			# 0x9
 		sw	$2,68($fp)
 		sw	$0,72($fp)
 		li	$2,4			# 0x4
 		sw	$2,76($fp)
 		li	$2,7			# 0x7
 		sw	$2,80($fp)
 		sw	$0,84($fp)
 		li	$2,6			# 0x6
 		sw	$2,88($fp)
 		sw	$0,92($fp)
 		li	$2,8			# 0x8
 		sw	$2,96($fp)
 		sw	$0,100($fp)
 		li	$2,5			# 0x5
 		sw	$2,104($fp)
 		li	$2,2			# 0x2
 		sw	$2,108($fp)
 		li	$2,8			# 0x8
 		sw	$2,112($fp)
 		li	$2,1			# 0x1
 		sw	$2,116($fp)
 		li	$2,9			# 0x9
 		sw	$2,120($fp)
 		li	$2,4			# 0x4
 		sw	$2,124($fp)
 		sw	$0,128($fp)
 		li	$2,7			# 0x7
 		sw	$2,132($fp)
 		li	$2,2			# 0x2
 		sw	$2,136($fp)
 		sw	$0,140($fp)
 		sw	$0,144($fp)
 		sw	$0,148($fp)
 		li	$2,4			# 0x4
 		sw	$2,152($fp)
 		li	$2,8			# 0x8
 		sw	$2,156($fp)
 		sw	$0,160($fp)
 		sw	$0,164($fp)
 		sw	$0,168($fp)
 		sw	$0,172($fp)
 		sw	$0,176($fp)
 		li	$2,9			# 0x9
 		sw	$2,180($fp)
 		sw	$0,184($fp)
 		sw	$0,188($fp)
 		sw	$0,192($fp)
 		li	$2,5			# 0x5
 		sw	$2,196($fp)
 		sw	$0,200($fp)
 		sw	$0,204($fp)
 		sw	$0,208($fp)
 		sw	$0,212($fp)
 		sw	$0,216($fp)
 		li	$2,7			# 0x7
 		sw	$2,220($fp)
 		li	$2,5			# 0x5
 		sw	$2,224($fp)
 		sw	$0,228($fp)
 		sw	$0,232($fp)
 		sw	$0,236($fp)
 		li	$2,9			# 0x9
 		sw	$2,240($fp)
 		li	$2,9			# 0x9
 		sw	$2,244($fp)
 		sw	$0,248($fp)
 		li	$2,7			# 0x7
 		sw	$2,252($fp)
 		li	$2,3			# 0x3
 		sw	$2,256($fp)
 		li	$2,6			# 0x6
 		sw	$2,260($fp)
 		li	$2,4			# 0x4
 		sw	$2,264($fp)
 		li	$2,1			# 0x1
 		sw	$2,268($fp)
 		li	$2,8			# 0x8
 		sw	$2,272($fp)
 		sw	$0,276($fp)
 		li	$2,5			# 0x5
 		sw	$2,280($fp)
 		sw	$0,284($fp)
 		li	$2,6			# 0x6
 		sw	$2,288($fp)
 		sw	$0,292($fp)
 		li	$2,8			# 0x8
 		sw	$2,296($fp)
 		li	$2,1			# 0x1
 		sw	$2,300($fp)
 		sw	$0,304($fp)
 		li	$2,7			# 0x7
 		sw	$2,308($fp)
 		li	$2,4			# 0x4
 		sw	$2,312($fp)
 		sw	$0,316($fp)
 		li	$2,8			# 0x8
 		sw	$2,320($fp)
 		sw	$0,324($fp)
 		sw	$0,328($fp)
 		sw	$0,332($fp)
 		sw	$0,336($fp)
 		sw	$0,340($fp)
 		sw	$0,344($fp)
 		sw	$0,348($fp)
 		sw	$0,16($fp)
 		addiu	$2,$fp,28
 		move	$4,$2
 		move	$5,$0
 		move	$6,$0
 		jal	fillSudoku
 		nop
 		beq	$2,$0,$L39
 		nop
 		li	$2,1			# 0x1
 		sw	$2,24($fp)
 		j	$L41
 		nop
	$L42:
 		lw	$2,24($fp)
        nop
 		addiu	$2,$2,1
 		sw	$2,24($fp)
	$L41:
 		lw	$2,24($fp)
        nop
 		slt	$2,$2,10
 		bne	$2,$0,$L42
 		nop
	$L39:
 		sw	$0,24($fp)
 		j	$L43
 		nop
	$L44:
 		sw	$0,20($fp)
 		j	$L45
 		nop
	$L46:
 		lw	$3,24($fp)
        nop
 		lw	$4,20($fp)
        nop
 		move	$2,$3
 		sll	$2,$2,3
 		addu	$2,$2,$3
 		addu	$2,$2,$4
 		sll	$2,$2,2
 		addiu	$3,$fp,16
 		addu	$2,$2,$3
 		lw	$3,12($2)
        nop
 		lw	$2,16($fp)
        nop
 		addu	$2,$2,$3
 		sw	$2,16($fp)
 		lw	$2,20($fp)
        nop
 		addiu	$2,$2,1
 		sw	$2,20($fp)
	$L45:
 		lw	$2,20($fp)
        nop
 		slt	$2,$2,9
 		bne	$2,$0,$L46
 		nop
 		lw	$2,24($fp)
        nop
 		addiu	$2,$2,1
 		sw	$2,24($fp)
	$L43:
 		lw	$2,24($fp)
        nop
 		slt	$2,$2,9
 		bne	$2,$0,$L44
 		nop
 		move	$2,$0
 		move	$sp,$fp
 		lw	$31,356($sp)
        nop
 		lw	$fp,352($sp)
        nop
 		addiu	$sp,$sp,360
 		j	$31
 		nop
        nop
        nop
        nop
