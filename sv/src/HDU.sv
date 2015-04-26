//------------------------------------------------------------------------------
// File              : HDU.sv
// Description       : Hazard Detection Unit to stall the processor during
//                     unavoidable hazards
// Primary Author    : Dhanushan Raveendran
// Other Contributors:
// Notes             :
//-------------------------------------------------------------------------------

`include "mul_definition.sv"

module HDU(
    input        MemReadE,
    input        MULOp   ,
    input        Branch  ,
    input [5:0]  Func    ,
    input [4:0]  RtAddrE ,
                 RsAddrD ,
                 RtAddrD ,
    output logic Stall
);

always_comb
if (MemReadE && (RtAddrE == RsAddrD || RtAddrE == RtAddrD)
|| (Func inside {`MUL, `CLO, `CLZ} && MULOp) || Branch)
    Stall <= 1'b1;
else
    Stall <= 1'b0;

endmodule
