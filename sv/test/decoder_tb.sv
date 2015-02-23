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
wire [5:0] Func;
wire RegDst, Branch, Jump, MemRead, MemtoReg, ALUOp, MULOp, MemWrite, ALUSrc, RegWrite, ShiftSel, Unsgnsel;

parameter num = 60; //Minus 1 from total number of elements

//RegDst, Branch, MemRead, MemtoReg, ALUOp, MULOp, MemWrite, ALUSrc, RegWrite, ShiftSel, _ Jump, Unsgnsel, _ Func
logic [17:0] testcases [num:0] = '{18'b1000100010_00_100000, ////////// ADD
                                   18'b1000100010_00_100001, //      // ADDU
                                   18'b1000100010_00_100010, //      // SUB
                                   18'b1000100010_00_100011, //      // SUBU
                                   18'b1000100010_00_000000, //      // SLL
                                   18'b1000100010_00_000100, //      // SLLV
                                   18'b1000100010_00_000011, //      // SRA
                                   18'b1000100010_00_000111, //      // SRAV
                                   18'b1000100010_00_000010, //      // SRL
                                   18'b1000100010_00_000110, //      // SRLV

                                   18'b1000100010_00_100100, //      // AND
                                   18'b1000100010_00_100111, //      // NOR
                                   18'b1000100010_00_100101, // ALU  // OR
                                   18'b1000100010_00_100110, //      // XOR
                                   18'b1000100010_00_001011, //      // MOVN
                                   18'b1000100010_00_001010, //      // MOVZ
                                   18'b1000100010_00_101010, //      // SLT
                                   18'b1000100010_00_101011, //      // SLTU
                                   18'b0000100000_00_011000, //      // MULT
                                   18'b0000100000_00_011001, //      // MULTU

                                   18'b1000100010_00_010000, //      // MFHI
                                   18'b1000100010_00_010010, //      // MFLO
                                   18'b0000100000_00_010001, //      // MTHI
                                   18'b0000100000_00_010011, //      // MTLO
                                   18'b0000000000_00_000000, //      // JALR
                                   18'b0000000000_00_000000, ////////// JR
                                   18'b1000010010_00_110001, ////////// CLO
                                   18'b1000010010_00_110000, //      // CLZ
                                   18'b0000010000_00_000000, //      // MADD
                                   18'b0000010000_00_000001, // MULL // MADDU

                                   18'b0000010000_00_000100, //      // MSUB
                                   18'b0000010000_00_000101, //      // MSUBU
                                   18'b1000010010_00_000010, ////////// MUL
                                   18'b0000100110_00_100000, // ADDI
                                   18'b0000100110_01_100001, // ADDIU
                                   18'b0000100111_00_100000, // LUI
                                   18'b0000100110_01_100100, // ANDI
                                   18'b0000100110_01_100101, // ORI
                                   18'b0000100110_01_100110, // XORI
                                   18'b0000100110_00_101010, // SLTI

                                   18'b0000100110_01_101011, // SLTIU
                                   18'b0000000000_00_000000, // BEQ
                                   18'b0000000000_00_000000, // BGTZ
                                   18'b0000000000_00_000000, // BLEZ
                                   18'b0000000000_00_000000, // BNE
                                   18'b0000000000_00_000000, // J
                                   18'b0000000000_00_000000, // JAL
                                   18'b0000000000_00_000000, // LB
                                   18'b0000000000_00_000000, // LBU
                                   18'b0000000000_00_000000, // LH

                                   18'b0000000000_00_000000, // LHU
                                   18'b0000000000_00_000000, // LW
                                   18'b0000000000_00_000000, // LWL
                                   18'b0000000000_00_000000, // LWR
                                   18'b0000000000_00_000000, // SB
                                   18'b0000000000_00_000000, // SH
                                   18'b0000000000_00_000000, // SW
                                   18'b0000000000_00_000000, // SWL
                                   18'b0000000000_00_000000, // SWR
                                   18'b0000000000_00_000000, // LL

                                   18'b0000000000_00_000000};// SC

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

logic [9:0] OutBits;
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

    assert ({OutBits, Jump, Unsgnsel, Func} == testcases[num-count])
    else
    begin
        $display("ERROR: testcase no. %d", (count+1));
        $display("       Opcode   = %d", OpCode);
        $display("       Funccode = %d", FuncCode);
        $display("         Output  Expected\n");
        $display("RegDst   %b       %b", RegDst,   testcases[num-count][17]);
        $display("Branch   %b       %b", Branch,   testcases[num-count][16]);
        $display("MemRead  %b       %b", MemRead,  testcases[num-count][15]);
        $display("MemtoReg %b       %b", MemtoReg, testcases[num-count][14]);
        $display("ALUOp    %b       %b", ALUOp,    testcases[num-count][13]);
        $display("MULOp    %b       %b", MULOp,    testcases[num-count][12]);
        $display("MemWrite %b       %b", MemWrite, testcases[num-count][11]);
        $display("ALUSrc   %b       %b", ALUSrc,   testcases[num-count][10]);
        $display("RegWrite %b       %b", RegWrite, testcases[num-count][9]);
        $display("ShiftSel %b       %b", ShiftSel, testcases[num-count][8]);
        $display("Jump     %b       %b", Jump,     testcases[num-count][7]);
        $display("Unsgnsel %b       %b", Unsgnsel, testcases[num-count][6]);
        $display("Func     %b  %b", Func, testcases[num-count][5:0]);
    end
endtask

endmodule
