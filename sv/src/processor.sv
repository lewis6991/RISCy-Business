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
wire MemtoRegM;
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
wire RegWriteM;
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
wire [4:0] RAddrM;
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

wire [31:0] ALUOutE;

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
    .RegWriteIn(RegWriteW),
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
    .Out(ALUOutE),
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
    .In({ALUOutE, RtDataEout, RAddrEout, RegWriteEout, MemReadEout, MemtoRegEout, MemWriteEout}),
    .Out({ALUOutDin, RtDataD, RAddrDin, RegWriteDin, MemReadD, MemtoRegD, MemWriteD})
    );

MEM mem0(
    .MemAddr(ALUOutDin),
    .MemDataIn(),
    .MemDataOut()
    );

PIPE #(n=0) pipe3(
    .Clock(Clock),
    .nReset(nReset),
    .In(),
    .Out()
    );
     
WB wb0();


endmodule
