//-----------------------------------------------------------------------------
// File              : testcase3.sv
// Description       : Assembler code for test case 3 of the directed tests.
//                     This test exercises accumulator instructions.
// Pimrary Author    : Lewis Russell
// Other Contributers:
//------------------------------------------------------------------------------
32'h3C011234, // li    $1,     0x12340000
32'h34215678, // ori   $1, $1, 0x5678
32'h3C020123, // li    $2,     0x01230000
32'h34424567, // ori   $2, $2, 0x4567
32'h70221802, // mul   $3, $1, $2
32'h00200011, // mthi  $1
32'h00200013, // mtlo  $1
32'h00220018, // mult  $1, $2
32'h00002010, // mfhi  $4
32'h00002812, // mflo  $5
32'h70220000, // madd  $1, $2
32'h00003010, // mfhi  $6
32'h00003812, // mflo  $7
32'h70420004, // msub  $2, $2
32'h00004010, // mfhi  $8
32'h00004812, // mflo  $9
32'h70420001, // maddu $2, $2
32'h00005010, // mfhi  $10
32'h00005812, // mflo  $11
32'h70420005, // msubu $2, $2
32'h00006010, // mfhi  $12
32'h00006812, // mflo  $13
32'h00220019, // multu $1, $2
32'h00007010, // mfhi  $14
32'h00007812, // mflo  $15
32'h00200011, // mthi  $1
32'h00400013, // mtlo  $2
32'h00008010, // mfhi  $16
32'h00008812, // mflo  $17
32'h00000000, // nop
32'h00000000, // nop
32'h00000000, // nop
32'h00000000, // nop
32'h00000000  // nop