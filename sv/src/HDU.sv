//------------------------------------------------------------------------------
// File              : HDU.sv
// Description       : Hazard Detection Unit to stall the processor during
//                     unavoidable hazards
// Primary Author    : Dhanushan Raveendran
// Other Contributors:
// Notes             :
//-------------------------------------------------------------------------------

module HDU(
    input        MULOp   ,
    input        ALUOp   ,
    input [5:0]  Func    ,
    output logic Stall
);

always_comb
if (Func inside {`MUL, `CLO, `CLZ} && MULOp)
    Stall <= 1'b1;
else
    Stall <= 1'b0;

endmodule
