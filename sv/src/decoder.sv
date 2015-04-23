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
    input        [5:0] OpCode  ,
                       FuncIn  ,
    input              BrLink  ,
    output logic [5:0] FuncOut ,
    output logic [2:0] MemFunc ,
    output logic [1:0] OutSel  ,
                       RegDst  ,
    output logic       Branch  ,
                       ZeroImm ,
                       Jump    ,
                       MemRead ,
                       MemtoReg,
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
                       ALUEn
);

assign ALUEn = (OpCode == 0);

    always_comb
    begin
        RegDst   = 2'd0;
        Branch   = 1'b0;
        Jump     = 1'b0;
        MemRead  = 1'b0;
        MemtoReg = 1'b0;
        MULOp    = 1'b0;
        MemWrite = 1'b0;
        ALUSrc   = 1'b0;
        RegWrite = 1'b0;
        ShiftSel = 1'b0;
        ImmSize  = 1'b0;
        Unsgnsel = 1'b0;
        MemFunc  = 3'd0;
        BRASrc   = 1'b0;
        ZeroImm  = 1'b0;
        ACCEn    = 1'b0;
        MULSelB  = 1'b0;
        OutSel   = 2'd0;
        FuncOut = FuncIn;

        case(OpCode)
            `ALU:
                case(FuncIn)
                    `ADD , `ADDU, `SUB , `SUBU, `SLL ,
                    `SLLV, `SRA , `SRAV, `SRL , `SRLV,
                    `AND , `NOR , `OR  , `XOR , `SLT ,
                    `SLTU:
                    begin
                        RegDst   = 2'b01;
                        RegWrite = 1'b1 ;
                    end

                    `MOVN, `MOVZ:
                        RegDst  = 2'b01;

                    `MFHI, `MFLO:
                    begin
                        RegDst   = 2'b01;
                        RegWrite = 1'b1 ;
                        ACCEn    = 1'b1 ;
                        OutSel   = 2'b10;
                    end

                    `MULT, `MULTU:
                    begin
                        ACCEn   = 1'b1 ;
                        MULSelB = 1'b1 ;
                        OutSel  = 2'b10;
                        MULOp   = 1'b1 ;
                    end

                    `MTHI, `MTLO:
                    begin
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

            `BRANCH:
            begin
                FuncOut = `SUB;
                Branch  = 1'b1;
                ZeroImm = 1'b1;
                BRASrc  = 1'b1;
                OutSel  = 2'b01;
                if (BrLink)
                begin
                    RegWrite = 1'b1 ;
                    RegDst   = 2'b10;
                end
            end

            `MULL:
            begin
                MULOp  = 1'b1 ;
                OutSel = 2'b10;
                case (FuncIn)
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
                        MULSelB = 1'b1;
                    end
                endcase
            end

            `ADDI:
            begin
                FuncOut  = `ADD;
                ALUSrc   = 1'b1;
                RegWrite = 1'b1;
            end

            `ADDIU:
            begin
                FuncOut  = `ADDU;
                ALUSrc   = 1'b1 ;
                RegWrite = 1'b1 ;
                Unsgnsel = 1'b1 ;
            end

            `LUI:
            begin
                FuncOut  = `ADD;
                ALUSrc   = 1'b1;
                RegWrite = 1'b1;
                ShiftSel = 1'b1;
            end

            `ANDI:
            begin
                FuncOut  = `AND;
                ALUSrc   = 1'b1;
                RegWrite = 1'b1;
                Unsgnsel = 1'b1;
            end

            `ORI:
            begin
                FuncOut  = `OR ;
                ALUSrc   = 1'b1;
                RegWrite = 1'b1;
                Unsgnsel = 1'b1;
            end

            `XORI:
            begin
                FuncOut  = `XOR;
                ALUSrc   = 1'b1;
                RegWrite = 1'b1;
                Unsgnsel = 1'b1;
            end

            `SLTI:
            begin
                FuncOut  = `SLT;
                ALUSrc   = 1'b1;
                RegWrite = 1'b1;
            end

            `SLTIU:
            begin
                FuncOut  = `SLTU;
                ALUSrc   = 1'b1 ;
                RegWrite = 1'b1 ;
                Unsgnsel = 1'b1 ;
            end

            `BLEZ, `BGTZ:
            begin
                FuncOut = `SUB ;
                Branch  = 1'b1 ;
                BRASrc  = 1'b1 ;
                ZeroImm = 1'b1 ;
                OutSel  = 2'b01;
            end

            `BEQ, `BNE:
            begin
                FuncOut = `SUB ;
                Branch  = 1'b1 ;
                BRASrc  = 1'b1 ;
                OutSel  = 2'b01;
            end

            `J:
            begin
                Jump    = 1'b1 ;
                BRASrc  = 1'b1 ;
                ImmSize = 1'b1 ;
                OutSel  = 2'b01;
            end

            `JAL:
            begin
                RegDst   = 2'b10;
                Jump     = 1'b1 ;
                BRASrc   = 1'b1 ;
                ImmSize  = 1'b1 ;
                RegWrite = 1'b1 ;
                OutSel   = 2'b01;
            end

            `LB, `LBU, `LH, `LHU, `LW, `LWL, `LWR:
            begin
                FuncOut  = `ADD       ;
                MemFunc  = OpCode[2:0];
                ALUSrc   = 1'b1       ;
                MemRead  = 1'b1       ;
                MemtoReg = 1'b1       ;
                RegWrite = 1'b1       ;
            end

            `SB , `SH, `SW, `SWL, `SWR:
            begin
                FuncOut  = `ADD       ;
                MemFunc  = OpCode[2:0];
                ALUSrc   = 1'b1       ;
                MemWrite = 1'b1       ;
            end

            `LL:
            begin
                FuncOut  = `ADD       ;
                MemFunc  = `WD        ;
                ALUSrc   = 1'b1       ;
                MemRead  = 1'b1       ;
                MemtoReg = 1'b1       ;
                RegWrite = 1'b1       ;
            end

            `SC:
            begin
                FuncOut  = `ADD       ;
                MemFunc  = OpCode[5:3];
                ALUSrc   = 1'b1       ;
                MemRead  = 1'b1       ;
                MemtoReg = 1'b1       ;
                RegWrite = 1'b1       ;
            end
        endcase
    end
endmodule
