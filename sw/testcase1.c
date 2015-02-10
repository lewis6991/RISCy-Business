//-----------------------------------------------------------------------------
// File: testcase1.c
// Description: Assembler code for test case 1 of the directed tests. This test
//              is a simple test to verify minimum function of the complete
//              CPU.
// Pimrary Author: Lewis Russell
// Other Contributers: N/A
// Notes: To generate machine code, run with cross-compiler using command:
//          gcc -Wa,-adhln -c -O -mips32 -EB test.c
//------------------------------------------------------------------------------
asm(
   ".set noat             \n\t"
   "li  $1,     0x12340000\n\t"
   "ori $1, $1, 0x5678    \n\t"
   "li  $2,     0x0       \n\t"
   "nop                   \n\t"
   "ori $2, $2, 0x0005    \n\t"
   "mul $3, $2, $1        \n\t"
   "nop                   \n\t"
);
// Register values on test finish:
// $1 [0x12345678]
// $2 [0x00000005]
// $3 [0x05B05B03]
