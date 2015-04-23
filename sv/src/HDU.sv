//-----------------------------------------------------------------------------------------------
// File              : HDU.sv
// Description       : Hazard Detection Unit to stall the processor during unavoidable hazards
// Primary Author    : Dhanushan Raveendran
// Other Contributors:
// Notes             :
//-----------------------------------------------------------------------------------------------

`include "op_definition.sv"

module HDU(
    input        MemReadE,
    input [5:0]  OpCodeE ,
    input [4:0]  RtAddrE ,
                 RsAddrD ,
                 RtAddrD ,
    output logic nStall
);

always_comb
    if ((MemReadE && (RtAddrE == RsAddrD || RtAddrE == RtAddrD)) || (OpCodeE == `MULL))
        nStall <= 1'b0;
    else
        nStall <= 1'b1;

endmodule
