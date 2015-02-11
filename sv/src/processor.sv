//----------------------------------------
// File: PROCESSOR.sv
// Description: Top-Level Processor
// Primary Author: Dominic Murphy
// Other Contributors: N/A
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

IF if0( 
    .BranchTaken(),
    .BranchAddr(),
    .InstrMem(),
    .InstrAddr(),
    .InstrOut()
    );
    
PIPE #(n=0) pipe0(
    .Clock(Clock),
    .nReset(nReset),
    .In(),
    .Out()
    );
     
DE de0(
    .Clock(Clock),
    .nReset(nReset),
    .RegWriteIn(),
    .Instruction(),
    .RData(),
    .RAddrIn(),
    .ImmData(),
    .RsData(),
    .RtData(),
    .RAddrOut(),
    .RegDst(),
    .Branch(),
    .MemRead(),
    .MemtoReg(),
    .MemWrite(),
    .ALUSrc(),
    .RegWriteOut(),
    .ALUfunc(),
    .Op_Code(),
    .Func_Code()
);

PIPE #(n=0) pipe1(
    .Clock(Clock),
    .nReset(nReset),
    .In(),
    .Out()
    );
     
EX ex(
    .Clock(Clock),
    .nReset(nReset),
    .A(),
    .B(),
    .Shamt(),
    .Func(),
    .ALUOp(),
    .MULOp(),
    .ShiftSel(),
    .Jump(),
    .Branch(),
    .PCin(),
    .RegWriteIn(),
    .MemReadIn(),
    .MemtoRegIn(),
    .Out(),
    .C(),
    .Z(),
    .O(),
    .N(),
    .RegWriteOut(),
    .MemReadOut(),
    .MemtoRegOut()
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