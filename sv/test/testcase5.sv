//-----------------------------------------------------------------------------
// File              : testcase5.sv
// Description       : Assembler code for test case 5 of the directed tests.
//                     This test exercises branch instructions.
// Pimrary Author    : Lewis Russell
// Other Contributers:
// Notes             : - Instructions that lead to a fail state are spammed to
//                       avoid a false pass. For example if the pipeline is not
//                       stalled properly a fail branch may be overridden and
//                       test may pass when it should of failed.
//------------------------------------------------------------------------------
 32'h3C018234, // li      $1,      0x82340000
 32'h34215678, // ori     $1,  $1, 0x5678
 32'h3C025555, // li      $2,      0x55550000
 32'h34427777, // ori     $2,  $2, 0x7777
 32'h3C035555, // li      $3,      0x55550000
 32'h34637777, // ori     $3,  $3, 0x7777
 32'h10220006, // beq     $1,  $2, fail
 32'h10220005, // beq     $1,  $2, fail
 32'h10220004, // beq     $1,  $2, fail
 32'h10220003, // beq     $1,  $2, fail
 32'h10220002, // beq     $1,  $2, fail
 32'h24040011, // li      $4,      0x0011
 32'h10430064, // beq     $2,  $3, level1
 32'h3C01FFFF, // li      $1,      0xFFFF0000
 32'h3421FFFF, // ori     $1,  $1, 0xFFFF
 32'h3C02FFFF, // li      $2,      0xFFFF0000
 32'h3442FFFF, // ori     $2,  $2, 0xFFFF
 32'h3C01FFFF, // li      $1,      0xFFFF0000
 32'h3442FFFF, // ori     $2,  $2, 0xFFFF
 32'h1000006E, // beq     $0,  $0, finish
 32'h1000006D, // beq     $0,  $0, finish
 32'h1000006C, // beq     $0,  $0, finish
 32'h1000006B, // beq     $0,  $0, finish
 32'h1000006A, // beq     $0,  $0, finish
 32'h01415820, // add    $11, $10, $1
 32'h1840FFF3, // blez    $2,      fail
 32'h1840FFF2, // blez    $2,      fail
 32'h1840FFF1, // blez    $2,      fail
 32'h1840FFF0, // blez    $2,      fail
 32'h1840FFEF, // blez    $2,      fail
 32'h18000005, // blez    $0,      level6b
 32'h1000FFED, // beq     $0,  $0, fail
 32'h1000FFEC, // beq     $0,  $0, fail
 32'h1000FFEB, // beq     $0,  $0, fail
 32'h1000FFEA, // beq     $0,  $0, fail
 32'h1000FFE9, // beq     $0,  $0, fail
 32'h01616020, // add    $12, $11, $1
 32'h1820005C, // blez    $1,      finish
 32'h1000FFE6, // beq     $0,  $0, fail
 32'h1000FFE5, // beq     $0,  $0, fail
 32'h1000FFE4, // beq     $0,  $0, fail
 32'h1000FFE3, // beq     $0,  $0, fail
 32'h1000FFE2, // beq     $0,  $0, fail
 32'h01215020, // add    $10,  $9, $1
 32'h0400FFE0, // bltz    $0,      fail
 32'h0400FFDF, // bltz    $0,      fail
 32'h0400FFDE, // bltz    $0,      fail
 32'h0400FFDD, // bltz    $0,      fail
 32'h0400FFDC, // bltz    $0,      fail
 32'h0440FFDB, // bltz    $2,      fail
 32'h0440FFDA, // bltz    $2,      fail
 32'h0440FFD9, // bltz    $2,      fail
 32'h0440FFD8, // bltz    $2,      fail
 32'h0440FFD7, // bltz    $2,      fail
 32'h0420FFE1, // bltz    $1,      level6
 32'h1000FFD5, // beq     $0,  $0, fail
 32'h1000FFD4, // beq     $0,  $0, fail
 32'h1000FFD3, // beq     $0,  $0, fail
 32'h1000FFD2, // beq     $0,  $0, fail
 32'h1000FFD1, // beq     $0,  $0, fail
 32'h00E14020, // add     $8,  $7, $1
 32'h0421FFCF, // bgez    $1,      fail
 32'h0421FFCE, // bgez    $1,      fail
 32'h0421FFCD, // bgez    $1,      fail
 32'h0421FFCC, // bgez    $1,      fail
 32'h0421FFCB, // bgez    $1,      fail
 32'h04010005, // bgez    $0,      level4b
 32'h1000FFC9, // beq     $0,  $0, fail
 32'h1000FFC8, // beq     $0,  $0, fail
 32'h1000FFC7, // beq     $0,  $0, fail
 32'h1000FFC6, // beq     $0,  $0, fail
 32'h1000FFC5, // beq     $0,  $0, fail
 32'h01014820, // add     $9,  $8, $1
 32'h0441FFE1, // bgez    $2,      level5
 32'h1000FFC2, // beq     $0,  $0, fail
 32'h1000FFC1, // beq     $0,  $0, fail
 32'h1000FFC0, // beq     $0,  $0, fail
 32'h1000FFBF, // beq     $0,  $0, fail
 32'h1000FFBE, // beq     $0,  $0, fail
 32'h00C13820, // add     $7,  $6, $1
 32'h1C20FFBC, // bgtz    $1,      fail
 32'h1C20FFBB, // bgtz    $1,      fail
 32'h1C20FFBA, // bgtz    $1,      fail
 32'h1C20FFB9, // bgtz    $1,      fail
 32'h1C20FFB8, // bgtz    $1,      fail
 32'h1C00FFB7, // bgtz    $0,      fail
 32'h1C00FFB6, // bgtz    $0,      fail
 32'h1C00FFB5, // bgtz    $0,      fail
 32'h1C00FFB4, // bgtz    $0,      fail
 32'h1C00FFB3, // bgtz    $0,      fail
 32'h1C40FFE1, // bgtz    $2,      level4
 32'h1000FFB1, // beq     $0,  $0, fail
 32'h1000FFB0, // beq     $0,  $0, fail
 32'h1000FFAF, // beq     $0,  $0, fail
 32'h1000FFAE, // beq     $0,  $0, fail
 32'h1000FFAD, // beq     $0,  $0, fail
 32'h00A13020, // add     $6,  $5, $1
 32'h1443FFAB, // bne     $2,  $3, fail
 32'h1443FFAA, // bne     $2,  $3, fail
 32'h1443FFA9, // bne     $2,  $3, fail
 32'h1443FFA8, // bne     $2,  $3, fail
 32'h1443FFA7, // bne     $2,  $3, fail
 32'h1462FFA6, // bne     $3,  $2, fail
 32'h1462FFA5, // bne     $3,  $2, fail
 32'h1462FFA4, // bne     $3,  $2, fail
 32'h1462FFA3, // bne     $3,  $2, fail
 32'h1462FFA2, // bne     $3,  $2, fail
 32'h1422FFE3, // bne     $1,  $2, level3
 32'h1000FFA0, // beq     $0,  $0, fail
 32'h1000FF9F, // beq     $0,  $0, fail
 32'h1000FF9E, // beq     $0,  $0, fail
 32'h1000FF9D, // beq     $0,  $0, fail
 32'h1000FF9C, // beq     $0,  $0, fail
 32'h00812820, // add     $5,  $4, $1
 32'h1022FF9A, // beq     $1,  $2, fail
 32'h1022FF99, // beq     $1,  $2, fail
 32'h1022FF98, // beq     $1,  $2, fail
 32'h1022FF97, // beq     $1,  $2, fail
 32'h1022FF96, // beq     $1,  $2, fail
 32'h1041FF95, // beq     $2,  $1, fail
 32'h1041FF94, // beq     $2,  $1, fail
 32'h1041FF93, // beq     $2,  $1, fail
 32'h1041FF92, // beq     $2,  $1, fail
 32'h1041FF91, // beq     $2,  $1, fail
 32'h1043FFE3, // beq     $2,  $3, level2
 32'h1000FF8F, // beq     $0,  $0, fail
 32'h1000FF8E, // beq     $0,  $0, fail
 32'h1000FF8D, // beq     $0,  $0, fail
 32'h1000FF8C, // beq     $0,  $0, fail
 32'h1000FF8B, // beq     $0,  $0, fail
 32'h00000000, // nop
 32'h00000000, // nop
 32'h00000000, // nop
 32'h00000000, // nop
 32'h00000000 // nop
