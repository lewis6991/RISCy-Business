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
    input        [ 4:0]  RAddrIn     ,
                         RegAddr     ,
    output logic [31:0]  ImmData     ,
                         RsData      ,
                         RtData      ,
                         RegData     ,
    output logic [15:0]  Offset      ,
    output logic [ 4:0]  RAddrOut    ,
                         RsAddr      ,
                         RtAddr      ,
                         Shamt       ,
    output logic         Branch      ,
                         Jump        ,
                         MemRead     ,
                         MemtoReg    ,
                         MULOp       ,
                         MemWrite    ,
                         ALUSrc      ,
                         RegJump     ,
                         RegWriteOut ,
                         ACCEn       ,
                         ALUEn       ,
                         MULSelB     ,
    output logic [ 5:0]  ALUfunc     ,
    output logic [ 2:0]  Memfunc     ,
                         BrCode      ,
    output logic [ 1:0]  OutSel
);

wire        shiftsel  ,
            unsgnsel  ,
            immsize   ;
wire [1:0]  regdst    ;
wire [4:0]  raddrinstr;
wire        zeroImm   ;
wire        aluSrc    ;
wire [5:0]  func      ;
wire [15:0] offset    ;

logic signed [31:0] signed_offset;

assign Shamt  = Instruction[10: 6];
assign RsAddr = Instruction[25:21];
assign RtAddr = Instruction[20:16];
assign BrCode = Instruction[28:26];
assign offset = Instruction[15: 0];
assign func   = Instruction[ 5: 0];

assign Offset = offset;

assign ALUSrc = zeroImm | aluSrc;

decoder dec0 (
    .RegDst  (regdst            ),
    .Branch  (Branch            ),
    .ZeroImm (zeroImm           ),
    .Jump    (Jump              ),
    .MemRead (MemRead           ),
    .MemtoReg(MemtoReg          ),
    .MULOp   (MULOp             ),
    .MemWrite(MemWrite          ),
    .ALUSrc  (aluSrc            ),
    .RegJump (RegJump           ),
    .RegWrite(RegWriteOut       ),
    .ShiftSel(shiftsel          ),
    .ImmSize (immsize           ),
    .Unsgnsel(unsgnsel          ),
    .ACCEn   (ACCEn             ),
    .MULSelB (MULSelB           ),
    .OutSel  (OutSel            ),
    .FuncOut (ALUfunc           ),
    .MemFunc (Memfunc           ),
    .OpCode  (Instruction[31:26]),
    .FuncIn  (func              ),
    .BrLink  (RtAddr[4]         ),
    .ALUEn   (ALUEn             )
);

`ifdef no_check
registers reg0(
    .Clock   (Clock     ),
    .nReset  (nReset    ),
    .RegWrite(RegWriteIn),
    .RdAddr  (RAddrIn   ),
    .RsAddr  (RsAddr    ),
    .RtAddr  (RtAddr    ),
    .RdData  (RData     ),
    .RsData  (RsData    ),
    .RtData  (RtData    )
);
`else
registers reg0(
    .Clock   (Clock     ),
    .nReset  (nReset    ),
    .RegWrite(RegWriteIn),
    .RegAddr (RegAddr   ),
    .RdAddr  (RAddrIn   ),
    .RsAddr  (RsAddr    ),
    .RtAddr  (RtAddr    ),
    .RdData  (RData     ),
    .RsData  (RsData    ),
    .RtData  (RtData    ),
    .RegData (RegData   )
);
`endif

assign signed_offset = $signed(offset);

assign ImmData = zeroImm  ? 32'd0             :
                 immsize  ? Instruction[25:0] :
                 shiftsel ? {offset, 16'd0}   :
                 unsgnsel ? offset            :
                            signed_offset     ;

// regdst = 00, RAddrOut = rt
// regdst = 01, RAddrOut = rd
assign raddrinstr = regdst[0] ? Instruction[15:11] : RtAddr;

// regdst = 1x, RAddrOut = 31
// ra = Reg 31 (return register)
assign RAddrOut = regdst[1] ? 5'd31 : raddrinstr;

endmodule
