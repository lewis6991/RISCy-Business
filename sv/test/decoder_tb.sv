//----------------------------------------
// File: decoder_tb.sv
// Description: Decoder testbench
// Primary Author: Jack Barnes
// Other Contributors:
// Notes: Full test coverage
//----------------------------------------

`include "op_definition.sv"
`include "alu_definition.sv"
`include "mul_definition.sv"

module decoder_tb;

timeunit 10ns; timeprecision 100ps;
const int clk = 100;

logic [5:0] OpCode, FuncCode;
wire  [5:0] Func;
wire  [1:0] RegDst;
wire Branch, Jump, MemRead, MemtoReg, ALUOp, MULOp, MemWrite, ALUSrc, RegWrite, ShiftSel, ImmSize, Unsgnsel;

parameter num = 60; //Minus 1 from total number of elements

//RegDst, _ , Branch, MemRead, MemtoReg, ALUOp, MULOp, MemWrite, ALUSrc, RegWrite, ShiftSel, _ , Jump, ImmSize, Unsgnsel, _ , Func
logic [19:0] testcases [num:0] = '{20'b01_000100010_000_100000, ////////// ADD
                                   20'b01_000100010_000_100001, //      // ADDU
                                   20'b01_000100010_000_100010, //      // SUB
                                   20'b01_000100010_000_100011, //      // SUBU
                                   20'b01_000100010_000_000000, //      // SLL
                                   20'b01_000100010_000_000100, //      // SLLV
                                   20'b01_000100010_000_000011, //      // SRA
                                   20'b01_000100010_000_000111, //      // SRAV
                                   20'b01_000100010_000_000010, //      // SRL
                                   20'b01_000100010_000_000110, //      // SRLV

                                   20'b01_000100010_000_100100, //      // AND
                                   20'b01_000100010_000_100111, //      // NOR
                                   20'b01_000100010_000_100101, // ALU  // OR
                                   20'b01_000100010_000_100110, //      // XOR
                                   20'b01_000100010_000_001011, //      // MOVN
                                   20'b01_000100010_000_001010, //      // MOVZ
                                   20'b01_000100010_000_101010, //      // SLT
                                   20'b01_000100010_000_101011, //      // SLTU
                                   20'b00_000100000_000_011000, //      // MULT
                                   20'b00_000100000_000_011001, //      // MULTU

                                   20'b01_000100010_000_010000, //      // MFHI
                                   20'b01_000100010_000_010010, //      // MFLO
                                   20'b00_000100000_000_010001, //      // MTHI
                                   20'b00_000100000_000_010011, //      // MTLO
                                   20'b01_000000010_100_000011, //      // JALR
                                   20'b00_000000000_100_000010, ////////// JR
                                   20'b01_000010010_000_110001, ////////// CLO
                                   20'b01_000010010_000_110000, //      // CLZ
                                   20'b00_000010000_000_000000, //      // MADD
                                   20'b00_000010000_000_000001, // MULL // MADDU

                                   20'b00_000010000_000_000100, //      // MSUB
                                   20'b00_000010000_000_000101, //      // MSUBU
                                   20'b01_000010010_000_000010, ////////// MUL
                                   20'b00_000100110_000_100000, // ADDI
                                   20'b00_000100110_001_100001, // ADDIU
                                   20'b00_000100111_000_100000, // LUI
                                   20'b00_000100110_001_100100, // ANDI
                                   20'b00_000100110_001_100101, // ORI
                                   20'b00_000100110_001_100110, // XORI
                                   20'b00_000100110_000_101010, // SLTI

                                   20'b00_000100110_001_101011, // SLTIU
                                   20'b00_100000100_000_000100, // BEQ
                                   20'b00_100000100_000_000111, // BGTZ
                                   20'b00_100000100_000_000110, // BLEZ
                                   20'b00_100000100_000_000101, // BNE
                                   20'b00_000000100_110_000010, // J
                                   20'b10_000000100_110_000011, // JAL
                                   20'b00_011000110_000_100000, // LB
                                   20'b00_011000110_000_100000, // LBU
                                   20'b00_011000110_000_100000, // LH

                                   20'b00_011000110_000_100000, // LHU
                                   20'b00_011000110_000_100000, // LW
                                   20'b00_011000110_000_100000, // LWL
                                   20'b00_011000110_000_100000, // LWR
                                   20'b00_000001100_000_100000, // SB
                                   20'b00_000001100_000_100000, // SH
                                   20'b00_000001100_000_100000, // SW
                                   20'b00_000001100_000_100000, // SWL
                                   20'b00_000001100_000_100000, // SWR
                                   20'b00_000000000_000_000000, // LL

                                   20'b00_000000000_000_000000};// SC

logic [5:0] testALU  [0:25] = '{
    `ADD,  `ADDU, `SUB,  `SUBU, `SLL,  `SLLV, `SRA, `SRAV, `SRL,  `SRLV,
    `AND,  `NOR,  `OR,   `XOR,  `MOVN, `MOVZ, `SLT, `SLTU, `MULT, `MULTU,
    `MFHI, `MFLO, `MTHI, `MTLO, `JALR, `JR
};

logic [5:0] testMULL [0:6] = '{
    `CLO, `CLZ, `MADD, `MADDU, `MSUB, `MSUBU, `MUL
};

