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
                             MemWrite,
                             ALUSrc,
                             RegWriteOut,
                             ALUfunc,
        output logic [5:0]   Op_Code,
                             Func_Code
);

wire [31:0] InstrSE;
wire shiftsel;

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
        .Out(InstrSE)
        );
        
mux mux1(
        .A(InstrSE),
        .B({Instruction[15:0],16'd0}),
        .Y(ImmData),
        .sel(shiftsel)
        );
        
mux mux2 #(n=5)(
        .A(Instruction[20:16]),
        .B(Instruction[15:11]),
        .Y(RAddrOut),
        .sel(RegDst)
        );

endmodule
