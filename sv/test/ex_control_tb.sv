//----------------------------------------
// File: ex_control_tb.sv
// Description: Execute controller testbench
// Primary Author: Jack Barnes
// Other Contributors:
// Notes: Full test coverage
//----------------------------------------

`include "alu_definition.sv"
`include "mul_definition.sv"

module ex_control_tb;

timeunit 10ns; timeprecision 100ps;
const int clk = 100;

logic        ALUOp      ,
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
             BRAtaken   ;
logic [31:0] ALUout     , // ALU Module output
             ACCout     , // ACC Module output
             BRAret     ;
logic [63:0] MULout     ; // MUL Module output
logic [ 5:0] Func       ;

wire [31:0] Out        ;
wire        C          , // Carry out flag.
            Z          , // Output zero flag.
            O          , // Overflow flag.
            N          , // Output negative flag.
            ACCEn      , // Enable ACC write
            MULSelB    , // MUL module select
            RegWriteOut,
            BRAEn      ,
            BranchTaken;

parameter num = 10; //Minus 1 from total number of elements

//C, Z, O, N, ACCEn, MULSelB, RegWriteOut, BRAEn, BranchTaken
logic [8:0] testcase = 0;// [num:0] = '{8'b0000_0000, /////////// MULT
                         //        8'b0000_0000, //       // MULTU
                         //        8'b0000_0000, //       // MFHI
                         //        8'b0000_0000, // ALUOp // MFLO
                         //        8'b0000_0000, //       // MTHI
                         //        8'b0000_0000, /////////// MTLO
                         //        8'b0000_0000,
                         //        8'b0000_0000,
                         //        8'b0000_0000,
                         //        8'b0000_0000,
                         //        8'b0000_0000
//};

logic [31:0] testout = 0;
int count = 0;

ex_control ex_control0 (
    .ALUOp       (ALUOp      ),
    .MULOp       (MULOp      ),
    .Jump        (Jump       ),
    .Branch      (Branch     ),
    .RegWriteIn  (RegWriteIn ),
    .ALUO        (ALUO       ),
    .ALUZ        (ALUZ       ),
    .ALUN        (ALUN       ),
    .ALUC        (ALUC       ),
    .ALUEn       (ALUEn      ),
    .ACCO        (ACCO       ),
    .ACCZ        (ACCZ       ),
    .ACCN        (ACCN       ),
    .ACCC        (ACCC       ),
    .BRAtaken    (BRAtaken   ),
    .ALUout      (ALUout     ),
    .ACCout      (ACCout     ),
    .BRAret      (BRAret     ),
    .MULout      (MULout     ),
    .Func        (Func       ),

    .Out         (Out        ),
    .C           (C          ),
    .Z           (Z          ),
    .O           (O          ),
    .N           (N          ),
    .ACCEn       (ACCEn      ),
    .MULSelB     (MULSelB    ),
    .RegWriteOut (RegWriteOut),
    .BRAEn       (BRAEn      ),
    .BranchTaken (BranchTaken)
);

//Initial conditions
initial
begin
    ALUOp      = 1'b0;
    MULOp      = 1'b0;
    Jump       = 1'b0;
    Branch     = 1'b0;

    RegWriteIn = 1'b0;
    ALUO       = 1'b0;
    ALUZ       = 1'b0;
    ALUN       = 1'b0;
    ALUC       = 1'b0;
    ALUEn      = 1'b0;
    ACCO       = 1'b0;
    ACCZ       = 1'b0;
    ACCN       = 1'b0;
    ACCC       = 1'b0;
    BRAtaken   = 1'b0;
    ALUout     = 0;
    ACCout     = 0;
    BRAret     = 0;
    MULout     = 0;
    Func       = 0;
end

//Testing procedure
initial
begin
////////////////////////////////// count 0 - 1
    for (int i = 0 ; i < 2; i++) 
    begin
        RegWriteIn = i;
        testout = 1'b0;
        testcase = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, RegWriteIn, 1'b0, 1'b0};
        checkassert;
    end

