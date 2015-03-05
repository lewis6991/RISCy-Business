//-----------------------------------------------------------------------------
// File              : PROCESSOR.sv
// Description       : Top-Level Processor
// Primary Author    : Dominic Murphy
// Other Contributors: Dhanushan Raveendran, Lewis Russell
// Notes             :
//------------------------------------------------------------------------------

module PROCESSOR(
    input               Clock    ,
                        nReset   ,
    input        [31:0] InstrMem ,
                        MemData  ,
    input         [4:0] RegAddr  ,
    output logic [31:0] WriteData,
                        RegData  ,
    output logic [15:0] InstrAddr,
                        MemAddr  ,
    output logic        MemWrite ,
                        MemRead
);

wire JumpD       ;
wire JumpE       ;

wire BranchD     ;
wire BranchE     ;
wire BranchM     ;

wire MemReadD    ;
wire MemReadEin  ;
wire MemReadEout ;
wire MemReadM    ;

wire MemtoRegD   ;
wire MemtoRegEin ;
wire MemtoRegEout;
wire MemtoRegMin ;
wire MemtoRegMout;
wire MemtoRegW   ;

wire MemWriteD   ;
wire MemWriteEin ;
wire MemWriteEout;
wire MemWriteM   ;

wire ALUSrcD     ;
wire ALUSrcE     ;

wire RegWriteD   ;
wire RegWriteEin ;
wire RegWriteEout;
wire RegWriteMin ;
wire RegWriteMout;
wire RegWriteW   ;

wire ALUOpD      ;
wire ALUOpE      ;

wire MULOpD      ;
wire MULOpE      ;

wire BranchTaken ;

wire [31:0] InstructionF ;
wire [31:0] InstructionD ;

wire [31:0] RDataW       ;

wire [4:0]  RAddrD       ;
wire [4:0]  RAddrEin     ;
wire [4:0]  RAddrEout    ;
wire [4:0]  RAddrMin     ;
wire [4:0]  RAddrMout    ;
wire [4:0]  RAddrW       ;

wire [4:0]  RsAddrD      ;
wire [4:0]  RsAddrE      ;
wire [4:0]  RtAddrD      ;
wire [4:0]  RtAddrE      ;

wire [31:0] ImmDataD     ;
wire [31:0] ImmDataE     ;

wire [31:0] RsDataD      ;
wire [31:0] RsDataE      ;

wire [31:0] RtDataD      ;
wire [31:0] RtDataEin    ;
wire [31:0] RtDataEout   ;
wire [31:0] RtDataM      ;

wire [5:0]  ALUfuncD     ;
wire [5:0]  ALUfuncE     ;

wire [4:0]  ShamtD       ;
wire [4:0]  ShamtE       ;

wire [31:0] PCAddrInc    ;

wire [31:0] InstrAddrDin ;
wire [31:0] InstrAddrDout;
wire [31:0] InstrAddrE   ;

wire [31:0] ALUDataE     ;
wire [31:0] ALUDataMin   ;
wire [31:0] ALUDataMout  ;
wire [31:0] ALUDataW     ;

wire [31:0] MemDataM     ;
wire [31:0] MemDataW     ;

wire [ 1:0] ForwardA     ;
wire [ 1:0] ForwardB     ;

wire [31:0] A            ;
wire [31:0] B            ;

wire [31:0] BranchAddr   ;

IF if0(
    .Clock      (Clock       ),
    .nReset     (nReset      ),
    .BranchTaken(BranchTaken ),
    .BranchAddr (BranchAddr  ),
    .InstrMem   (InstrMem    ),
    .InstrAddr  (InstrAddr   ),
    .InstrOut   (InstructionF),
    .PCAddrInc  (PCAddrInc   )
);

PIPE #(.n(64)) pipe0(
    .Clock (Clock                           ),
    .nReset(nReset                          ),
    .In    ({InstructionF, 16'b0, InstrAddr}),
    .Out   ({InstructionD, InstrAddrDin    })
);

DEC de0(
    .Clock       (Clock        ),
    .nReset      (nReset       ),
    .RegWriteIn  (RegWriteW    ),
    .Instruction (InstructionD ),
    .RData       (RDataW       ),
    .InstrAddrIn (InstrAddrDin ),
    .RAddrIn     (RAddrW       ),
    .RegAddr     (RegAddr      ),
    .ImmData     (ImmDataD     ),
    .RsAddr      (RsAddrD      ),
    .RtAddr      (RtAddrD      ),
    .RsData      (RsDataD      ),
    .RtData      (RtDataD      ),
    .InstrAddrOut(InstrAddrDout),
    .RegData     (RegData      ),
    .RAddrOut    (RAddrD       ),
    .Branch      (BranchD      ),
    .Jump        (JumpD        ),
    .MemRead     (MemReadD     ),
    .MemtoReg    (MemtoRegD    ),
    .ALUOp       (ALUOpD       ),
    .MULOp       (MULOpD       ),
    .MemWrite    (MemWriteD    ),
    .ALUSrc      (ALUSrcD      ),
    .RegWriteOut (RegWriteD    ),
    .ALUfunc     (ALUfuncD     ),
    .Shamt       (ShamtD       )
);

PIPE #(.n(163)) pipe1(
    .Clock(Clock),
    .nReset(nReset),
    .In ({
        ImmDataD     ,
        RsAddrD      ,
        RtAddrD      ,
        RsDataD      ,
        RtDataD      ,
        InstrAddrDout,
        RAddrD       ,
        BranchD      ,
        JumpD        ,
        MemReadD     ,
        MemtoRegD    ,
        ALUOpD       ,
        MULOpD       ,
        MemWriteD    ,
        ALUSrcD      ,
        RegWriteD    ,
        ALUfuncD     ,
    ShamtD})         ,
    .Out({
        ImmDataE   ,
        RsAddrE    ,
        RtAddrE    ,
        RsDataE    ,
        RtDataEin  ,
        InstrAddrE ,
        RAddrEin   ,
        BranchE    ,
        JumpE      ,
        MemReadEin ,
        MemtoRegEin,
        ALUOpE     ,
        MULOpE     ,
        MemWriteEin,
        ALUSrcE    ,
        RegWriteEin,
        ALUfuncE   ,
        ShamtE
    })
);

