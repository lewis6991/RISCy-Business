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
    input        [31:0] PCIn   , // Program counter input.
    input        [31:0] Address, // Address input
    input        [ 2:0] BrCode ,
    input               BrRt   ,
    output logic [31:0] PCout  , // Program counter
                        Ret    , // Return address
    output logic        Taken    // Branch taken
);

    always_comb
    begin
        case (BrCode)
            `BEQ   : Taken =  Z               ;
            `BNE   : Taken = ~Z               ;
            `BGTZ  : Taken = ~Z & ~N          ;
            `BLEZ  : Taken =  Z |  N          ;
            `BRANCH: Taken = BrRt ? Z | ~N : N;
            default: Taken = 0                ;
        endcase
        case (BrCode)
            `J, `JAL: PCout = {PCIn[31:28], Address[25:0], 2'd0};
            `ALU    : PCout = Address                           ;
            default : PCout = PCIn + {Address[29:0], 2'd0}      ;
        endcase
    end

    assign Ret = PCIn + 8;

endmodule