////////////////////////////////// count 2 - 25
    
    ALUOp = 1'b1;
    testout = ACCout;
    testcase = {ACCC, ACCZ, ACCO, ACCN, 1'b1, 1'b1, RegWriteIn, 1'b0, 1'b0};
    Func = `MULT;
    checkassert;
    Func = `MULTU;
    checkassert;
    Func = `MFHI;
    checkassert;
    Func = `MFLO;
    checkassert;

    testout = ACCout;
    testcase = {ACCC, ACCZ, ACCO, ACCN, 1'b1, 1'b0, RegWriteIn, 1'b0, 1'b0};
    Func = `MTHI;
    checkassert;
    Func = `MTLO;
    checkassert;

    testout = ALUout;
    testcase = {ALUC, ALUZ, ALUO, ALUN, 1'b0, 1'b1, ALUEn, 1'b0, 1'b0};
    Func = `SLL;
    checkassert;
    Func = `SLLV;
    checkassert;
    Func = `SRA;
    checkassert;
    Func = `SRAV;
    checkassert;
    Func = `SRL;
    checkassert;
    Func = `SRLV;
    checkassert;
    Func = `MOVZ;
    checkassert;
    Func = `MOVN;
    checkassert;
    Func = `ADD;
    checkassert;
    Func = `ADDU;
    checkassert;
    Func = `SUB;
    checkassert;
    Func = `SUBU;
    checkassert;
    Func = `AND;
    checkassert;
    Func = `NOR;
    checkassert;
    Func = `OR;
    checkassert;
    Func = `XOR;
    checkassert;
    Func = `SLT;
    checkassert;
    Func = `SLTU;
    checkassert;
    ALUOp = 1'b0;

////////////////////////////////// count 26 - 32

    MULOp = 1'b1;
    testout = ALUout;
    testcase = {ALUC, ALUZ, ALUO, ALUN, 1'b0, 1'b1, RegWriteIn, 1'b0, 1'b0};
    Func = `ALU_CLZ;
    checkassert;
    Func = `ALU_CLO;
    checkassert;

    testout = MULout;
    testcase = {(MULout[63:32] != 0), (MULout[31:0] == 0), (MULout[63:32] != 0), MULout[31], 1'b0, 1'b1, RegWriteIn, 1'b0, 1'b0};
    Func = `MUL;
    checkassert;

    testout = ACCout;
    testcase = {ACCC, ACCZ, ACCO, ACCN, 1'b1, 1'b1, RegWriteIn, 1'b0, 1'b0};
    Func = `MADD;
    checkassert;
    Func = `MADDU;
    checkassert;
    Func = `MSUB;
    checkassert;
    Func = `MSUBU;
    checkassert;
    MULOp = 1'b0;

////////////////////////////////// count 33

    Jump = 1'b1;
    testout = BRAret;
    testcase = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, (RegWriteIn & BRAtaken), 1'b1, BRAtaken};
    checkassert;
    Jump = 1'b0;

////////////////////////////////// count 34

    Branch = 1'b1;
    testout = BRAret;
    testcase = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, (RegWriteIn & BRAtaken), 1'b1, BRAtaken};
    checkassert;
    Branch = 1'b0;

end

task checkassert;
    #clk
    assert ({Out, C, Z, O, N, ACCEn, MULSelB, RegWriteOut, BRAEn, BranchTaken} == {testout, testcase})
    else
    begin
        $display("\nERROR:   C Z O N ACCEn MULSelB RegWriteOut BRAEn BranchTaken | Out");
        $display("Output   %b %b %b %b   %b      %b         %b        %b        %b      | %h", C, Z, O, N, ACCEn, MULSelB, RegWriteOut, BRAEn, BranchTaken, Out);
        $display("Expected %b %b %b %b   %b      %b         %b        %b        %b      | %h", testcase[8], testcase[7], testcase[6], testcase[5], testcase[4], testcase[3], testcase[2], testcase[1], testcase[0], testout);
        $display("Count = %d\n", count);
    end
    count++;
endtask

endmodule





