EX ex(
    .Clock      (Clock       ),
    .nReset     (nReset      ),
    .ALUOp      (ALUOpE      ),
    .MULOp      (MULOpE      ),
    .Jump       (JumpE       ),
    .Branch     (BranchE     ),
    .PCin       (InstrAddrE  ),
    .RegWriteIn (RegWriteEin ),
    .MemReadIn  (MemReadEin  ),
    .MemtoRegIn (MemtoRegEin ),
    .MemWriteIn (MemWriteEin ),
    .ALUSrc     (ALUSrcE     ),
    .A          (RsDataE     ),//(A           ),
    .B          (RtDataEin   ),//(B           ),
    .Immediate  (ImmDataE    ),
    .Shamt      (ShamtE      ),
    .RAddrIn    (RAddrEin    ),
    .Func       (ALUfuncE    ),
    .Out        (ALUDataE    ),
    .RtDataOut  (RtDataEout  ),
    .RAddrOut   (RAddrEout   ),
    .C          (            ),
    .Z          (            ),
    .O          (            ),
    .N          (            ),
    .RegWriteOut(RegWriteEout),
    .MemReadOut (MemReadEout ),
    .MemtoRegOut(MemtoRegEout),
    .MemWriteOut(MemWriteEout),
    .PCout      (BranchAddr  ),
    .BranchTaken(BranchTaken )
);

PIPE #(.n(73)) pipe2(
    .Clock(Clock),
    .nReset(nReset),
    .In({
        ALUDataE    ,
        RtDataEout  ,
        RAddrEout   ,
        RegWriteEout,
        MemReadEout ,
        MemtoRegEout,
        MemWriteEout
    }),
    .Out({
        ALUDataMin ,
        RtDataM    ,
        RAddrMin   ,
        RegWriteMin,
        MemReadM   ,
        MemtoRegMin,
        MemWriteM
    })
);

MEM mem0(
    .RegWriteIn  (RegWriteMin ),
    .MemtoRegIn  (MemtoRegMin ),
    .MemReadIn   (MemReadM    ),
    .MemWriteIn  (MemWriteM   ),
    .RAddrIn     (RAddrMin    ),
    .RtData      (RtDataM     ),
    .ALUDataIn   (ALUDataMin  ),
    .MemDataIn   (MemData     ),
    .RegWriteOut (RegWriteMout),
    .MemtoRegOut (MemtoRegMout),
    .MemWrite    (MemWrite    ),
    .MemRead     (MemRead     ),
    .RAddrOut    (RAddrMout   ),
    .MemAddr     (MemAddr     ),
    .MemWriteData(WriteData   ),
    .MemDataOut  (MemDataM    ),
    .ALUDataOut  (ALUDataMout )
);

PIPE #(.n(71)) pipe3(
    .Clock(Clock),
    .nReset(nReset),
    .In({
        RegWriteMout,
        MemtoRegMout,
        RAddrMout   ,
        MemDataM    ,
        ALUDataMout
    }),
    .Out({
        RegWriteW,
        MemtoRegW,
        RAddrW   ,
        MemDataW ,
        ALUDataW
    })
);

WB wb0(
    .MemtoReg(MemtoRegW),
    .ALUData (ALUDataW ),
    .MemData (MemDataW ),
    .WBData  (RDataW   )
);

/*FU dfu0(
    .RegWriteM(RegWriteMin),
    .RegWriteW(RegWriteW  ),
    .RAddrM   (RAddrMin   ),
    .RAddrW   (RAddrW     ),
    .RsAddrE  (RsAddrE    ),
    .RtAddrE  (RtAddrE    ),
	.RsAddr   (RsAddrD    ),
	.RtAddr   (RtAddrD    ),
    .ForwardA (ForwardA   ),
    .ForwardB (ForwardB   )
);

muxthree m0(
    .Sel(ForwardA  ),
    .A  (RsDataE   ),
    .B  (ALUDataMin),
    .C  (RDataW    ),
    .Y  (A         )
);

muxthree m1(
    .Sel(ForwardB  ),
    .A  (RtDataEin ),
    .B  (ALUDataMin),
    .C  (RDataW    ),
    .Y  (B         )
);*/

endmodule
