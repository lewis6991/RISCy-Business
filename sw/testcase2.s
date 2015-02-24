#-----------------------------------------------------------------------------
# File              : testcase2.s
# Description       : Assembler code for test case 2 of the directed tests.
#                     This test exercises all ALU functions.
# Pimrary Author    : Lewis Russell
# Other Contributers:
# Notes             : To generate machine code, run cross-compiler using:
#                         gcc -Wa,-adhln -c -O -mips32 -EB testcase2.s
#------------------------------------------------------------------------------
.set noreorder
.set noat
li     $1,      0x12340000
ori    $1,  $1, 0x5678
li     $2,      0x01230000
ori    $2,  $2, 0x0005
add    $3,  $1, $2
sub    $4,  $1, $2
addi   $5,  $2, 0x5500
and    $6,  $1, $2
andi   $7,  $1, 0x7654
or     $8,  $1, $2
xor    $9,  $1, $2
nor   $10,  $1, $2
xori  $11,  $1, 0x5555
andi  $12,  $1, 0xFFFF
clz   $13, $12
sub   $14,  $0, $12
clo   $15, $14
addu  $16,  $1, $2
subu  $17,  $1, $2
addiu $18,  $2, 0x5500
nop
nop
nop
nop
nop
