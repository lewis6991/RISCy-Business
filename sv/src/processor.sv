//----------------------------------------
// File: PROCESSOR.sv
// Description: Top-Level Processor
// Primary Author: Dominic Murphy
// Other Contributors: Dhanushan Raveendran
// Notes: 
//----------------------------------------

module PROCESSOR(
    input Clock,
    input nReset
);

wire RegDstD;
wire RegDstE;

wire JumpD;
wire JumpE;

wire BranchD;
wire BranchEin;
wire BranchEout;
wire BranchM;

wire MemReadD;
wire MemReadEin;
wire MemReadEout;
wire MemReadM;

wire MemtoRegD;
wire MemtoRegEin;
wire MemtoRegEout;
wire MemtoRegMin;
wire MemtoRegMin;
wire MemtoRegW;

wire ALUOpD;

wire MULOpD;

wire MemWriteD;
wire MemWriteEin;
wire MemWriteEout;
wire MemWriteM;

wire ALUSrcD;
wire ALUSrcE;

wire RegWriteD;
wire RegWriteE;
wire RegWriteMin;
wire RegWriteMout;
wire RegWriteW;

wire [4:0] ALUOpD;
wire [4:0] ALUOpE;
wire [4:0] ALUOpD;

wire [31:0] InstructionF;
wire [31:0] InstructionD;

wire InstrMem;
wire InstrAddr;

wire [31:0] RDataW;	// from WB

wire [4:0] RAddrD;	// goes through PLs
wire [4:0] RAddrEin;
wire [4:0] RAddrEout;
wire [4:0] RAddrMin;
wire [4:0] RAddrMout;
wire [4:0] RAddrW;

wire [31:0] ImmDataD;

wire [31:0] RsDataD;
wire [31:0] RsDataE;

wire [31:0] RtDataD;
wire [31:0] RtDataEin;
wire [31:0] RtDataEout;

wire [5:0] ALUfuncD;
wire [5:0] ALUfuncE;

wire [4:0] ShamtD;
wire [4:0] ShamtE;

wire [31:0] PCAddrIncF;
wire [31:0] PCAddrIncDin;
wire [31:0] PCAddrIncDout;
wire [31:0] PCAddrIncE;

wire [31:0] ALUDataE;
wire [31:0] ALUDataMin;
wire [31:0] ALUDataMout;
wire [31:0] ALUDataW;

wire [31:0] MemDataM;
wire [31:0] MemDataW;

/*
DUMMY instruction_memory(
    .addrin(InstrAddr),
    .instrout(InstrMem)
    );
*/

IF if0( 
    .BranchTaken(),
    .BranchAddr(),
    .InstrMem(InstrMem),
    .InstrAddr(InstrAddr),
    .InstrOut(InstructionF),
    .PCAddrInc(PCAddrIncF)
    );
    
PIPE #(n=0) pipe0(
    .Clock(Clock),
    .nReset(nReset),
    .In({InstructionF, PCAddrIncF}),
    .Out({InstructionD, PCAddrIncDin})
    );
     
DEC de0(
    .Clock(Clock),
    .nReset(nReset),
    .RegWriteIn(RegWriteWout),
    .Instruction(InstructionD),
    .RData(RDataW),
    .PCAddrIncIn(PCAddrIncDin),
    .RAddrIn(RAddrW),
    .ImmData(ImmDataD),
    .RsData(RsDataD),
    .RtData(RtDataD),
    .PCAddrIncOut(PCAddrIncDout),
    .RAddrOut(RAddrD),
    .RegDst(RegDstD),
    .Branch(BranchD),
    .Jump(JumpD),
    .MemRead(MemReadD),
    .MemtoReg(MemtoRegD),
    .ALUOp(ALUOpD),
    .MULOp(MULOpD),
    .MemWrite(MemWriteD),
    .ALUSrc(ALUSrcD),
    .RegWriteOut(RegWriteD),
    .ALUfunc(ALUfuncD),
    .Shamt(ShamtD)
);

PIPE #(n=116) pipe1( // n need to be recalculated
    .Clock(Clock),
    .nReset(nReset),
    .In ({ImmDataD, RsDataD, RtDataD, PCAddrIncDout, RAddrD, RegDstD, BranchD, JumpD, MemReadD, MemtoRegD, ALUOpD, MULOpD, MemWriteD, ALUSrcD, RegWriteD, ALUfuncD, ShamtD}),
    .Out({ImmDataE, RsDataE, RtDataEin, PCAddrIncE, RAddrEin, RegDstE, BranchE, JumpE, MemReadEin, MemtoRegEin, ALUOpE, MULOpE, MemWriteEin, ALUSrcE, RegWriteEin, ALUfuncE, ShamtE})
    );
     
EX ex(
    .Clock(Clock),
    .nReset(nReset),
    .ALUOp(ALUOpE),
    .MULOp(MULOpE),
    .Jump(JumpE),
    .Branch(BranchE),
    .PCin(PCAddrIncE),
    .RegWriteIn(RegWriteEin),
    .MemReadIn(MemReadEin),
    .MemtoRegIn(MemtoRegEin),
    .MemWriteIn(MemWriteEin),
    .ALUSrc(ALUSrcE),
    .A(RsDataE),
    .B(RtDataEin),
    .Immediate(ImmDataE),
    .Shamt(ShamtE),
    .RaddrIn(RAddrEin),
    .Func(ALUfuncE),
    .Out(ALUDataE),
    .RtDataOut(RtDataEout),
    .RAddrOut(RAddrEout),
    .C(),
    .Z(),
    .O(),
    .N(),
    .RegWriteOut(RegWriteEout),
    .MemReadOut(MemReadEout),
    .MemtoRegOut(MemtoRegEout),
    .MemWriteOut(MemWriteEout),
    .PCout()
    );

PIPE #(n=0) pipe2(  // n need to be calculated
    .Clock(Clock),
    .nReset(nReset),
    .In({ALUDataE, RtDataEout, RAddrEout, RegWriteEout, MemReadEout, MemtoRegEout, MemWriteEout}),
    .Out({ALUDataMin, RtDataM, RAddrMin, RegWriteMin, MemReadM, MemtoRegMin, MemWriteM})
    );

MEM mem0(
    .MemWrite(MemWriteM),
    .MemRead(MemReadM),
    .RegWriteIn(RegWriteMin),
    .MemAddr(ALUDataMin),
    .RAddrIn(RAddrMin),
    .MemDataIn(RtDataM),
    .RegWriteOut(RegWriteMout),
    .RAddrOut(RAddrMout),
    .MemDataOut(MemDataM),
    .ALUDataOut(ALUDataMout)
    );

PIPE #(n=0) pipe3(
    .Clock(Clock),
    .nReset(nReset),
    .In({RegWriteMout, RAddrMout, MemDataM, ALUDataMout}),
    .Out({RegWriteW, RAddrW, MemDataW, ALUDataW})
    );
     
WB wb0();


endmodule
