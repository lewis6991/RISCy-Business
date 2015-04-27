#-----------------------------------------------------------------------------
# File              : testcase3.s
# Description       : Assembler code for test case 3 of the directed tests.
#                     This test exercises all the multiply and accumulator
#                     instructions.
# Pimrary Author    : Lewis Russell
# Other Contributers:
# Notes             : To generate machine code, run cross-compiler using:
#                          gcc -Wa,-adhln -c -O -mips32 -EB testcase3.s
#------------------------------------------------------------------------------
.set noat
nop
nop
nop
ori   $1, $1, 0x5678
li    $2,     0x01230000
ori   $2, $2, 0x4567
mul   $3, $1, $2
nop
mthi  $1
nop
mtlo  $1
nop
mult  $1, $2
nop
mfhi  $4
nop
mflo  $5
nop
madd  $1, $2
nop
mfhi  $6
nop
mflo  $7
nop
msub  $2, $2
nop
mfhi  $8
nop
mflo  $9
nop
maddu $2, $2
nop
mfhi  $10
nop
mflo  $11
nop
msubu $2, $2
nop
mfhi  $12
nop
mflo  $13
nop
multu $1, $2
nop
mfhi  $14
nop
mflo  $15
nop
mthi  $1
nop
mtlo  $2
nop
mfhi  $16
nop
mflo  $17
nop
