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

wire Jump;

wire BranchD;
wire BranchE;
wire BranchM;

wire MemReadD;
wire MemReadE;
wire MemReadM;

wire MemtoRegD;
wire MemtoRegE;
wire MemtoRegM;
wire MemtoRegW;

wire ALUOpD;

wire MULOpD;

wire MemWriteD;
wire MemWriteE;
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
wire [4:0] RAddrE;
wire [4:0] RAddrM;
wire [4:0] RAddrW;
wire [31:0] ImmDataD;
wire [31:0] RsDataD;
wire [31:0] RtDataD;

wire [5:0] ALUfuncD;
wire [5:0] ALUfuncE;

wire [4:0] ShamtD;
wire [4:0] ShamtE;

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
    .InstrOut(Instruction)
    );
    
PIPE #(n=0) pipe0(
    .Clock(Clock),
    .nReset(nReset),
    .In(InstructionF),
    .Out(InstructionD)
    );
     
DEC de0(
    .Clock(Clock),
    .nReset(nReset),
    .RegWriteIn(RegWriteW),
    .Instruction(InstructionD),
    .RData(RDataW),
    .RAddrIn(RAddrW),
    .ImmData(ImmDataD),
    .RsData(RsDataD),
    .RtData(RtDataD),
    .RAddrOut(RAddrD),
    .RegDst(RegDstD),
    .Branch(BranchD),
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

PIPE #(n=122) pipe1( // n need to be recalculated
    .Clock(Clock),
    .nReset(nReset),
    .In ({ImmDataD, RsDataD, RtDataD, RAddrD, RegDstD, BranchD, MemReadD, MemtoRegD, ALUOpD, MULOpD, MemWriteD, ALUSrcD, RegWriteD, ALUfuncD, ShamtD}),
    .Out({ImmDataE, RsDataE, RtDataE, RAddrE, RegDstE, BranchE, MemReadE, MemtoRegE, ALUOpE, MULOpE, MemWriteE, ALUSrcE, RegWriteE, ALUfuncE, ShamtE})
    );
     
EX ex(
    .Clock(Clock),
    .nReset(nReset),
	.ALUOp(ALUOpE),
	.MULOp(MULOpE),
    .Jump(),
    .Branch(),
    .PCin(),
    .RegWriteIn(RegWriteE),
    .MemReadIn(MemReadE),
    .MemtoRegIn(MemtoRegE),
    .A(RsDataE),
    .B(RtDataE),
	.Immediate(ImmDataE),
    .Shamt(ShamtE),
    .Func(ALUfuncE),
    .Out(),
    .C(),
    .Z(),
    .O(),
    .N(),
    .RegWriteOut(),
    .MemReadOut(),
    .MemtoRegOut(),
	.ALUSrc(),
    .PCout()
    );

PIPE #(n=0) pipe2(
    .Clock(Clock),
    .nReset(nReset),
    .In(),
    .Out()
    );

MEM mem0(
    .MemAddr(),
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
