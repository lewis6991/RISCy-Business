//------------------------------------------------------------------------------
// File              : addrcalc.sv
// Description       : Calculates the new address for branch and jumps.
// Primary Author    : Lewis Russell
// Other Contributors:
//------------------------------------------------------------------------------

module addrcalc(

    input        [31:0] PCIn   , // Program counter input.
    input        [ 2:0] BrCode ,
    input        [31:0] Address, // Address input
    output logic signed [31:0] PCout
);

always_comb
    case (BrCode)
        `J, `JAL: PCout = {PCIn[31:28], Address[25:0], 2'd0};
        default : PCout = PCIn + {Address[29:0], 2'd0}      ;
    endcase

endmodule
