#-----------------------------------------------------------------------------
# File              : testcase4.s
# Description       : Assembler code for test case 4 of the directed tests.
#                     This test exercises all the shift instructions.
# Pimrary Author    : Lewis Russell
# Other Contributers:
# Notes             : To generate machine code, run cross-compiler using:
#                         gcc -Wa,-adhln -c -O -mips32 -EB testcase4.s
#------------------------------------------------------------------------------
.set noreorder
.set noat
nop
nop
nop
li    $1 ,      0x80050000
ori   $2 , $2 , 0x4
sra   $3 , $1 , 0x5
srav  $4 , $1 , $2
sll   $5 , $1 , 0x5
srl   $6 , $1 , 0x5
sllv  $7 , $1 , $2
srlv  $8 , $1 , $2
movn  $9 , $1 , $7
movz  $10, $6 , $0
slt   $11, $2 , $6
slti  $12, $2 , 0x0100
li    $13,      0x88000000
sltu  $14, $1 , $13
sltiu $15, $11, 0x3200
nop
nop
nop
nop
nop
