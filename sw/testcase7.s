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

    li      $1,       0x12340000
    ori     $1,  $1,  0x5678
    li      $2,       0x89ab0000
    ori     $2,  $2,  0xcdef
    
    li      $3,       0x00000000
    ori     $3,  $3,  0x0100
    
    sw      $1,  0($0)
    lw      $4,  0($0) # Should load 0x12345678
    lh      $5,  0($0) # Should load 0x00001234
    lb      $6,  0($0) # Should load 0x00000012
    
    sw      $2,  4($3)
    lw      $7,  4($3) # Should load 0x89abcdef
    lhu     $8,  4($3) # Should load 0x000089ab
    lbu     $9,  4($3) # Should load 0x00000089
    
    lh      $10, 4($3) # Should load 0xffff89ab
    lb      $11, 4($3) # Should load 0xffffff89
    
    li      $12,      0x44440000
    ori     $12, $12, 0x6666
    lwl     $12, 0($0) # Should become 0x12346666
    
    li      $13,      0x55550000
    ori     $13, $13, 0x7777
    lwr     $13, 4($3) # Should become 0x5555cdef
    
    sw      $1,  8($3)
    sh      $2,  8($3)
    lw      $14, 8($3) # Should load 0xcdef5678
    
    sw      $1,  12($3)
    sb      $2,  12($3)
    lw      $15, 12($3) # Should load 0xef345678
    
    /*sw      $1,  16($3)
    swl     $2,  16($3)
    lw      $16, 16($3) # Should load 0x89ab5678
    
    sw      $1,  20($3)
    swr     $2,  20($3)
    lw      $16, 20($3) # Should load 0x1234cdef*/
    
    # These haven't been implemented yet
    /*sw      $2,  24($3)
    ll      $17, 24($3)
    addi    $17, $17, 0x4445
    sc      $17, 24($3) # Should succeed, $17 = 1
    lw      $18, 24($3) # Should load 0x89ac1234*/
    
    /*sw      $2,  32($3)
    ll      $19, 32($3)
    ll      $20, 32($3)
    addi    $19, $19, 0x4445
    addi    $20, $20, 1
    sc      $19, 32($3) # Should succeed, $19 = 1
    lw      $19, 32($3) # Should load 0x89ab1234
    sc      $20, 32($3) # Should fail, $20 = 0
    lw      $20, 32($3) # Should load 0x89ab1234*/
    
