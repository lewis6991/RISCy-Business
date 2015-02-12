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
    input               BranchTaken,
    input        [31:0] BranchAddr ,
                        InstrMem   ,
    output logic [15:0] InstrAddr  ,
    output logic [31:0] InstrOut   ,
                        PCAddrInc        
);
    wire        Clock       ,
                nReset      ;
    wire [31:0] progaddrout ,
                progaddrnext,
                progaddrinc ;
    
    pc pc0(
        .Clock      (Clock       ),
        .nReset     (nReset      ),
        .ProgAddrIn (progaddrnext),
        .ProgAddrOut(progaddrout )
    );
    
    pcinc pcinc0(
        .In (progaddrout),
        .Out(progaddrinc)
    );
    
    mux mux0(
        .sel(BranchTaken ),
        .A  (progaddrinc ),
        .B  (BranchAddr  ),
        .Y  (progaddrnext)
    );
    
    assign InstrAddr = progaddrout;
    assign InstrOut  = InstrMem   ;
    assign PCAddrInc = progaddrinc;

endmodule
