#-----------------------------------------------------------------------------
# File              : testcase7.c
# Description       : Assembler code for test case 7 of the directed tests.
#                     This tests all of the memory instructions.
# Pimrary Author    : Ethan Bishop
# Other Contributers: Lewis Russell
# Notes             : To generate machine code, run cross-compiler using command:
#                           gcc -Wa,-adhln -c -O -mips32 -EB test.c
#                     - At current, the memory is assumed to be single-cycle.
#------------------------------------------------------------------------------
    .set    noreorder
    .set    noat

nop
nop
nop
    li      $1,       0x12340000
    ori     $1,  $1,  0x5678
    li      $2,       0x89ab0000
    ori     $2,  $2,  0xcdef

    li      $3,       0x00000000
    ori     $3,  $3,  0x0100

    sw      $1,  0($0)
    nop
    lw      $4,  0($0) # Should load 0x12345678
    nop
    lh      $5,  0($0) # Should load 0x00001234
    nop
    lb      $6,  0($0) # Should load 0x00000012
    nop

    sw      $2,  4($3)
    nop
    lw      $7,  4($3) # Should load 0x89abcdef
    nop
    lhu     $8,  4($3) # Should load 0x000089ab
    nop
    lbu     $9,  4($3) # Should load 0x00000089
    nop

    lh      $10, 4($3) # Should load 0xffff89ab
    nop
    lb      $11, 4($3) # Should load 0xffffff89
    nop

    li      $12,      0x44440000
    nop
    ori     $12, $12, 0x6666
    lwl     $12, 0($0) # Should become 0x12346666
    nop

    li      $13,      0x55550000
    ori     $13, $13, 0x7777
    lwr     $13, 4($3) # Should become 0x5555cdef
    nop

    sw      $1,  8($3)
    nop
    sh      $2,  8($3)
    nop
    lw      $14, 8($3) # Should load 0xcdef5678
    nop

    sw      $1,  12($3)
    nop
    sb      $2,  12($3)
    nop
    lw      $15, 12($3) # Should load 0xef345678
    nop

    sw      $1,  16($3)
    nop
    swl     $2,  16($3)
    nop
    lw      $16, 16($3) # Should load 0x89ab5678
    nop

    sw      $1,  20($3)
    nop
    swr     $2,  20($3)
    nop
    lw      $16, 20($3) # Should load 0x1234cdef
    nop

    sw      $2,  24($3)
    nop
    ll      $17, 24($3)
    nop
    sc      $17, 24($3) # Should succeed, $17 = 1
    nop
    lw      $18, 24($3) # Should load 0x89ac1234
    nop

    sw      $2,  32($3)
    nop
    ll      $19, 32($3)
    nop
    ll      $20, 32($3)
    nop
    nop
    nop
    nop
    nop
    addi    $19, $19, 0x4445
    addi    $20, $20, 1
    sc      $19, 32($3) # Should succeed, $19 = 1
    nop
    lw      $19, 32($3) # Should load 0x89ab1234
    nop
    sc      $20, 32($3) # Should fail, $20 = 0
    nop
    lw      $20, 32($3) # Should load 0x89ab1234
    nop
    nop
    nop
    nop

