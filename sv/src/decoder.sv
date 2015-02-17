//------------------------------------------------------------------------------
// File              : decoder.sv
// Description       : Control Unit for the processor
// Primary Author    : Dhanushan Raveendran
// Other Contributors: Lewis Russell
// Notes             :
//------------------------------------------------------------------------------

`include "op_definition.sv"
`include "alu_definition.sv"
`include "mul_definition.sv"

module decoder(
    output logic       RegDst  ,
                       Branch  ,
                       Jump    ,
                       MemRead ,
                       MemtoReg,
                       ALUOp   ,
                       MULOp   ,
                       MemWrite,
                       ALUSrc  ,
                       RegWrite,
                       ShiftSel,
    output logic [5:0] Func    ,
    input        [5:0] OpCode  ,
                       FuncCode
);

    always_comb
    begin
        RegDst   = 1'b0     ;
        Branch   = 1'b0     ;
        Jump     = 1'b0     ;
        MemRead  = 1'b0     ;
        MemtoReg = 1'b0     ;
        ALUOp    = 1'b0     ;
        MemWrite = 1'b0     ;
        ALUSrc   = 1'b0     ;
        RegWrite = 1'b0     ;
        ShiftSel = 1'b0     ;
        MULOp    = 1'b0     ;
        Func     = 6'b000000;

        case(OpCode)
            `ALU:
                case(FuncCode)
                    `ADD:
                    begin
                        RegDst   = 1'b1;
                        Func     = `ADD;
                        ALUOp    = 1'b1;
                        RegWrite = 1'b1;
                    end

                    `ADDU:
                    begin
                        RegDst   = 1'b1;
                        Func     = `ADDU;
                        ALUOp    = 1'b1 ;
                        RegWrite = 1'b1 ;
                    end

                    `SUB:
                    begin
                        RegDst   = 1'b1;
                        Func     = `SUB;
                        ALUOp    = 1'b1;
                        RegWrite = 1'b1;
                    end

                    `SUBU:
                    begin
                        RegDst   = 1'b1;
                        Func     = `SUBU;
                        ALUOp    = 1'b1 ;
                        RegWrite = 1'b1 ;
                    end

                    `SLL:
                    begin
                        RegDst   = 1'b1;
                        Func     = `SLL;
                        ALUOp    = 1'b1;
                        RegWrite = 1'b1;
                    end

                    `SLLV:
                    begin
                        RegDst   = 1'b1;
                        Func     = `SLLV;
                        ALUOp    = 1'b1 ;
                        RegWrite = 1'b1 ;
                    end

                    `SRA:
                    begin
                        RegDst   = 1'b1;
                        Func     = `SRA;
                        ALUOp    = 1'b1;
                        RegWrite = 1'b1;
                    end

                    `SRAV:
                    begin
                        RegDst   = 1'b1;
                        Func     = `SRAV;
                        ALUOp    = 1'b1 ;
                        RegWrite = 1'b1 ;
                    end

                    `SRL:
                    begin
                        RegDst   = 1'b1;
                        Func     = `SRL;
                        ALUOp    = 1'b1;
                        RegWrite = 1'b1;
                    end

                    `SRLV:
                    begin
                        RegDst   = 1'b1;
                        Func     = `SRLV;
                        ALUOp    = 1'b1;
                        RegWrite = 1'b1;
                    end

                    `AND:
                    begin
                        RegDst   = 1'b1;
                        Func     = `AND;
                        ALUOp    = 1'b1;
                        RegWrite = 1'b1;
                    end

                    `NOR:
                    begin
                        RegDst   = 1'b1;
                        Func     = `NOR;
                        ALUOp    = 1'b1;
                        RegWrite = 1'b1;
                    end

                    `OR:
                    begin
                        RegDst   = 1'b1;
                        Func     = `OR ;
                        ALUOp    = 1'b1;
                        RegWrite = 1'b1;
                    end

                    `XOR:
                    begin
                        RegDst   = 1'b1;
                        Func     = `XOR;
                        ALUOp    = 1'b1;
                        RegWrite = 1'b1;
                    end

                    `MOVN:
                    begin
                        RegDst   = 1'b1;
                        Func     = `MOVN;
                        ALUOp    = 1'b1 ;
                        RegWrite = 1'b1 ;
                    end

                    `MOVZ:
                    begin
                        RegDst   = 1'b1;
                        Func     = `MOVZ;
                        ALUOp    = 1'b1 ;
                        RegWrite = 1'b1 ;
                    end

                    `SLT:
                    begin
                        RegDst   = 1'b1;
                        Func     = `SLT;
                        ALUOp    = 1'b1;
                        RegWrite = 1'b1;
                    end

                    `SLTU:
                    begin
                        RegDst   = 1'b1;
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
                        RegDst = 1'b1 ;
                        Func   = `MFHI;
                        ALUOp  = 1'b1 ;
                    end

                    `MFLO:
                    begin
                        RegDst = 1'b1 ;
                        Func   = `MFLO;
                        ALUOp  = 1'b1 ;
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
                    end

                    `JR:
                    begin
                    end

                    default:;
                endcase

            `MULL:
                case(FuncCode)
                    `CLO:
                    begin
                        RegDst   = 1'b1;
                        Func     = `CLO;
                        MULOp    = 1'b1;
                        RegWrite = 1'b1;
                    end
                    `CLZ:
                    begin
                        RegDst   = 1'b1;
                        Func     = `CLO;
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
                        RegDst   = 1'b1 ;
                        Func     = `MUL;
                        MULOp    = 1'b1 ;
                        RegWrite = 1'b1 ;
                    end

                    default:;
                endcase

            `ADDI:
            begin
                Func     = `ADDI;
                ALUOp    = 1'b1 ;
                ALUSrc   = 1'b1 ;
                RegWrite = 1'b1 ;
            end

            `ADDIU:
            begin
                Func     = `ADDIU;
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
                Func     = `ANDI;
                ALUOp    = 1'b1 ;
                ALUSrc   = 1'b1 ;
                RegWrite = 1'b1 ;
            end

            `ORI:
            begin
                Func     = `OR ;
                ALUOp    = 1'b1;
                ALUSrc   = 1'b1;
                RegWrite = 1'b1;
            end

            `XORI:
            begin
                Func     = `OR ;
                ALUOp    = 1'b1;
                ALUSrc   = 1'b1;
                RegWrite = 1'b1;
            end

            `SLTI:
            begin
                Func     = `OR ;
                ALUOp    = 1'b1;
                ALUSrc   = 1'b1;
                RegWrite = 1'b1;
            end

            `SLTIU:
            begin
                Func     = `OR ;
                ALUOp    = 1'b1;
                ALUSrc   = 1'b1;
                RegWrite = 1'b1;
            end

            `BEQ:;
            `BGTZ:;
            `BLEZ:;
            `BNE:;
            `J:;
            `JAL:;
            `LB:;
            `LBU:;
            `LH:;
            `LWL:;
            `LWR:;
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
