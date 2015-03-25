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
    input               Enable , // Enable branch module
                        ALUC   ,
                        ALUO   ,
                        ALUN   ,
                        ALUZ   ,
    input        [31:0] PCIn   , // Program counter input.
    input        [31:0] Address, // Address input
    input        [ 2:0] BrCode ,
    input               BrRt ,
    output logic [31:0] PCout  , // Program counter
                        Ret    , // Return address
    output logic        Taken    // Branch taken
);

    always_comb
    begin
        PCout = PCIn;
        Taken = 0;

        if (Enable)
        begin
            case (BrCode)
                `BEQ    : Taken =  ALUZ;
                `BNE    : Taken = ~ALUZ;
                `BGTZ   : Taken = ~ALUZ & ~ALUN;
                `BLEZ   : Taken = ALUZ | ALUN ;
                `BRANCH :
                case (BrRt)
                    1: Taken = ALUZ | ~ALUN; // BGEZ, BGEZAL
                    0: Taken = ALUN        ; // BLTZ, BLTZAL
                endcase
            endcase
            case (BrCode)
                `J, `JAL    : PCout = {PCIn[31:28], Address[25:0], 2'd0};
                `ALU        : PCout = Address;
                `BEQ , `BNE ,
                `BGTZ, `BLEZ,
                `BRANCH     : if (Taken) PCout = PCIn + {Address[29:0], 2'd0};
            endcase
        end
    end

    assign Ret = PCIn + 8;

endmodule
