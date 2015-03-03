//------------------------------------------------------------------------------
// File              : decoder.sv
// Description       : Control Unit for the processor
// Primary Author    : Dhanushan Raveendran
// Other Contributors: Ethan Bishop, Lewis Russell
// Notes             :
//------------------------------------------------------------------------------

`include "op_definition.sv"
`include "alu_definition.sv"
`include "mul_definition.sv"

module decoder(
    output logic [1:0] RegDst  ,
    output logic       Branch  ,
                       Jump    ,
                       MemRead ,
                       MemtoReg,
                       ALUOp   ,
                       MULOp   ,
                       MemWrite,
                       ALUSrc  ,
                       RegWrite,
                       ShiftSel,
                       ImmSize ,
                       Unsgnsel,
    output logic [5:0] Func    ,
    input        [5:0] OpCode  ,
                       FuncCode
);

    always_comb
    begin
        RegDst   = 2'b00    ;
        Branch   = 1'b0     ;
        Jump     = 1'b0     ;
        MemRead  = 1'b0     ;
        MemtoReg = 1'b0     ;
        ALUOp    = 1'b0     ;
        MULOp    = 1'b0     ;
        MemWrite = 1'b0     ;
        ALUSrc   = 1'b0     ;
        RegWrite = 1'b0     ;
        ShiftSel = 1'b0     ;
        ImmSize  = 1'b0     ;
        Unsgnsel = 1'b0     ;
        Func     = 6'b000000;

        case(OpCode)
            `ALU:
                case(FuncCode)
                    `ADD:
                    begin
                        RegDst   = 2'b1;
                        Func     = `ADD;
                        ALUOp    = 1'b1;
                        RegWrite = 1'b1;
                    end

                    `ADDU:
                    begin
                        RegDst   = 2'b1;
                        Func     = `ADDU;
                        ALUOp    = 1'b1 ;
                        RegWrite = 1'b1 ;
                    end

                    `SUB:
                    begin
                        RegDst   = 2'b1;
                        Func     = `SUB;
                        ALUOp    = 1'b1;
                        RegWrite = 1'b1;
                    end

                    `SUBU:
                    begin
                        RegDst   = 2'b1;
                        Func     = `SUBU;
                        ALUOp    = 1'b1 ;
                        RegWrite = 1'b1 ;
                    end

                    `SLL:
                    begin
                        RegDst   = 2'b1;
                        Func     = `SLL;
                        ALUOp    = 1'b1;
                        RegWrite = 1'b1;
                    end

                    `SLLV:
                    begin
                        RegDst   = 2'b1;
                        Func     = `SLLV;
                        ALUOp    = 1'b1 ;
                        RegWrite = 1'b1 ;
                    end

                    `SRA:
                    begin
                        RegDst   = 2'b1;
                        Func     = `SRA;
                        ALUOp    = 1'b1;
                        RegWrite = 1'b1;
                    end

                    `SRAV:
                    begin
                        RegDst   = 2'b1;
                        Func     = `SRAV;
                        ALUOp    = 1'b1 ;
                        RegWrite = 1'b1 ;
                    end

                    `SRL:
                    begin
                        RegDst   = 2'b1;
                        Func     = `SRL;
                        ALUOp    = 1'b1;
                        RegWrite = 1'b1;
                    end

                    `SRLV:
                    begin
                        RegDst   = 2'b1;
                        Func     = `SRLV;
                        ALUOp    = 1'b1;
                        RegWrite = 1'b1;
                    end

                    `AND:
                    begin
                        RegDst   = 2'b1;
                        Func     = `AND;
                        ALUOp    = 1'b1;
                        RegWrite = 1'b1;
                    end

                    `NOR:
                    begin
                        RegDst   = 2'b1;
                        Func     = `NOR;
                        ALUOp    = 1'b1;
                        RegWrite = 1'b1;
                    end

                    `OR:
                    begin
                        RegDst   = 2'b1;
                        Func     = `OR ;
                        ALUOp    = 1'b1;
                        RegWrite = 1'b1;
                    end

                    `XOR:
                    begin
                        RegDst   = 2'b1;
                        Func     = `XOR;
                        ALUOp    = 1'b1;
                        RegWrite = 1'b1;
                    end

                    `MOVN:
                    begin
                        RegDst   = 2'b1;
                        Func     = `MOVN;
                        ALUOp    = 1'b1 ;
                        RegWrite = 1'b1 ;
                    end

                    `MOVZ:
                    begin
                        RegDst   = 2'b1;
                        Func     = `MOVZ;
                        ALUOp    = 1'b1 ;
                        RegWrite = 1'b1 ;
                    end

                    `SLT:
                    begin
                        RegDst   = 2'b1;
                        Func     = `SLT;
                        ALUOp    = 1'b1;
                        RegWrite = 1'b1;
                    end

                    `SLTU:
                    begin
                        RegDst   = 2'b1;
                        Func     = `SLTU;
                        ALUOp    = 1'b1 ;
                        RegWrite = 1'b1 ;
                    end

                    `MULT:
                    begin
                        Func  = `MULT;
                        ALUOp = 1'b1 ;
                    end

                    `MULTU:
                    begin
                        Func  = `MULTU;
                        ALUOp = 1'b1  ;
                    end

                    `MFHI:
                    begin
                        RegDst = 2'b1 ;
                        Func   = `MFHI;
                        ALUOp  = 1'b1 ;
                        RegWrite = 1'b1 ;
                    end

                    `MFLO:
                    begin
                        RegDst = 2'b1 ;
                        Func   = `MFLO;
                        ALUOp  = 1'b1 ;
                        RegWrite = 1'b1 ;
                    end

                    `MTHI:
                    begin
                        Func  = `MTHI;
                        ALUOp = 1'b1 ;
                    end

                    `MTLO:
                    begin
                        Func  = `MTLO;
                        ALUOp = 1'b1 ;
                    end

                    `JALR:
                    begin
                        RegDst   = 2'b1 ;
                        Func     = `JAL ;
                        Jump     = 1'b1 ;
                        RegWrite = 1'b1 ;
                    end

                    `JR:
                    begin
                        Func     = `J   ;
                        Jump     = 1'b1 ;
                    end

                    default:;
                endcase

            `BRANCH:
                case(FuncCode)
                    `BGEZ:
                    begin
                        Func     = `BGEZ;
                        Branch   = 1'b1 ;
                        ALUSrc   = 1'b1 ;
                    end

                    `BGEZAL:
                    begin
                        RegDst   = 2'b10;
                        Func     = `BGEZAL;
                        ALUSrc   = 1'b1 ;
                        Branch   = 1'b1 ;
                        RegWrite = 1'b1 ;
                    end

                    `BLTZ:
                    begin
                        Func     = `BLTZ;
                        Branch   = 1'b1 ;
                        ALUSrc   = 1'b1 ;
                    end

                    `BLTZAL:
                    begin
                        RegDst   = 2'b10;
                        Func     = `BLTZAL;
                        ALUSrc   = 1'b1 ;
                        Branch   = 1'b1 ;
                        RegWrite = 1'b1 ;
                    end

                    default:;
                endcase

            `MULL:
                case(FuncCode)
                    `CLO:
                    begin
                        RegDst   = 2'b1;
                        Func     = `ALU_CLO;
                        MULOp    = 1'b1;
                        RegWrite = 1'b1;
                    end
                    `CLZ:
                    begin
                        RegDst   = 2'b1;
                        Func     = `ALU_CLZ;
                        MULOp    = 1'b1;
                        RegWrite = 1'b1;
                    end

                    `MADD:
                    begin
                        Func  = `MADD;
                        MULOp = 1'b1 ;
                    end

                    `MADDU:
                    begin
                        Func  = `MADDU;
                        MULOp = 1'b1 ;
                    end

                    `MSUB:
                    begin
                        Func  = `MSUB;
                        MULOp = 1'b1 ;
                    end

                    `MSUBU:
                    begin
                        Func  = `MSUBU;
                        MULOp = 1'b1 ;
                    end

                    `MUL:
                    begin
                        RegDst   = 2'b1 ;
                        Func     = `MUL;
                        MULOp    = 1'b1 ;
                        RegWrite = 1'b1 ;
                    end

                    default:;
                endcase

            `ADDI:
            begin
                Func     = `ADD;
                ALUOp    = 1'b1 ;
                ALUSrc   = 1'b1 ;
                RegWrite = 1'b1 ;

            end

            `ADDIU:
            begin
                Unsgnsel = 1'b1;
                Func     = `ADDU;
                ALUOp    = 1'b1  ;
                ALUSrc   = 1'b1  ;
                RegWrite = 1'b1  ;
            end

            `LUI:
            begin
                Func     = `ADD;
                ALUOp    = 1'b1;
                ALUSrc   = 1'b1;
                ShiftSel = 1'b1;
                RegWrite = 1'b1;
            end

            `ANDI:
            begin
                Unsgnsel = 1'b1;
                Func     = `AND;
                ALUOp    = 1'b1 ;
                ALUSrc   = 1'b1 ;
                RegWrite = 1'b1 ;
            end

            `ORI:
            begin
                Unsgnsel = 1'b1;
                Func     = `OR ;
                ALUOp    = 1'b1;
                ALUSrc   = 1'b1;
                RegWrite = 1'b1;
            end

            `XORI:
            begin
                Unsgnsel = 1'b1;
                Func     = `XOR ;
                ALUOp    = 1'b1;
                ALUSrc   = 1'b1;
                RegWrite = 1'b1;
            end

            `SLTI:
            begin
                Func     = `SLT ;
                ALUOp    = 1'b1;
                ALUSrc   = 1'b1;
                RegWrite = 1'b1;
            end

            `SLTIU:
            begin
                Unsgnsel = 1'b1;
                Func     = `SLTU ;
                ALUOp    = 1'b1;
                ALUSrc   = 1'b1;
                RegWrite = 1'b1;
            end

            `BEQ:
            begin
                Func     = `BEQ ;
                Branch   = 1'b1;
                ALUSrc   = 1'b1;
            end

            `BGTZ:
            begin
                Func     = `BGTZ;
                Branch   = 1'b1;
                ALUSrc   = 1'b1;
            end

            `BLEZ:
            begin
                Func     = `BLEZ;
                Branch   = 1'b1;
                ALUSrc   = 1'b1;
            end

            `BNE:
            begin
                Func     = `BNE ;
                Branch   = 1'b1;
                ALUSrc   = 1'b1;
            end

            `J:
            begin
                Func     = `J   ;
                Jump     = 1'b1;
                ALUSrc   = 1'b1;
                ImmSize  = 1'b1;
            end

            `JAL:
            begin
                RegDst   = 2'b10;
                Func     = `JAL ;
                Jump     = 1'b1;
                ALUSrc   = 1'b1;
                ImmSize  = 1'b1;
            end

            `LB:
            begin
                Func     = `ADD;
                ALUSrc   = 1'b1;
                MemRead  = 1'b1;
                MemtoReg = 1'b1;
                RegWrite = 1'b1;
            end
            `LBU:
            begin
                Func     = `ADD;
                ALUSrc   = 1'b1;
                MemRead  = 1'b1;
                MemtoReg = 1'b1;
                RegWrite = 1'b1;
            end
            `LH:
            begin
                Func     = `ADD;
                ALUSrc   = 1'b1;
                MemRead  = 1'b1;
                MemtoReg = 1'b1;
                RegWrite = 1'b1;
            end
            `LHU:
            begin
                Func     = `ADD;
                ALUSrc   = 1'b1;
                MemRead  = 1'b1;
                MemtoReg = 1'b1;
                RegWrite = 1'b1;
            end
            `LW:
            begin
                Func     = `ADD;
                ALUSrc   = 1'b1;
                MemRead  = 1'b1;
                MemtoReg = 1'b1;
                RegWrite = 1'b1;
            end
            `LWL:
            begin
                Func     = `ADD;
                ALUSrc   = 1'b1;
                MemRead  = 1'b1;
                MemtoReg = 1'b1;
                RegWrite = 1'b1;
            end
            `LWR:
            begin
                Func     = `ADD;
                ALUSrc   = 1'b1;
                MemRead  = 1'b1;
                MemtoReg = 1'b1;
                RegWrite = 1'b1;
            end
            `SB:;
            `SH:;
            `SW:;
            `SWL:;
            `SWR:;
            `LL:;
            `SC:;
            default:;
        endcase
    end
endmodule
