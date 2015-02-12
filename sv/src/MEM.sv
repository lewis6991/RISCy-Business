//------------------------------------------------------------------------------
// File              : MEM.sv
// Description       : Memory pipeline stage
// Primary Author    : Dominic Murphy
// Other Contributors: Lewis Russell
// Notes             : - The memory section of the pipeline will interface with
//                       off chip memory. This is yet undetermined, hence memory
//                       is currently bypassed.
//                     - Bypass behaviour: MemDataIn = MemDataOut. MemAddr
//                       ignored.
//                     - Assumed asynchronous for the time being.
//------------------------------------------------------------------------------
module MEM(
    input               MemWrite,
                        MemRead,
                        RegWriteIn,
			MemtoRegIn,
    input        [ 4:0] RAddrIn,
    input        [15:0] MemAddr, 
    input        [31:0] MemDataIn,
                        ALUDataIn,
    output logic        RegWriteOut,
                        MemtoRegOut,
    output logic [ 4:0] RAddrOut,
    output logic [31:0] MemDataOut,
    output logic [31:0] ALUDataOut
);

    assign MemDataOut  = MemDataIn;
    assign ALUDataOut  = MemAddr;
    assign RAddrOut    = RAddrIn;
    assign RegWriteOut = RegWriteIn;

endmodule
