//------------------------------------------------------------------------------
// File              : branch.sv
// Description       : Branch logic for execute stage
// Primary Author    : Ethan Bishop
// Other Contributors: Lewis Russell
// Notes             : Controls the PC for JUMP and BRANCH instructions
//------------------------------------------------------------------------------

`include "op_definition.sv"
`include "alu_definition.sv"

module branch(
    input               Enable , // Enable branch module
    input        [31:0] PCIn   , // Program counter input.
    input signed [31:0] A      , // ALU input A
                        B      , // ALU input B
    input        [31:0] Address, // Address input
    input        [ 5:0] Func   ,
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
            case (Func)
                `J, `JAL, `JR, `JALR: Taken = 1     ;
                `BEQ                : Taken = A == B;
                `BNE                : Taken = A != B;
                `BGEZ, `BGEZAL      : Taken = A >= 0;
                `BGTZ               : Taken = A >  0;
                `BLEZ               : Taken = A <= 0;
                `BLTZ, `BLTZAL      : Taken = A <  0;
            endcase
            case (Func)
                `J   , `JAL   : PCout = {PCIn[31:28], Address[25:0], 2'd0};
                `JR  , `JALR  : PCout = Address;
                `BEQ          : if (A == B) PCout = PCIn + {Address[29:0], 2'd0};
                `BNE          : if (A != B) PCout = PCIn + {Address[29:0], 2'd0};
                `BGEZ, `BGEZAL: if (A >= 0) PCout = PCIn + {Address[29:0], 2'd0};
                `BGTZ         : if (A >  0) PCout = PCIn + {Address[29:0], 2'd0};
                `BLEZ         : if (A <= 0) PCout = PCIn + {Address[29:0], 2'd0};
                `BLTZ, `BLTZAL: if (A <  0) PCout = PCIn + {Address[29:0], 2'd0};
            endcase
        end
    end

    assign Ret = PCIn + 8;

endmodule
