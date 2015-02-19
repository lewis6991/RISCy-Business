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
wire RegDst, Branch, Jump, MemRead, MemtoReg, ALUOp, MULOp, Memwrite, ALUSrc, RegWrite, ShiftSel;

parameter num = 60; //Minus 1 from total number of elements

//RegDst, Branch, MemRead, MemtoReg, ALUOp, MULOp, Memwrite, ALUSrc, RegWrite, ShiftSel, Jump, Func
logic [16:0] testcases [num:0] = '{17'b1000100010_0_100000, ////////// ADD
                                   17'b1000100010_0_100001, //      // ADDU
                                   17'b1000100010_0_100010, //      // SUB
                                   17'b1000100010_0_100011, //      // SUBU
                                   17'b1000100010_0_000000, //      // SLL
                                   17'b1000100010_0_000100, //      // SLLV
                                   17'b1000100010_0_000011, //      // SRA
                                   17'b1000100010_0_000111, //      // SRAV
                                   17'b1000100010_0_000010, //      // SRL
                                   17'b1000100010_0_000110, //      // SRLV

                                   17'b1000100010_0_100100, //      // AND
                                   17'b1000100010_0_100111, //      // NOR
                                   17'b1000100010_0_100101, // ALU  // OR
                                   17'b1000100010_0_100110, //      // XOR
                                   17'b1000100010_0_001011, //      // MOVN
                                   17'b1000100010_0_001010, //      // MOVZ
                                   17'b1000100010_0_101010, //      // SLT
                                   17'b1000100010_0_101011, //      // SLTU
                                   17'b0000100000_0_011000, //      // MULT
                                   17'b0000100000_0_011001, //      // MULTU

                                   17'b1000100000_0_010000, //      // MFHI
                                   17'b1000100000_0_010010, //      // MFLO
                                   17'b0000100000_0_010001, //      // MTHI
                                   17'b0000100000_0_010011, //      // MTLO
                                   17'b0000100110_0_001001, //      // JALR
                                   17'b0000100110_0_001000, ////////// JR
                                   17'b0000000000_0_000000, ////////// CLO
                                   17'b0000000000_0_000000, //      // CLZ
                                   17'b0000010000_0_000000, //      // MADD
                                   17'b0000010000_0_000000, // MULL // MADDU

                                   17'b0000010000_0_000000, //      // MSUB
                                   17'b0000010000_0_000000, //      // MSUBU
                                   17'b1000010010_0_000000, ////////// MUL
                                   17'b0000100110_0_001000, // ADDI
                                   17'b0000100110_0_001001, // ADDIU
                                   17'b0000100111_0_100000, // LUI
                                   17'b0000100110_0_001100, // ANDI
                                   17'b0000100110_0_100101, // ORI
                                   17'b0000100110_0_100101, // XORI
                                   17'b0000100110_0_100101, // SLTI

                                   17'b0000100110_0_100101, // SLTIU
                                   17'b0000000000_0_000000, // BEQ
                                   17'b0000000000_0_000000, // BGTZ
                                   17'b0000000000_0_000000, // BLEZ
                                   17'b0000000000_0_000000, // BNE
                                   17'b0000000000_0_000000, // J
                                   17'b0000000000_0_000000, // JAL
                                   17'b0000000000_0_000000, // LB
                                   17'b0000000000_0_000000, // LBU
                                   17'b0000000000_0_000000, // LH

                                   17'b0000000000_0_000000, // LHU
                                   17'b0000000000_0_000000, // LW
                                   17'b0000000000_0_000000, // LWL
                                   17'b0000000000_0_000000, // LWR
                                   17'b0000000000_0_000000, // SB
                                   17'b0000000000_0_000000, // SH
                                   17'b0000000000_0_000000, // SW
                                   17'b0000000000_0_000000, // SWL
                                   17'b0000000000_0_000000, // SWR
                                   17'b0000000000_0_000000, // LL

                                   17'b0000000000_0_000000};// SC

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

    assert ({OutBits, Jump, Func} == testcases[num-count])
    else
        $display("ERROR: testcase no. %d\n         Output  Expected\nRegDst   %b       %b\nBranch   %b       %b\nMemRead  %b       %b\nMemtoReg %b       %b\nALUOp    %b       %b\nMemwrite %b       %b\nALUSrc   %b       %b\nRegWrite %b       %b\nShiftSel %b       %b\nMULOp    %b       %b\nJump     %b       %b\nFunc     %b  %b%b%b%b%b%b\n", (count+1), RegDst, testcases[num-count][16], Branch, testcases[num-count][15], MemRead, testcases[num-count][14], MemtoReg, testcases[num-count][13], ALUOp, testcases[num-count][12], MULOp, testcases[num-count][11], Memwrite, testcases[num-count][10], ALUSrc, testcases[num-count][9], RegWrite, testcases[num-count][8], ShiftSel, testcases[num-count][7], Jump, testcases[num-count][6], Func, testcases[num-count][5], testcases[num-count][4], testcases[num-count][3], testcases[num-count][2], testcases[num-count][1], testcases[num-count][0]);
endtask

endmodule






