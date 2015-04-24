//------------------------------------------------------------------------------
// File              : IF.sv
// Description       : Instruction Fetch pipeline stage
// Primary Author    : Dominic Murphy
// Other Contributors: Lewis Russell, Dhanushan Raveendran
// Notes             : - The program counter will increment and be used as
//                       the next instruction.
//                     - In the case where BranchTaken is high, BranchAddr will
//                       be used instead.
//                     - The instruction memory interfaces with this module
//                       ONLY.
//                     - The 16-bit InstrAddr requests the address, and expects
//                       a 32-bit instruction to be returned on InstrMem. This
//                       will be forwarded out of this module to InstrOut for
//                       the pipeline stage.
//------------------------------------------------------------------------------

module IF(
    input               Clock      ,
                        nReset     ,
                        nStall     ,
                        BranchTaken,
                        Jump       ,
                        RevBranch  ,
    input        [31:0] BranchAddr ,
                        RevBranchAddr,
                        JumpAddr   ,
                 [31:0] InstrMem   ,
    output logic [15:0] InstrAddr  ,
    output logic [31:0] InstrOut
);

    logic [31:0] progAddrOut ;
    wire  [31:0] progAddrMOut;

    always_ff @ (posedge Clock, negedge nReset)
        if (~nReset)
            progAddrOut <= #1 32'd0;
        else
            progAddrOut <= #1 RevBranch   ? RevBranchAddr :
                              BranchTaken ? BranchAddr    :
                              Jump        ? JumpAddr      : progAddrMOut;

    assign progAddrMOut = nStall ? progAddrOut + 32'd4 : progAddrOut;

    assign InstrAddr = progAddrOut            ;
    assign InstrOut  = InstrMem & {32{nStall}};

endmodule
