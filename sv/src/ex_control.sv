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
                        ALUO       , // ALU Flag outputs
                        ALUZ       ,
                        ALUN       ,
                        ALUC       ,
                        ALUEn      , // ALU output enable
                        ACCO       , // ACC Flag outputs
                        ACCZ       ,
                        ACCN       ,
                        ACCC       ,
    input        [31:0] PCin       , // Program counter input.
                        ALUout     , // ALU Module output
                        ACCout     , // ACC Module output
    input        [63:0] MULout     , // MUL Module output
    input        [ 5:0] Func       ,
    output logic [31:0] Out        ,
                        PCout      , // Program counter 
    output logic        C          , // Carry out flag.
                        Z          , // Output zero flag.
                        O          , // Overflow flag.
                        N          , // Output negative flag.
                        ACCEn      , // Enable ACC write
                        MULSelB    , // MUL module select
                        RegWriteOut
);

    // TODO: These will eventually do something
    assign PCout       = PCin;

    always_comb
    begin

        Out         = 0;
        C           = 0;
        Z           = 0;
        O           = 0;
        N           = 0;
        ACCEn       = 0;
        MULSelB     = 1;
        RegWriteOut = RegWriteIn;

        // TODO: Branch operations
        if (ALUOp)
            case (Func)
                `MULT,
                `MULTU,
                `MFHI,
                `MFLO:
                begin
                    ACCEn       = 1;
                    Out         = ACCout;
                    Z           = ACCZ;
                    O           = ACCO;
                    N           = ACCN;
                    C           = ACCC;
                end
                `MTHI,
                `MTLO:
                begin
                    MULSelB     = 0;
                    ACCEn       = 1;
                    Out         = ACCout;
                    Z           = ACCZ;
                    O           = ACCO;
                    N           = ACCN;
                    C           = ACCC;
                end
                
                default:
                begin
                    Out         = ALUout;
                    RegWriteOut = ALUEn;
                    C           = ALUC;
                    Z           = ALUZ;
                    O           = ALUO;
                    N           = ALUN;
                end
            endcase

        if (MULOp)
            case (Func)
                `ALU_CLZ,
                `ALU_CLO:
                begin
                    Out         = ALUout;
                    C           = ALUC;
                    Z           = ALUZ;
                    O           = ALUO;
                    N           = ALUN;
                end
                
                `MUL:
                begin
                    Out         = MULout[31:0];
                    C           = (MULout[63:32] != 0);
                    N           = MULout[31];
                    Z           = (MULout[31:0]  == 0);
                    O           = (MULout[63:32] != 0);
                end
               

                default:
                begin
                    ACCEn       = 1;
                    Out         = ACCout;
                    Z           = ACCZ;
                    O           = ACCO;
                    N           = ACCN;
                    C           = ACCC;
                end
            endcase
    end
endmodule
