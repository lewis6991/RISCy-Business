//------------------------------------------------------------------------------
// File              : ex_control.sv
// Description       : Execute stage control logic
// Primary Author    : Ethan Bishop
// Other Contributors:
// Notes             : Controls the ALU, MUL, ACC and (eventually) BRANCH
//                     modules
//------------------------------------------------------------------------------

`include "alu_definition.sv"
`include "mul_definition.sv"

module ex_control(
    input               ALUOp      ,
                        MULOp      ,
                        Jump       ,
                        Branch     ,
                        RegWriteIn ,
                        BRAtaken   ,
                        ALUEn      ,
                        MemWrite   ,
    input        [ 5:0] Func       ,
    output logic        ACCEn      , // Enable ACC write
                        MULSelB    , // MUL module select
                        RegWriteOut,
                        BRAEn      ,
                        BranchTaken,
    output logic [ 1:0] OutSel       // OutSel = 00: ALU
                                     //          01: BRA
                                     //          10: MUL

);
    always_comb
    begin

        ACCEn       = 0;
        MULSelB     = 0;
        RegWriteOut = RegWriteIn;
        BRAEn       = Jump | Branch;
        BranchTaken = 0;
        OutSel      = 2'b00;

        if (ALUOp)
            case (Func)
                `MULT, `MULTU:
                begin
                    MULSelB     = 1;
                    ACCEn       = 1;
                    OutSel      = 2'b10;
                end
                `MTHI, `MTLO, `MFHI, `MFLO:
                begin
                    ACCEn       = 1;
                    OutSel      = 2'b10;
                end

                default:
                begin
                    OutSel      = 2'b00;
                    RegWriteOut = ALUEn & !MemWrite;
                end
            endcase

        if (MULOp)
        begin
            OutSel = 2'b10;
            case (Func)
                `ALU_CLZ, `ALU_CLO:;
                `MADD, `MADDU, `MSUB, `MSUBU: begin
                    MULSelB = 1;
                    ACCEn = 1;
                end
                `MUL:
                    MULSelB = 1;
                default: ACCEn  = 1;
            endcase
        end

        if (Jump)
        begin
            RegWriteOut = RegWriteIn;
            BranchTaken = 1    ;
            OutSel      = 2'b01;
        end
        else if (Branch)
        begin
            RegWriteOut = RegWriteIn & BRAtaken;
            BranchTaken = BRAtaken;
            OutSel      = 2'b01;
        end
    end
endmodule
