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
`include "branch_definition.sv"
`include "mem_func.sv"

module decoder(
    output logic [1:0] RegDst  ,
    output logic       Branch  ,
                       ZeroImm ,
                       Jump    ,
                       MemRead ,
                       MemtoReg,
                       ALUOp   ,
                       MULOp   ,
                       MemWrite,
                       ALUSrc  ,
                       BRASrc  ,
                       RegWrite,
                       ShiftSel,
                       ImmSize ,
                       Unsgnsel,
                       ACCEn   ,
                       MULSelB ,
    output logic [5:0] Func    ,
    output logic [2:0] MemFunc ,
    output logic [1:0] OutSel  ,
    input        [5:0] OpCode  ,
                       FuncCode,
    input        [4:0] BraCode
);

    always_comb
    begin
        RegDst   = 2'd0;
        Branch   = 1'b0;
        Jump     = 1'b0;
        MemRead  = 1'b0;
        MemtoReg = 1'b0;
        ALUOp    = 1'b0;
        MULOp    = 1'b0;
        MemWrite = 1'b0;
        ALUSrc   = 1'b0;
        RegWrite = 1'b0;
        ShiftSel = 1'b0;
        ImmSize  = 1'b0;
        Unsgnsel = 1'b0;
        Func     = 6'd0;
        MemFunc  = 3'd0;
        BRASrc   = 1'b0;
        ZeroImm  = 1'b0;
        ACCEn    = 1'b0;
        MULSelB  = 1'b0;
        OutSel   = 2'd0;

        case(OpCode)
            `ALU:
            begin
                Func = FuncCode;
                case(FuncCode)
                    `MULT, `MULTU: MULOp = 1'b1;
                endcase
                case(FuncCode)
                    `ADD , `ADDU, `SUB , `SUBU, `SLL ,
                    `SLLV, `SRA , `SRAV, `SRL , `SRLV,
                    `AND , `NOR , `OR  , `XOR , `MOVN,
                    `MOVZ, `SLT , `SLTU:
                    begin
                        RegDst   = 2'b01;
                        ALUOp    = 1'b1 ;
                        RegWrite = 1'b1 ;
                    end

                    `MFHI, `MFLO:
                    begin
                        RegDst   = 2'b01;
                        ALUOp    = 1'b1 ;
                        RegWrite = 1'b1 ;
                        ACCEn    = 1'b1 ;
                        OutSel   = 2'b10;
                    end

                    `MULT, `MULTU:
                    begin
                        ALUOp   = 1'b1  ;
                        ACCEn   = 1'b1  ;
                        MULSelB = 1'b1  ;
                        OutSel   = 2'b10;
                    end

                    `MTHI, `MTLO:
                    begin
                        ALUOp  = 1'b1 ;
                        ACCEn  = 1'b1 ;
                        OutSel = 2'b10;
                    end

                    `JALR:
                    begin
                        RegDst   = 2'b01;
                        Jump     = 1'b1 ;
                        RegWrite = 1'b1 ;
                        OutSel   = 2'b01;
                    end

                    `JR:
                    begin
                        Jump   = 1'b1 ;
                        OutSel = 2'b01;
                    end
                endcase
            end

            `BRANCH:
            begin
                Func    = `SUB;
                Branch  = 1'b1;
                ZeroImm = 1'b1;
                BRASrc  = 1'b1;
                OutSel  = 2'b01;
                if (BraCode inside { `BGEZAL, `BLTZAL })
                begin
                    RegWrite = 1'b1 ;
                    RegDst   = 2'b10;
                end
            end

            `MULL:
            begin
                MULOp  = 1'b1    ;
                OutSel = 2'b10   ;
                Func   = FuncCode;
                case (FuncCode)
                    `CLO, `CLZ:
                    begin
                        RegDst   = 2'b01;
                        RegWrite = 1'b1 ;
                    end

                    `MUL:
                    begin
                        RegDst   = 2'b01;
                        RegWrite = 1'b1 ;
                        MULSelB  = 1'b1 ;
                    end

                    `MADD, `MADDU, `MSUB, `MSUBU:
                    begin
                        ACCEn   = 1'b1;
                        MULSelB  = 1'b1 ;
                    end
                endcase
            end

            `ADDI:
            begin
                Func     = `ADD;
                ALUOp    = 1'b1;
                ALUSrc   = 1'b1;
                RegWrite = 1'b1;
            end

            `ADDIU:
            begin
                Func     = `ADDU;
                ALUOp    = 1'b1 ;
                ALUSrc   = 1'b1 ;
                RegWrite = 1'b1 ;
                Unsgnsel = 1'b1 ;
            end

            `LUI:
            begin
                Func     = `ADD;
                ALUOp    = 1'b1;
                ALUSrc   = 1'b1;
                RegWrite = 1'b1;
                ShiftSel = 1'b1;
            end

            `ANDI:
            begin
                Func     = `AND;
                ALUOp    = 1'b1;
                ALUSrc   = 1'b1;
                RegWrite = 1'b1;
                Unsgnsel = 1'b1;
            end

            `ORI:
            begin
                Func     = `OR ;
                ALUOp    = 1'b1;
                ALUSrc   = 1'b1;
                RegWrite = 1'b1;
                Unsgnsel = 1'b1;
            end

            `XORI:
            begin
                Func     = `XOR;
                ALUOp    = 1'b1;
                ALUSrc   = 1'b1;
                RegWrite = 1'b1;
                Unsgnsel = 1'b1;
            end

            `SLTI:
            begin
                Func     = `SLT;
                ALUOp    = 1'b1;
                ALUSrc   = 1'b1;
                RegWrite = 1'b1;
            end

            `SLTIU:
            begin
                Func     = `SLTU;
                ALUOp    = 1'b1 ;
                ALUSrc   = 1'b1 ;
                RegWrite = 1'b1 ;
                Unsgnsel = 1'b1 ;
            end

            `BLEZ, `BGTZ:
            begin
                Func    = `SUB ;
                Branch  = 1'b1 ;
                BRASrc  = 1'b1 ;
                ZeroImm = 1'b1 ;
                OutSel  = 2'b01;
            end

            `BEQ, `BNE:
            begin
                Func   = `SUB;
                Branch = 1'b1;
                BRASrc = 1'b1;
                OutSel  = 2'b01;
            end

            `J:
            begin
                Func    = `J   ;
                Jump    = 1'b1 ;
                BRASrc  = 1'b1 ;
                ImmSize = 1'b1 ;
                OutSel  = 2'b01;
            end

            `JAL:
            begin
                RegDst   = 2'b10;
                Func     = `JAL ;
                Jump     = 1'b1 ;
                BRASrc   = 1'b1 ;
                ImmSize  = 1'b1 ;
                RegWrite = 1'b1 ;
                OutSel   = 2'b01;
            end

            `LB, `LBU, `LH, `LHU, `LW, `LWL, `LWR:
            begin
                Func     = `ADD       ;
                MemFunc  = OpCode[2:0];
                ALUOp    = 1'b1       ;
                ALUSrc   = 1'b1       ;
                MemRead  = 1'b1       ;
                MemtoReg = 1'b1       ;
                RegWrite = 1'b1       ;
            end

            `SB , `SH, `SW, `SWL, `SWR:
            begin
                Func     = `ADD;
                ALUOp    = 1'b1       ;
                MemFunc  = OpCode[2:0];
                ALUSrc   = 1'b1;
                MemWrite = 1'b1;
            end

            `LL:
            begin
                Func     = `ADD       ;
                MemFunc  = `WD        ;
                ALUOp    = 1'b1       ;
                ALUSrc   = 1'b1       ;
                MemRead  = 1'b1       ;
                MemtoReg = 1'b1       ;
                RegWrite = 1'b1       ;
            end

            `SC:
            begin
                Func     = `ADD       ;
                MemFunc  = OpCode[5:3];
                ALUOp    = 1'b1       ;
                ALUSrc   = 1'b1       ;
                MemRead  = 1'b1       ;
                MemtoReg = 1'b1       ;
                RegWrite = 1'b1       ;
            end
        endcase
    end
endmodule
