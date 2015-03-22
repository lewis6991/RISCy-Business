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
    input               RegWriteIn  ,
			            MemtoRegIn  ,
                        MemReadIn   ,
                        MemWriteIn  ,
    input        [ 4:0] RAddrIn     ,
    input        [ 2:0] MemfuncIn   ,
    input        [31:0] RtDataIn    ,
                        ALUDataIn   ,
    output logic        RegWriteOut ,
                        MemtoRegOut ,
                        MemWrite    ,
                        MemRead     ,
                        WriteL      ,
                        WriteR      ,
    output logic [ 2:0] MemfuncOut  ,
    output logic [ 4:0] RAddrOut    ,
    output logic [15:0] MemAddr     ,
    output logic [31:0] MemWriteData,
                        ALUDataOut  ,
                        RtDataOut
);

    always_comb
        begin
            WriteL = 0;
            WriteR = 0;
            case(MemfuncIn)
                `BS    : MemWriteData = {{24{RtDataIn[ 7]}},RtDataIn[ 7:0]};
                `HS    : MemWriteData = {{16{RtDataIn[15]}},RtDataIn[15:0]};
                `WD    : MemWriteData = RtDataIn                           ;
                `WL    : begin
                             WriteL = 1                                    ;
                             MemWriteData = RtDataIn                       ;
                         end
                `WR    : begin
                             WriteR = 1                                    ;
                             MemWriteData = RtDataIn                       ;
                         end
                default: MemWriteData = RtDataIn                           ;
            endcase
        end

assign RegWriteOut = RegWriteIn;
assign MemtoRegOut = MemtoRegIn;
assign MemWrite    = MemWriteIn;
assign MemRead     = MemReadIn ;
assign RAddrOut    = RAddrIn   ;
assign MemAddr     = ALUDataIn ;
assign ALUDataOut  = ALUDataIn ;
assign RtDataOut   = RtDataIn  ;
assign MemfuncOut  = MemfuncIn ;

endmodule
