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
li    $1,     0x12340000
ori   $1, $1, 0x5678
li    $2,     0x01230000
ori   $2, $2, 0x4567
mul   $3, $1, $2
mthi  $1
mtlo  $1
mult  $1, $2
mfhi  $4
mflo  $5
madd  $1, $2
mfhi  $6
mflo  $7
msub  $2, $2
mfhi  $8
mflo  $9
maddu $2, $2
mfhi  $10
mflo  $11
msubu $2, $2
mfhi  $12
mflo  $13
multu $1, $2
mfhi  $14
mflo  $15
mthi  $1
mtlo  $2
mfhi  $16
mflo  $17
