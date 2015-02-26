//-----------------------------------------------------------------------------
// File              : testcase1.sv
// Description       : Assembler code for test case 1 of the directed tests.
//                     This test exercises basic functionality.
// Pimrary Author    : Lewis Russell
// Other Contributers:
//------------------------------------------------------------------------------
32'h3C011234, // LUI $1 'h1234
32'h34215678, // ORI $1 'h5678
32'h3C025555, // LUI $2 'h5555
32'h00000000, // NOP
32'h34427777, // ORI $2 'h7777
32'h00411820, // ADD $3 $1 $2
32'h00000000, // NOP
32'h00000000, // NOP
32'h00000000, // NOP
32'h00000000, // NOP
32'h00000000  // NOP
