	.set noreorder
	.set nomacro

lui	$1, 0x1234
ori	$1, $1, 0x5678

ori	$2, $0, 0xfffc
sw	$1, 0($2)

nop
nop
nop
nop
nop
nop
nop
nop
nop

lw	$3, 0($2)
nop
nop
nop
nop
nop
nop
nop
nop
