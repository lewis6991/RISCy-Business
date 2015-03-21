#-----------------------------------------------------------------------------
# File              : testcase5.c
# Description       : Assembler code for test case 5 of the directed tests.
#                     This test exercises branch instructions.
# Pimrary Author    : Lewis Russell
# Other Contributers:
# Notes             : To generate machine code, run cross-compiler using command:
#                           gcc -Wa,-adhln -c -O -mips32 -EB test.c
#                     - Instructions that lead to a fail state are spammed to
#                       avoid a false pass. For example if the pipeline is not
#                       stalled properly a fail branch may be overridden and
#                       test may pass when it should of failed.
#------------------------------------------------------------------------------
    .set    noreorder
    .set    noat

nop
nop
nop
    li      $1,      0x82340000
    ori     $1,  $1, 0x5678
    li      $2,      0x55550000
    ori     $2,  $2, 0x7777
    li      $3,      0x55550000
    ori     $3,  $3, 0x7777
    beq     $1,  $2, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $1,  $2, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $1,  $2, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $1,  $2, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $1,  $2, fail
    nop
    nop
    nop
    nop
    nop
    nop
    li      $4,      0x0011
    beq     $2,  $3, level1
    nop
    nop
    nop
    nop
    nop
    nop
fail:
    li      $1,      0xFFFF0000
    ori     $1,  $1, 0xFFFF
    li      $2,      0xFFFF0000
    ori     $2,  $2, 0xFFFF
    li      $1,      0xFFFF0000
    ori     $2,  $2, 0xFFFF
    beq     $0,  $0, finish
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, finish
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, finish
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, finish
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, finish
    nop
    nop
    nop
    nop
    nop
    nop
#level7:
#    add    $13, $12, $1
#    bgezal  $1       fail
#    bgezal  $1       fail
#    bgezal  $1       fail
#    bgezal  $1       fail
#    bgezal  $1       fail
#    bgezal  $0,      finish
#    beq     $0,  $0, fail
#    beq     $0,  $0, fail
#    beq     $0,  $0, fail
#    beq     $0,  $0, fail
#    beq     $0,  $0, fail
level6:
    add    $11, $10, $1
    blez    $2,      fail
    nop
    nop
    nop
    nop
    nop
    nop
    blez    $2,      fail
    nop
    nop
    nop
    nop
    nop
    nop
    blez    $2,      fail
    nop
    nop
    nop
    nop
    nop
    nop
    blez    $2,      fail
    nop
    nop
    nop
    nop
    nop
    nop
    blez    $2,      fail
    nop
    nop
    nop
    nop
    nop
    nop
    blez    $0,      level6b
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
level6b:
    add    $12, $11, $1
    blez    $1,      finish
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
level5:
    add    $10,  $9, $1
    bltz    $0,      fail
    nop
    nop
    nop
    nop
    nop
    nop
    bltz    $0,      fail
    nop
    nop
    nop
    nop
    nop
    nop
    bltz    $0,      fail
    nop
    nop
    nop
    nop
    nop
    nop
    bltz    $0,      fail
    nop
    nop
    nop
    nop
    nop
    nop
    bltz    $0,      fail
    nop
    nop
    nop
    nop
    nop
    nop
    bltz    $2,      fail
    nop
    nop
    nop
    nop
    nop
    nop
    bltz    $2,      fail
    nop
    nop
    nop
    nop
    nop
    nop
    bltz    $2,      fail
    nop
    nop
    nop
    nop
    nop
    nop
    bltz    $2,      fail
    nop
    nop
    nop
    nop
    nop
    nop
    bltz    $2,      fail
    nop
    nop
    nop
    nop
    nop
    nop
    bltz    $1,      level6
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
level4:
    add     $8,  $7, $1
    bgez    $1,      fail
    nop
    nop
    nop
    nop
    nop
    nop
    bgez    $1,      fail
    nop
    nop
    nop
    nop
    nop
    nop
    bgez    $1,      fail
    nop
    nop
    nop
    nop
    nop
    nop
    bgez    $1,      fail
    nop
    nop
    nop
    nop
    nop
    nop
    bgez    $1,      fail
    nop
    nop
    nop
    nop
    nop
    nop
    bgez    $0,      level4b
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
level4b:
    add     $9,  $8, $1
    bgez    $2,      level5
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
level3:
    add     $7,  $6, $1
    bgtz    $1,      fail
    nop
    nop
    nop
    nop
    nop
    nop
    bgtz    $1,      fail
    nop
    nop
    nop
    nop
    nop
    nop
    bgtz    $1,      fail
    nop
    nop
    nop
    nop
    nop
    nop
    bgtz    $1,      fail
    nop
    nop
    nop
    nop
    nop
    nop
    bgtz    $1,      fail
    nop
    nop
    nop
    nop
    nop
    nop
    bgtz    $0,      fail
    nop
    nop
    nop
    nop
    nop
    nop
    bgtz    $0,      fail
    nop
    nop
    nop
    nop
    nop
    nop
    bgtz    $0,      fail
    nop
    nop
    nop
    nop
    nop
    nop
    bgtz    $0,      fail
    nop
    nop
    nop
    nop
    nop
    nop
    bgtz    $0,      fail
    nop
    nop
    nop
    nop
    nop
    nop
    bgtz    $2,      level4
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
level2:
    add     $6,  $5, $1
    bne     $2,  $3, fail
    nop
    nop
    nop
    nop
    nop
    nop
    bne     $2,  $3, fail
    nop
    nop
    nop
    nop
    nop
    nop
    bne     $2,  $3, fail
    nop
    nop
    nop
    nop
    nop
    nop
    bne     $2,  $3, fail
    nop
    nop
    nop
    nop
    nop
    nop
    bne     $2,  $3, fail
    nop
    nop
    nop
    nop
    nop
    nop
    bne     $3,  $2, fail
    nop
    nop
    nop
    nop
    nop
    nop
    bne     $3,  $2, fail
    nop
    nop
    nop
    nop
    nop
    nop
    bne     $3,  $2, fail
    nop
    nop
    nop
    nop
    nop
    nop
    bne     $3,  $2, fail
    nop
    nop
    nop
    nop
    nop
    nop
    bne     $3,  $2, fail
    nop
    nop
    nop
    nop
    nop
    nop
    bne     $1,  $2, level3
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
level1:
    add     $5,  $4, $1
    beq     $1,  $2, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $1,  $2, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $1,  $2, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $1,  $2, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $1,  $2, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $2,  $1, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $2,  $1, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $2,  $1, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $2,  $1, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $2,  $1, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $2,  $3, level2
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
    nop
    nop
    nop
    nop
    nop
    nop
    beq     $0,  $0, fail
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
