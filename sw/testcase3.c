//-----------------------------------------------------------------------------
// File: testcase3.c
// Description: Assembler code for test case 3 of the directed tests. This test
//              exercises all the multiply and accumulator instructions..
// Pimrary Author: Lewis Russell
// Other Contributers: N/A
// Notes: To generate machine code, run with cross-compiler using command:
//          gcc -Wa,-adhln -c -O -mips32 -EB test.c
//------------------------------------------------------------------------------
asm(
    ".set noat               \n\t"
    "li    $1,     0x12340000\n\t"
    "ori   $1, $1, 0x5678    \n\t"
    "li    $2,     0x0123    \n\t"
    "ori   $2, $2, 0x4567    \n\t"
    "mul   $3, $1, $2        \n\t"
    "mthi  $1                \n\t"
    "mtlo  $1                \n\t" 
    "mult  $1, $2            \n\t"
    "mfhi  $4                \n\t"
    "mflo  $5                \n\t"
    "madd  $1, $2            \n\t"
    "mfhi  $6                \n\t"
    "mflo  $7                \n\t"
    "msub  $2, $2            \n\t"
    "mfhi  $8                \n\t"
    "mflo  $9                \n\t"
    "maddu $2, $2            \n\t"
    "mfhi  $10               \n\t"
    "mflo  $11               \n\t"
    "msubu $2, $2            \n\t"
    "mfhi  $12               \n\t"
    "mflo  $13               \n\t"
    "multu $1, $2            \n\t"
    "mfhi  $14               \n\t"
    "mflo  $15               \n\t"
    "mthi  $1                \n\t"
    "mtlo  $2                \n\t"
    "mfhi  $16               \n\t"
    "mflo  $17               \n\t"
);

// $1  [0x12345678]          
// $2  [0x01234567]          
// $3  [0xB8C52248]          
// $4  [0x0014B66D]          
// $5  [0xB8C52248]          
// $6  [0x00296CDB]          
// $7  [0x718A4490]          
// $8  [0x00136B06]          
// $9  [0xDDCA72D7]          
// $10 [0x0014B66D]          
// $11 [0xB8C52248]          
// $12 [0x00136B06]          
// $13 [0xDDCA72D7]          
// $14 [0x0014B66D]          
// $15 [0xB8C52248]          
// $16 [0x12345678]          
// $17 [0x01234567]          
