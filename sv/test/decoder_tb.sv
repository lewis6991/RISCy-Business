//----------------------------------------
// File: decoder_tb.sv
// Description: Decoder testbench
// Primary Author: Jack Barnes
// Other Contributors:
// Notes: Full test coverage
//----------------------------------------

`include "../src/op_definition.sv"
`include "../src/alu_definition.sv"
`include "../src/mul_definition.sv"

module decoder_tb;

timeunit 10ns; timeprecision 100ps;
const int clk = 100;

logic [5:0] OpCode, FuncCode;
wire [5:0] Func;
wire RegDst, Branch, MemRead, MemtoReg, ALUOp, MULOp, Memwrite, ALUSrc, RegWrite, ShiftSel;

parameter num = 30;

logic [15:0] testcases [num:0] = '{16'b1000100010_100000, /////////////////
                                   16'b1000100010_100001, //
                                   16'b1000100010_100010, //
                                   16'b1000100010_100011, //
                                   16'b1000100010_000000, //
                                   16'b1000100010_000100, //
                                   16'b1000100010_000011, //
                                   16'b1000100010_000111, //
                                   16'b1000100010_000010, //
                                   16'b1000100010_000110, //

                                   16'b1000100010_100100, //
                                   16'b1000100010_100111, //
                                   16'b1000100010_100101, //    ALU
                                   16'b1000100010_100110, //
                                   16'b1000100010_001011, //
                                   16'b1000100010_001010, //
                                   16'b1000100010_101010, //
                                   16'b1000100010_101011, //
                                   16'b0000100000_011000, //
                                   16'b0000100000_011001, //

                                   16'b1000100000_010000, //
                                   16'b1000100000_010010, //
                                   16'b0000100000_010001, //
                                   16'b0000100000_010011, //
                                   16'b0000100110_001001, //
                                   16'b0000100110_001000, /////////////////


                                   16'b0000000000_000000,
                                   16'b0000000000_000000,
                                   16'b0000000000_000000,
                                   16'b0000000000_000000,
                                   16'b0000000000_000000};

logic [9:0] OutBits;
int count;

decoder decoder0 (    
    .RegDst   (RegDst  ),
    .Branch   (Branch  ),
    .MemRead  (MemRead ),
    .MemtoReg (MemtoReg),
    .ALUOp    (ALUOp   ),
    .MULOp    (MULOp   ),
    .Memwrite (Memwrite),
    .ALUSrc   (ALUSrc  ),
    .RegWrite (RegWrite),
    .ShiftSel (ShiftSel),
    .Func     (Func    ),
    .OpCode   (OpCode  ),
    .FuncCode (FuncCode)
);

//Initial conditions
initial
begin
    OpCode   = 1'b0;
    FuncCode = 0;
    OutBits  = 0;
    count    = 0;
end

//Testing procedure
initial
begin
    #clk

    OpCode = `ALU;
    FuncCode = `ADD;
    checkassert;
    count++;

    FuncCode = `ADDU;
    checkassert;
    count++;

    FuncCode = `SUB;
    checkassert;
    count++;

    FuncCode = `SUBU;
    checkassert;
    count++;

    FuncCode = `SLL;
    checkassert;
    count++;

    FuncCode = `SLLV;
    checkassert;
    count++;

    FuncCode = `SRA;
    checkassert;
    count++;

    FuncCode = `SRAV;
    checkassert;
    count++;

    FuncCode = `SRL;
    checkassert;
    count++;

    FuncCode = `SRLV;
    checkassert;
    count++;

    FuncCode = `AND;
    checkassert;
    count++;

    FuncCode = `NOR;
    checkassert;
    count++;

    FuncCode = `OR;
    checkassert;
    count++;

    FuncCode = `XOR;
    checkassert;
    count++;

    FuncCode = `MOVN;
    checkassert;
    count++;

    FuncCode = `MOVZ;
    checkassert;
    count++;

    FuncCode = `SLT;
    checkassert;
    count++;

    FuncCode = `SLTU;
    checkassert;
    count++;

    FuncCode = `MULT;
    checkassert;
    count++;

    FuncCode = `MULTU;
    checkassert;
    count++;

    FuncCode = `MFHI;
    checkassert;
    count++;

    FuncCode = `MFLO;
    checkassert;
    count++;

    FuncCode = `MTHI;
    checkassert;
    count++;

    FuncCode = `MTLO;
    checkassert;
    count++;

    FuncCode = `JALR;
    checkassert;
    count++;

    FuncCode = `JR;
    checkassert;
    count++;

$finish;

    //FuncCode = `ALU_CLZ;
    //FuncCode = `ALU_CLO;



    OpCode = `MULL;
    FuncCode = `CLO;
    FuncCode = `CLZ;
    FuncCode = `MADD;
    FuncCode = `MADDU;
    FuncCode = `MSUB;
    FuncCode = `MSUBU;
    FuncCode = `MUL;

    //FuncCode = `M_MFHI;
    //FuncCode = `M_MFLO;
    //FuncCode = `M_MTHI;
    //FuncCode = `M_MTLO;
    //FuncCode = `M_MULT;
    //FuncCode = `M_MULTU;


    OpCode = `ADDI;
    OpCode = `ADDIU;
    OpCode = `LUI;
    OpCode = `ANDI;
    OpCode = `ORI;
    OpCode = `XORI;
    OpCode = `SLTI;
    OpCode = `SLTIU;

    OpCode = `BEQ;
    OpCode = `BGTZ;
    OpCode = `BLEZ;
    OpCode = `BNE;
    OpCode = `J;
    OpCode = `JAL;
    OpCode = `LB;
    OpCode = `LBU;
    OpCode = `LH;
    OpCode = `LHU;
    OpCode = `LW;
    OpCode = `LWL;
    OpCode = `LWR;
    OpCode = `SB;
    OpCode = `SH;
    OpCode = `SW;
    OpCode = `SWL;
    OpCode = `SWR;
    OpCode = `LL;
    OpCode = `SC;



    $finish;

end


task checkassert;
    #clk
    OutBits = {RegDst, Branch, MemRead, MemtoReg, ALUOp, MULOp, Memwrite, ALUSrc, RegWrite, ShiftSel};

    assert ({OutBits, Func} == testcases[num-count])
    else
        $display("ERROR: testcase no. %d\n         Output  Expected\nRegDst   %b       %b\nBranch   %b       %b\nMemRead  %b       %b\nMemtoReg %b       %b\nALUOp    %b       %b\nMemwrite %b       %b\nALUSrc   %b       %b\nRegWrite %b       %b\nShiftSel %b       %b\nMULOp    %b       %b\nFunc     %b  %b%b%b%b%b%b\n", count, RegDst, testcases[num-count][15], Branch, testcases[num-count][14], MemRead, testcases[num-count][13], MemtoReg, testcases[num-count][12], ALUOp, testcases[num-count][11], MULOp, testcases[num-count][10], Memwrite, testcases[num-count][9], ALUSrc, testcases[num-count][8], RegWrite, testcases[num-count][7], ShiftSel, testcases[num-count][6], Func, testcases[num-count][5], testcases[num-count][4], testcases[num-count][3], testcases[num-count][2], testcases[num-count][1], testcases[num-count][0]);
endtask

endmodule






