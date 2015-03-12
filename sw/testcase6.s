#-----------------------------------------------------------------------------
# File              : testcase6.c
# Description       : Assembler code for test case 6 of the directed tests.
#                     This test exercises jump, jump-and-link and
#                     branch-and-link instructions.
# Pimrary Author    : Ethan Bishop
# Other Contributers: Lewis Russell
# Notes             : To generate machine code, run cross-compiler using command:
#                           gcc -Wa,-adhln -c -O -mips32 -EB test.c
#                     - Instructions that lead to a fail state are spammed to
#                       avoid a false pass. For example if the pipeline is not
#                       stalled properly a fail branch may be overridden and
#                       test may pass when it should of failed.
#------------------------------------------------------------------------------
    .set    noreorder
    .set    noat

    li      $1,       0x12340000
    ori     $1,  $1,  0x5678
    li      $2,       0x55550000
    ori     $2,  $2,  0x7777
    li      $3,       0x55550000
    ori     $3,  $3,  0x7777
    li      $4,       0x0011
    j       level1
    nop
    nop
    nop
    nop
    nop
    nop
    j       fail
    nop
    nop
    nop
    nop
    nop
    nop
fail:
    li      $1,       0xFFFF0000
    ori     $1,  $1,  0xFFFF
    li      $2,       0xFFFF0000
    ori     $2,  $2,  0xFFFF
    jr      $0
    nop
    nop
    nop
    nop
    nop
    nop
level2a:
    add     $12, $10, $1
    jr      $31
    nop
    nop
    nop
    nop
    nop
    nop
    j       fail
    nop
    nop
    nop
    nop
    nop
    nop
level2b:
    add     $13, $12, $1
    jr      $31
    nop
    nop
    nop
    nop
    nop
    nop
    j       fail
    nop
    nop
    nop
    nop
    nop
    nop
level2c:
    add     $14, $13, $1
    jr      $31
    nop
    nop
    nop
    nop
    nop
    nop
    j       fail
    nop
    nop
    nop
    nop
    nop
    nop
level2:
    add     $10, $9,  $1
    li      $11, 0x82340000
    ori     $11, $11, 0x5678
    bgezal  $11, fail
    nop
    nop
    nop
    nop
    nop
    nop
    bgezal  $1,  level2a
    nop
    nop
    nop
    nop
    nop
    nop
    bgezal  $0,  level2b
    nop
    nop
    nop
    nop
    nop
    nop
    bltzal  $1,  fail
    nop
    nop
    nop
    nop
    nop
    nop
    bltzal  $0,  fail
    nop
    nop
    nop
    nop
    nop
    nop
    bltzal  $11, level2c
    nop
    nop
    nop
    nop
    nop
    nop
    j       finish
    nop
    nop
    nop
    nop
    nop
    nop
    j       fail
    nop
    nop
    nop
    nop
    nop
    nop
level1a:
    add     $6,  $5,  $1
    la      $7,  level1b
    ori     $7,  $7,  level1b
    move    $8, $31
    jalr    $7
    nop
    nop
    nop
    nop
    nop
    nop
    move    $31, $8
    jr      $31
    nop
    nop
    nop
    nop
    nop
    nop
    j       fail
    nop
    nop
    nop
    nop
    nop
    nop
level1b:
    add     $9,  $6,  $1
    jr      $31
    nop
    nop
    nop
    nop
    nop
    nop
    j       fail
    nop
    nop
    nop
    nop
    nop
    nop
level1:
    add     $5,  $4,  $1
    jal     level1a
    nop
    nop
    nop
    nop
    nop
    nop
    j       level2
    nop
    nop
    nop
    nop
    nop
    nop
    j       fail
    nop
    nop
    nop
    nop
    nop
    nop
finish:
    nop
    nop
    nop
    nop
    nop
