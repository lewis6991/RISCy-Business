#-----------------------------------------------------------------------------
# File              : testcase1.s
# Description       : Assembler code for test case 1 of the directed tests.
#                     This test is a simple test to verify minimum function of
#                     the complete CPU.
# Pimrary Author    : Lewis Russell
# Other Contributers:
# Notes             : To generate machine code, run cross-compiler using:
#                            gcc -Wa,-adhln -c -O -mips32 -EB test.c
#------------------------------------------------------------------------------
.set noreorder
.set noat
nop
nop
nop
li  $1,     0x12340000
ori $1, $1, 0x5678
li  $2,     0x55550000
nop
ori $2, $2, 0x7777
add $3, $2, $1
nop
nop
nop
nop
nop
