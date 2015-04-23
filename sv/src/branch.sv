//------------------------------------------------------------------------------
// File              : branch.sv
// Description       : Branch logic for execute stage
// Primary Author    : Ethan Bishop
// Other Contributors: Lewis Russell
// Notes             : Controls the PC for JUMP and BRANCH instructions
//------------------------------------------------------------------------------

`include "op_definition.sv"
`include "alu_definition.sv"
`include "branch_definition.sv"

module branch(
    input               C      ,
                        O      ,
                        N      ,
                        Z      ,
    input        [ 2:0] BrCode ,
    input               BrRt   ,
    output logic        Taken    // Branch taken
);

    always_comb
        case (BrCode)
            `BEQ   : Taken =  Z               ;
            `BNE   : Taken = ~Z               ;
            `BGTZ  : Taken = ~Z & ~N          ;
            `BLEZ  : Taken =  Z |  N          ;
            `BRANCH: Taken = BrRt ? Z | ~N : N;
            default: Taken = 0                ;
        endcase

endmodule
