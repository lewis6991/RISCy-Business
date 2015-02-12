//----------------------------------------
// File: DEC.sv
// Description: Decode pipeline stage
// Primary Author: Dominic Murphy
// Other Contributors: Dhanushan Raveendran
// Notes: 
//----------------------------------------
module DEC(
        input                Clock,
                             nReset,
                             RegWriteIn,
        input        [31:0]  Instruction,
                             RData,
        input        [4:0]   RAddrIn,
        output logic [31:0]  ImmData,
                             RsData,
                             RtData,
        output logic [4:0]   RAddrOut,
        output logic         RegDst,
                             Branch,
                             MemRead,
                             MemtoReg,
                             ALUOp,
                             MULOp,
                             MemWrite,
                             ALUSrc,
                             RegWriteOut,
        output logic [5:0]   ALUfunc,
        output logic [4:0]   Shamt
);

wire [31:0] instrse;
wire shiftsel;

assign Shamt = Instruction[10:6];

decoder dec0(
        .RegDst(RegDst),
        .Branch(Branch),
        .MemRead(MemRead),
        .MemtoReg(MemtoReg),
        .ALUOp(ALUOp),
        .MULOp(MULOp),
        .MemWrite(MemWrite),
        .ALUSrc(ALUSrc),
        .RegWrite(RegWriteOut),
        .ShiftSel(shiftsel),
        .Func(ALUfunc),
        .Op_Code(Instruction[31:26]),
        .Func_Code(Instruction[5:0])
        );

registers reg0(
        .Clock(Clock),
        .nReset(nReset),
        .RegWrite(RegWriteIn),
        .RdAddr(RAddrIn),
        .RsAddr(Instruction[25:21]),
        .RtAddr(Instruction[20:16]),
        .RdData(RData),
        .RsData(RsData),
        .RtData(RtData)
        );
        
signextend se0(
        .In(Instruction[15:0]),
        .Out(instrse)
        );
        
mux #(n=32) mux1(
        .A(instrse),
        .B({Instruction[15:0],16'd0}),
        .Y(ImmData),
        .sel(shiftsel)
        );
        
mux #(n=5) mux2(
        .A(Instruction[20:16]),
        .B(Instruction[15:11]),
        .Y(RAddrOut),
        .sel(RegDst)
        );

endmodule
