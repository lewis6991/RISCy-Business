//-----------------------------------------------------------------------------
// File: testcase2.c
// Description: Assembler code for test case 2 of the directed tests. This test
//              exercises all ALU functions.
// Pimrary Author: Lewis Russell
// Other Contributers: N/A
// Notes: To generate machine code, run with cross-compiler using command:
//          gcc -Wa,-adhln -c -O -mips32 -EB test.c
//------------------------------------------------------------------------------
asm(
    ".set noat                 \n\t"
    "li     $1,      0x12340000\n\t"
    "ori    $1,  $1, 0x5678    \n\t"
    "li     $2,      0x0123    \n\t"
    "ori    $2,  $2, 0x0005    \n\t"
    "add    $3,  $1, $2        \n\t"
    "sub    $4,  $1, $2        \n\t"
    "addi   $5,  $2, 0x5500    \n\t"
    "and    $6,  $1, $2        \n\t"
    "andi   $7,  $1, 0x7654    \n\t"
    "or     $8,  $1, $2        \n\t"
    "xor    $9,  $1, $2        \n\t"
    "nor   $10,  $1, $2        \n\t"
    "xori  $11,  $1, 0x5555    \n\t"
    "andi  $12,  $1, 0xFFFF    \n\t"
    "clz   $13, $12            \n\t"
    "sub   $14,  $0, $12       \n\t"
    "clo   $15, $14            \n\t"
    "addu  $16,  $1, $2        \n\t"
    "subu  $17,  $1, $2        \n\t"
    "addiu $18,  $2, 0x5500    \n\t"
);
// Register values on test finish:
//  $1 [0x12345678]
//  $2 [0x01234567]
//  $3 [0x13579BDF]
//  $4 [0x11111111]
//  $5 [0x01239A67]
//  $6 [0x00204460]
//  $7 [0x00005650]
//  $8 [0x1337577F]
//  $9 [0x1317131F]
// $10 [0xEBB8A880]
// $11 [0x1234032D]
// $12 [0x00005678]
// $13 [0x00000011]
// $14 [0xFFFFA987]
// $15 [0x00000011]
// $16 [0x13579BDF]
// $17 [0x11111111]
// $18 [0x01239A67]
