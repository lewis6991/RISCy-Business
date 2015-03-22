//------------------------------------------------------------------------------
// File              : instruction.sv
// Description       : Base class to model CPU instructions.
// Primary Author    : Lewis Russell
// Other Contributers:
// Notes             :
//------------------------------------------------------------------------------
class Instruction;
    rand enum { R, I, J } format;
    rand enum { MEM, BRANCH } inst_type;

    rand e_op_code        op_code       ;
    rand e_op_code        op_code_mem   ;
    rand e_op_code        op_code_branch;
    rand bit       [ 4:0] rs            ;
    rand bit       [ 4:0] rt            ;
    rand bit       [ 4:0] rd            ;
    rand bit       [ 4:0] shamt         ;
    rand e_alu_func       alu_func      ;
    rand e_mul_func       mul_func      ;
    rand e_branch_func    branch_func   ;
    rand bit       [ 5:0] func          ;
    rand bit signed[15:0] imm           ;
    rand bit       [25:0] address       ;

    constraint c_op_code_mem {
        op_code_mem inside {
            LB, LBU, LH, LHU, LW, LWL, LWR, SB, SH, SW, SWL, SWR, LL, SC
        };
    }

    constraint c_op_code_branch {
        op_code_branch inside { BRANCH, BEQ, BGTZ, BLEZ, BNE };
    }

    constraint c_op_code {
        if (format == R)
            op_code inside { ALU, MULL };
        else if (format == I)
            op_code inside {
                ADDI, ADDIU, LUI, ANDI, ORI, XORI, SLTI, SLTIU,
                op_code_branch, op_code_mem
            };
        else if (format == J)
            op_code inside { J, JAL };
    }

    constraint c_func {
        if (op_code == ALU)
            func == alu_func;
        else if (op_code == MULL)
            func == mul_func;
        else
            func == 0;
    }

    constraint c_address {
        address[25:8] == 18'b0;
    }

    constraint c_rd {
        if (op_code == MULL) {
            if (mul_func inside { MADD, MADDU, MSUB, MSUBU })
                rd == 0;
            else
                rd != 0;
        }
        else if (op_code == ALU) {
            if (alu_func inside {MULT, MULTU, MTHI, MTLO})
                rd == 0;
            else
                rd != 0;
        }
    }

    constraint c_rs {
        if (op_code == LUI)
            rs == 0;
        else if (op_code == ALU && func inside { MFLO, MFHI, SRL, SRA, SLL })
            rs == 0;
    }

    constraint c_shamt {
        if (op_code == ALU && func inside { SRL, SRA, SLL })
            shamt inside {[0:20]};
        else
            shamt == 0;
    }

    constraint c_rt {
        if (op_code == BRANCH)
            rt == branch_func;
        else if (op_code == ALU) {
            if (alu_func inside { JR, JALR, MTHI, MTLO, MFHI, MFLO })
                rt == 0;
        }
        else if (op_code inside { BLEZ, BGTZ })
            rt == 0;
    }

    constraint c_imm {
        if (op_code[5]) // if memory instruction
            imm[15:4] == 0;
        else if(format == J || op_code inside {BRANCH, BEQ, BNE, BGTZ, BLEZ})
        {
            imm < 8000;
            imm > -8000;
        }
    }

    function bit[31:0] getInstruction();
        case (format)
            R: getInstruction[31:0] = {op_code, rs, rt, rd, shamt, func};
            I: getInstruction[31:0] = {op_code, rs, rt, imm            };
            J: getInstruction[31:0] = {op_code, address                };
        endcase
    endfunction

endclass
