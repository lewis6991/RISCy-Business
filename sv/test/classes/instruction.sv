//------------------------------------------------------------------------------
// File              : instruction.sv
// Description       : Base class to model CPU instructions.
// Primary Author    : Lewis Russell
// Other Contributers:
// Notes             :
//------------------------------------------------------------------------------

class Instruction;
    rand enum { R, I, J } format;

    rand bit[ 5:0] opCode ;
    rand bit[ 4:0] rs     ;
    rand bit[ 4:0] rt     ;
    rand bit[ 4:0] rd     ;
    rand bit[ 4:0] shamt  ;
    rand bit[ 5:0] func   ;
    rand bit[15:0] imm    ;
    rand bit[25:0] address;

    constraint c_opCode {
        case (format)
            R: opCode inside { 6'h0, 6'h10 };
            I: opCode inside { 6'h4, 6'h5, [6'h8: 6'hD], 6'hF, [6'h23:6'h25],
                               6'h28, 6'h29, 6'h2B };
            J: opCode inside { 6'h2, 6'h3 };
        endcase
    }

    constraint c_func {
        func inside {
            6'h00, 6'h02, 6'h03, 6'h08, 6'h10,
            6'h12, 6'h18, 6'h19, 6'h1A, 6'h1B,
            [6'h20:6'h27], 6'h02A, 6'h2B
        };
    }

    constraint c_address {
        address[25:8] == 18'b0;
    }

    function bit[31:0] getInstruction();
        case (format)
            R: getInstruction[25:0] = {opCode, rs, rt, rd, shamt, func};
            I: getInstruction[25:0] = {opCode, rs, rt, imm            };
            J: getInstruction[25:0] = {opCode, address                };
        endcase
    endfunction

endclass
