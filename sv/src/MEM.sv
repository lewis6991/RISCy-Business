//------------------------------------------------------------------------------
// File              : MEM.sv
// Description       : Memory pipeline stage
// Primary Author    : Dominic Murphy
// Other Contributors: Lewis Russell, Dhanushan Raveendran
// Notes             : - The memory section of the pipeline will interface with
//                       off chip memory. This is yet undetermined, hence memory
//                       is currently bypassed.
//                     - Bypass behaviour: MemDataIn = MemDataOut. MemAddr
//                       ignored.
//                     - Assumed asynchronous for the time being.
//------------------------------------------------------------------------------

`include "mem_func.sv"

module MEM(
    input               RegWriteIn,
			MemtoRegIn,
                        MemReadIn,
                        MemWriteIn,
    input        [ 4:0] RAddrIn,
    input        [ 2:0] Memfunc,
    input        [31:0] RtData,
                        ALUDataIn,
                        MemDataIn,
    output logic        RegWriteOut,
                        MemtoRegOut,
                        MemWrite,
                        MemRead,
    output logic [ 4:0] RAddrOut,
    output logic [15:0] MemAddr, 
    output logic [31:0] MemWriteData,
                        MemDataOut,
                        ALUDataOut
);
    
always_comb
    begin
        case(Memfunc)
            `BS    : MemDataOut = {{24{MemDataIn[ 7]}},MemDataIn[ 7:0]};
            `BU    : MemDataOut = {         {24{1'b0}},MemDataIn[ 7:0]};
            `HS    : MemDataOut = {{16{MemDataIn[15]}},MemDataIn[15:0]};
            `HU    : MemDataOut = {         {16{1'b0}},MemDataIn[15:0]};
            `WD    : MemDataOut = MemDataIn                            ;
            `WL    : MemDataOut = {      MemDataIn[31:16],RtData[15:0]};
            `WR    : MemDataOut = {      RtData[31:16],MemDataIn[15:0]};
            default: MemDataOut = MemDataIn                            ; 
        endcase
    end

always_comb
    begin
        case(Memfunc)
            `BS    : MemWriteData = {{24{RtData[ 7]}},RtData[ 7:0]};
            `HS    : MemWriteData = {{16{RtData[15]}},RtData[15:0]};
            `WD    : MemWriteData = RtData                         ;
            default: MemWriteData = RtData                         ;
        endcase
    end
    
    
    assign RegWriteOut  = RegWriteIn;
    assign MemtoRegOut  = MemtoRegIn;
    assign MemWrite     = MemWriteIn;
    assign MemRead      = MemReadIn;
    assign RAddrOut     = RAddrIn;
    assign MemAddr      = ALUDataIn;
    assign ALUDataOut   = ALUDataIn;

endmodule
