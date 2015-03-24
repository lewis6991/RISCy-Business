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
    input        [ 2:0] MemfuncIn   ,
    input        [31:0] RtDataIn    ,
    output logic        WriteL      ,
                        WriteR      ,
    output logic [31:0] MemWriteData
);

    always_comb
    begin
        WriteL = MemfuncIn == `WL;
        WriteR = MemfuncIn == `WR;
        case(MemfuncIn)
            `BS          : MemWriteData = {{24{RtDataIn[ 7]}}, RtDataIn[ 7:0]};
            `HS          : MemWriteData = {{16{RtDataIn[15]}}, RtDataIn[15:0]};
            `WD, `WL, `WR: MemWriteData = RtDataIn;
            default      : MemWriteData = RtDataIn;
        endcase
    end

endmodule
