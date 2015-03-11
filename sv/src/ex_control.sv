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
        MULSelB     = 1;
        RegWriteOut = RegWriteIn;
        BRAEn       = 0;
        BranchTaken = 0;
        OutSel      = 2'b00;

        if (ALUOp)
            case (Func)
                `MULT,
                `MULTU,
                `MFHI,
                `MFLO:
                begin
                    ACCEn       = 1;
                    OutSel      = 2'b10;
                end
                `MTHI,
                `MTLO:
                begin
                    MULSelB     = 0;
                    ACCEn       = 1;
                    OutSel      = 2'b10;
                end
                
                default:
                begin
                    OutSel      = 2'b00;
                    RegWriteOut = ALUEn;
                end
            endcase

        if (MULOp)
            case (Func)
                `ALU_CLZ,
                `ALU_CLO:
                begin
                    OutSel      = 2'b00;
                end
                
                `MUL:
                begin
                    OutSel      = 2'b10;
                end
               

                default:
                begin
                    ACCEn       = 1;
                    OutSel      = 2'b10;
                end
            endcase
        
        if (Jump)
            begin
                RegWriteOut = RegWriteIn & BRAtaken;
                BranchTaken = BRAtaken;
                BRAEn       = 1;
                OutSel      = 2'b01;
            end
        
        if (Branch)
            begin
                RegWriteOut = RegWriteIn & BRAtaken;
                BranchTaken = BRAtaken;
                BRAEn       = 1;
                OutSel      = 2'b01;
            end
        
    end
endmodule