logic [5:0] testOthr [0:27] = '{
    `ADDI, `ADDIU, `LUI, `ANDI, `ORI, `XORI, `SLTI, `SLTIU, `BEQ, `BGTZ,
    `BLEZ, `BNE,   `J,   `JAL,  `LB,  `LBU,  `LH,   `LHU,   `LW,  `LWL,
    `LWR,  `SB,    `SH,  `SW,   `SWL, `SWR,  `LL,   `SC
};

logic [10:0] OutBits;
int count;

decoder decoder0 (    
    .RegDst   (RegDst  ),
    .Branch   (Branch  ),
    .MemRead  (MemRead ),
    .Jump     (Jump    ),
    .MemtoReg (MemtoReg),
    .ALUOp    (ALUOp   ),
    .MULOp    (MULOp   ),
    .MemWrite (MemWrite),
    .ALUSrc   (ALUSrc  ),
    .RegWrite (RegWrite),
    .ShiftSel (ShiftSel),
    .ImmSize  (ImmSize ),
    .Unsgnsel (Unsgnsel),
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
    for (int i = 0 ; i < 26; i++) 
    begin
        FuncCode = testALU[i];
        #clk
        checkassert;
        count++;
    end
    //FuncCode = `ALU_CLZ;
    //FuncCode = `ALU_CLO;

    OpCode = `MULL;
    for (int i = 0 ; i < 7; i++) 
    begin
        FuncCode = testMULL[i];
        #clk
        checkassert;
        count++;
    end
    //FuncCode = `M_MFHI;
    //FuncCode = `M_MFLO;
    //FuncCode = `M_MTHI;
    //FuncCode = `M_MTLO;
    //FuncCode = `M_MULT;
    //FuncCode = `M_MULTU;

    for (int i = 0 ; i < 28; i++) 
    begin
        OpCode = testOthr[i];
        #clk
        checkassert;
        count++;
    end

$finish;

    //Still to be added and then tested
    //OpCode = `BEQ;
    //OpCode = `BGTZ;
    //OpCode = `BLEZ;
    //OpCode = `BNE;
    //OpCode = `J;
    //OpCode = `JAL;
    //OpCode = `LB;
    //OpCode = `LBU;
    //OpCode = `LH;
    //OpCode = `LHU;
    //OpCode = `LW;
    //OpCode = `LWL;
    //OpCode = `LWR;
    //OpCode = `SB;
    //OpCode = `SH;
    //OpCode = `SW;
    //OpCode = `SWL;
    //OpCode = `SWR;
    //OpCode = `LL;
    //OpCode = `SC;
end


task checkassert;
    #clk
    OutBits = {RegDst, Branch, MemRead, MemtoReg, ALUOp, MULOp, MemWrite, ALUSrc, RegWrite, ShiftSel};

    assert ({OutBits, Jump, ImmSize, Unsgnsel, Func} == testcases[num-count])
    else
    begin
        $display("ERROR: testcase no. %d", (count+1));
        $display("       Opcode   = %d", OpCode);
        $display("       Funccode = %d", FuncCode);
        $display("         Output  Expected\n");
        $display("RegDst   %b      %b" , RegDst,   testcases[num-count][19:18]);
        $display("Branch   %b       %b", Branch,   testcases[num-count][17]);
        $display("MemRead  %b       %b", MemRead,  testcases[num-count][16]);
        $display("MemtoReg %b       %b", MemtoReg, testcases[num-count][15]);
        $display("ALUOp    %b       %b", ALUOp,    testcases[num-count][14]);
        $display("MULOp    %b       %b", MULOp,    testcases[num-count][13]);
        $display("MemWrite %b       %b", MemWrite, testcases[num-count][12]);
        $display("ALUSrc   %b       %b", ALUSrc,   testcases[num-count][11]);
        $display("RegWrite %b       %b", RegWrite, testcases[num-count][10]);
        $display("ShiftSel %b       %b", ShiftSel, testcases[num-count][9]);
        $display("Jump     %b       %b", Jump,     testcases[num-count][8]);
        $display("ImmSize  %b       %b", ImmSize,  testcases[num-count][7]);
        $display("Unsgnsel %b       %b", Unsgnsel, testcases[num-count][6]);
        $display("Func     %b  %b"     , Func,     testcases[num-count][5:0]);
    end
endtask

endmodule
