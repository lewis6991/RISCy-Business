//----------------------------------------
// File: DEC.sv
// Description: Decode pipeline stage
// Primary Author: Dominic Murphy
// Other Contributors: Dhanushan Raveendran
// Notes:
//----------------------------------------
module DEC(
        input                Clock       ,
                             nReset      ,
                             RegWriteIn  ,
        input        [31:0]  Instruction ,
                             RData       ,
                             InstrAddrIn ,
        input        [4:0]   RAddrIn     ,
                             RegAddr     ,
        output logic [31:0]  ImmData     ,
                             RsData      ,
                             RtData      ,
                             InstrAddrOut,
                             RegData     ,
        output logic [15:0]  Offset      ,
        output logic [4:0]   RAddrOut    ,
                             RsAddr      ,
                             RtAddr      ,
        output logic         Branch      ,
                             Jump        ,
                             MemRead     ,
                             MemtoReg    ,
                             ALUOp       ,
                             MULOp       ,
                             MemWrite    ,
                             ALUSrc      ,
                             BRASrc      ,
                             RegWriteOut ,
        output logic [5:0]   ALUfunc     ,
                             Func        ,
        output logic [2:0]   Memfunc     ,
                             BrCode      ,
        output logic [4:0]   Shamt
);

wire [31:0] instrse    ;
wire [31:0] instrimm   ;
wire        shiftsel   ,
            unsgnsel   ,
            immsize    ;
wire [1:0]  regdst     ;
wire [4:0]  raddrinstr ;
wire        zeroImm    ;
wire        aluSrc     ;

assign Shamt  = Instruction[10:6] ;
assign RsAddr = Instruction[25:21];
assign RtAddr = Instruction[20:16];
assign BrCode = Instruction[28:26];
assign Func   = Instruction[5:0]  ;

assign ALUSrc = zeroImm | aluSrc;

decoder dec0 (
    .RegDst  (regdst            ),
    .Branch  (Branch            ),
    .ZeroImm (zeroImm           ),
    .Jump    (Jump              ),
    .MemRead (MemRead           ),
    .MemtoReg(MemtoReg          ),
    .ALUOp   (ALUOp             ),
    .MULOp   (MULOp             ),
    .MemWrite(MemWrite          ),
    .ALUSrc  (aluSrc            ),
    .BRASrc  (BRASrc            ),
    .RegWrite(RegWriteOut       ),
    .ShiftSel(shiftsel          ),
    .ImmSize (immsize           ),
    .Unsgnsel(unsgnsel          ),
    .Func    (ALUfunc           ),
    .MemFunc (Memfunc           ),
    .OpCode  (Instruction[31:26]),
    .FuncCode(Instruction[5:0]  ),
    .BraCode (Instruction[20:16])
);

registers reg0(
    .Clock   (Clock             ),
    .nReset  (nReset            ),
    .RegWrite(RegWriteIn        ),
    .RegAddr (RegAddr           ),
    .RdAddr  (RAddrIn           ),
    .RsAddr  (Instruction[25:21]),
    .RtAddr  (Instruction[20:16]),
    .RdData  (RData             ),
    .RsData  (RsData            ),
    .RtData  (RtData            ),
    .RegData (RegData           )
);

assign instrse = unsgnsel ? Instruction[15:0] : $signed(Instruction[15:0]);

assign instrimm = shiftsel ? {Instruction[15:0], 16'd0} : instrse;

assign ImmData = zeroImm ? 32'd0 : immsize ? {6'd0, Instruction[25:0]} : instrimm;
assign Offset  = Instruction[15:0];

// regdst = 00, RAddrOut = rt
// regdst = 01, RAddrOut = rd
assign raddrinstr = regdst[0] ? Instruction[15:11] : RtAddr;

// regdst = 1x, RAddrOut = 31
// ra = Reg 31 (return register)
assign RAddrOut = regdst[1] ? 5'd31 : raddrinstr;

endmodule
