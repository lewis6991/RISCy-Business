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
    input        [ 4:0] RegAddr  ,
    output logic [31:0] WriteData,
                        RegData  ,
    output logic [15:0] InstrAddr,
                        MemAddr  ,
    output logic        MemWrite ,
                        MemRead  ,
                        WriteL   ,
                        WriteR
);

wire JumpD        ;
wire JumpE1       ;

wire BranchD      ;
wire BranchE1     ;

wire MemReadD     ;
wire MemReadE1in  ;
wire MemReadE1out ;
wire MemReadE2in  ;
wire MemReadE2out ;
wire MemReadM     ;

wire MemtoRegD    ;
wire MemtoRegE1in ;
wire MemtoRegE2in ;
wire MemtoRegE1out;
wire MemtoRegE2out;
wire MemtoRegMin  ;
wire MemtoRegMout ;
wire MemtoRegW    ;

wire MemWriteD    ;
wire MemWriteE1in ;
wire MemWriteE2in ;
wire MemWriteE1out;
wire MemWriteE2out;
wire MemWriteM    ;

wire ALUSrcD      ;
wire ALUSrcE1     ;

wire RegWriteD    ;
wire RegWriteE1in ;
wire RegWriteE2in ;
wire RegWriteE1out;
wire RegWriteE2out;
wire RegWriteMin  ;
wire RegWriteMout ;
wire RegWriteW    ;

wire ALUOpD       ;
wire ALUOpE1      ;

wire MULOpD       ;
wire MULOpE1      ;

wire BranchTaken  ;

wire ALUCE1       ;
wire ALUCE2       ;
wire ALUZE1       ;
wire ALUZE2       ;
wire ALUOE1       ;
wire ALUOE2       ;
wire ALUNE1       ;
wire ALUNE2       ;

wire ACCEnE1      ;
wire ACCEnE2      ;

wire [31:0] InstructionF ;
wire [31:0] InstructionD ;

wire [31:0] RDataW       ;

wire [4:0]  RAddrD       ;
wire [4:0]  RAddrE1in    ;
wire [4:0]  RAddrE1out   ;
wire [4:0]  RAddrE2in    ;
wire [4:0]  RAddrE2out   ;
wire [4:0]  RAddrMin     ;
wire [4:0]  RAddrMout    ;
wire [4:0]  RAddrW       ;

wire [4:0]  RsAddrD      ;
wire [4:0]  RsAddrE1     ;
wire [4:0]  RtAddrD      ;
wire [4:0]  RtAddrE1     ;

wire [31:0] ImmDataD     ;
wire [31:0] ImmDataE1    ;

wire [31:0] RsData       ;
wire [31:0] RsDataD      ;
wire [31:0] RsDataE1     ;

wire [31:0] RtData       ;
wire [31:0] RtDataD      ;
wire [31:0] RtDataE1in   ;
wire [31:0] RtDataE1out  ;
wire [31:0] RtDataE2in   ;
wire [31:0] RtDataE2out  ;
wire [31:0] RtDataMin    ;
wire [31:0] RtDataMout   ;
wire [31:0] RtDataW      ;

wire [5:0]  ALUfuncD     ;
wire [5:0]  ALUfuncE1    ;
wire [5:0]  ALUfuncE2    ;

wire [2:0]  MemfuncD     ;
wire [2:0]  MemfuncE1in  ;
wire [2:0]  MemfuncE1out ;
wire [2:0]  MemfuncE2in  ;
wire [2:0]  MemfuncE2out ;
wire [2:0]  MemfuncMin   ;
wire [2:0]  MemfuncMout  ;
wire [2:0]  MemfuncW     ;

wire [4:0]  ShamtD       ;
wire [4:0]  ShamtE1      ;

wire [31:0] PCAddrInc    ;

wire [15:0] InstrAddrDin ;
wire [31:0] InstrAddrDout;
wire [31:0] InstrAddrE1  ;

wire [63:0] ALUDataE1    ;
wire [63:0] ALUDataE2in  ;
wire [31:0] ALUDataE2out ;
wire [31:0] ALUDataMin   ;
wire [31:0] ALUDataMout  ;
wire [31:0] ALUDataW     ;

wire [ 1:0] ForwardA     ;
wire [ 1:0] ForwardB     ;

wire        ForwardSrcA  ;
wire        ForwardSrcB  ;

wire [31:0] A            ;
wire [31:0] B            ;

wire [31:0] BranchAddr   ;

wire        nStall       ;
wire        BRASrcD      ;
wire        BRASrcE      ;

IF if0(
    .Clock      (Clock       ),
    .nReset     (nReset      ),
    .nStall     (nStall      ),
    .BranchTaken(BranchTaken ),
    .BranchAddr (BranchAddr  ),
    .InstrMem   (InstrMem    ),
    .InstrAddr  (InstrAddr   ),
    .InstrOut   (InstructionF),
    .PCAddrInc  (PCAddrInc   )
);

PIPE #(.n(48)) pipe0(
    .Clock (Clock                      ),
    .nReset(nReset                     ),
    .In    ({InstructionF, InstrAddr   }),
    .Out   ({InstructionD, InstrAddrDin})
);

DEC de0(
    .Clock       (Clock                ),
    .nReset      (nReset               ),
    .RegWriteIn  (RegWriteW            ),
    .Instruction (InstructionD         ),
    .RData       (RDataW               ),
    .InstrAddrIn ({16'b0, InstrAddrDin}),
    .RAddrIn     (RAddrW               ),
    .RegAddr     (RegAddr              ),
    .ImmData     (ImmDataD             ),
    .RsAddr      (RsAddrD              ),
    .RtAddr      (RtAddrD              ),
    .RsData      (RsData               ),
    .RtData      (RtData               ),
    .InstrAddrOut(InstrAddrDout        ),
    .RegData     (RegData              ),
    .RAddrOut    (RAddrD               ),
    .Branch      (BranchD              ),
    .Jump        (JumpD                ),
    .MemRead     (MemReadD             ),
    .MemtoReg    (MemtoRegD            ),
    .ALUOp       (ALUOpD               ),
    .MULOp       (MULOpD               ),
    .MemWrite    (MemWriteD            ),
    .ALUSrc      (ALUSrcD              ),
    .BRASrc      (BRASrcD              ),
    .RegWriteOut (RegWriteD            ),
    .ALUfunc     (ALUfuncD             ),
    .Memfunc     (MemfuncD             ),
    .Shamt       (ShamtD               )
);

PIPE #(.n(167)) pipe1(
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
        BRASrcD      ,
        RegWriteD    ,
        ALUfuncD     ,
        MemfuncD     ,
        ShamtD
    })               ,
    .Out({
        ImmDataE1   ,
        RsAddrE1    ,
        RtAddrE1    ,
        RsDataE1    ,
        RtDataE1in  ,
        InstrAddrE1 ,
        RAddrE1in   ,
        BranchE1    ,
        JumpE1      ,
        MemReadE1in ,
        MemtoRegE1in,
        ALUOpE1     ,
        MULOpE1     ,
        MemWriteE1in,
        ALUSrcE1    ,
        BRASrcE     ,
        RegWriteE1in,
        ALUfuncE1   ,
        MemfuncE1in ,
        ShamtE1
    })
);

EX1 ex1(
    .Clock      (Clock        ),
    .nReset     (nReset       ),
    .ALUOp      (ALUOpE1      ),
    .MULOp      (MULOpE1      ),
    .Jump       (JumpE1       ),
    .Branch     (BranchE1     ),
    .RegWriteIn (RegWriteE1in ),
    .MemReadIn  (MemReadE1in  ),
    .MemtoRegIn (MemtoRegE1in ),
    .MemWriteIn (MemWriteE1in ),
    .ALUSrc     (ALUSrcE1     ),
    .BRASrc     (BRASrcE      ),
    .A          (A            ),//(RsDataE     ),//(A           ),
    .B          (B            ),//(RtDataEin   ),//(B           ),
    .Immediate  (ImmDataE1    ),
    .PCin       (InstrAddrE1  ),
    .Shamt      (ShamtE1      ),
    .RAddrIn    (RAddrE1in    ),
    .Func       (ALUfuncE1    ),
    .Out        (ALUDataE1    ),
    .MemfuncIn  (MemfuncE1in  ),
    .RtDataOut  (RtDataE1out  ),
    .PCout      (BranchAddr   ),
    .RAddrOut   (RAddrE1out   ),
    .MemfuncOut (MemfuncE1out ),
    .C          (ALUCE1       ),
    .Z          (ALUZE1       ),
    .O          (ALUOE1       ),
    .N          (ALUNE1       ),
    .RegWriteOut(RegWriteE1out),
    .MemReadOut (MemReadE1out ),
    .MemtoRegOut(MemtoRegE1out),
    .MemWriteOut(MemWriteE1out),
    .BranchTaken(BranchTaken  ),
    .ACCEn      (ACCEnE1      )
);

PIPE #(.n(119)) pipe2(
    .Clock(Clock),
    .nReset(nReset),
    .In({
        RegWriteE1out,
        MemReadE1out ,
        MemtoRegE1out,
        MemWriteE1out,
        MemfuncE1out ,
        ALUCE1       ,
        ALUZE1       ,
        ALUOE1       ,
        ALUNE1       ,
        ACCEnE1      ,
        RtDataE1out  ,
        ALUDataE1    ,
        RAddrE1out   ,
        ALUfuncE1
    }),
    .Out({
        RegWriteE2in,
        MemReadE2in ,
        MemtoRegE2in,
        MemWriteE2in,
        MemfuncE2in ,
        ALUCE2      ,
        ALUZE2      ,
        ALUOE2      ,
        ALUNE2      ,
        ACCEnE2     ,
        RtDataE2in  ,
        ALUDataE2in ,
        RAddrE2in   ,
        ALUfuncE2
    })
);

EX2 ex2(
    .Clock      (Clock        ),
    .nReset     (nReset       ),
    .RegWriteIn (RegWriteE2in ),
    .MemReadIn  (MemReadE2in  ),
    .MemtoRegIn (MemtoRegE2in ),
    .MemWriteIn (MemWriteE2in ),
    .ALUC       (ALUCE2       ),
    .ALUZ       (ALUZE2       ),
    .ALUO       (ALUOE2       ),
    .ALUN       (ALUNE2       ),
    .ACCEn      (ACCEnE2      ),
    .MemfuncIn  (MemfuncE2in  ),
    .RtDataIn   (RtDataE2in   ),
    .In         (ALUDataE2in  ),
    .RAddrIn    (RAddrE2in    ),
    .Func       (ALUfuncE2    ),
    .MemfuncOut (MemfuncE2out ),
    .Out        (ALUDataE2out ),
    .RtDataOut  (RtDataE2out  ),
    .RAddrOut   (RAddrE2out   ),
    .C          (             ),
    .Z          (             ),
    .O          (             ),
    .N          (             ),
    .RegWriteOut(RegWriteE2out),
    .MemReadOut (MemReadE2out ),
    .MemtoRegOut(MemtoRegE2out),
    .MemWriteOut(MemWriteE2out)
);

PIPE #(.n(76)) pipe3(
    .Clock(Clock),
    .nReset(nReset),
    .In({
        ALUDataE2out ,
        RtDataE2out  ,
        RAddrE2out   ,
        MemfuncE2out ,
        RegWriteE2out,
        MemReadE2out ,
        MemtoRegE2out,
        MemWriteE2out
    }),
    .Out({
        ALUDataMin ,
        RtDataMin  ,
        RAddrMin   ,
        MemfuncMin ,
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
    .MemfuncIn   (MemfuncMin  ),
    .RtDataIn    (RtDataMin   ),
    .ALUDataIn   (ALUDataMin  ),
    .RegWriteOut (RegWriteMout),
    .MemtoRegOut (MemtoRegMout),
    .MemWrite    (MemWrite    ),
    .MemRead     (MemRead     ),
    .WriteL      (WriteL      ),
    .WriteR      (WriteR      ),
    .MemfuncOut  (MemfuncMout ),
    .RAddrOut    (RAddrMout   ),
    .MemAddr     (MemAddr     ),
    .MemWriteData(WriteData   ),
    .ALUDataOut  (ALUDataMout ),
    .RtDataOut   (RtDataMout  )
);

PIPE #(.n(74)) pipe4(
    .Clock(Clock),
    .nReset(nReset),
    .In({
        RegWriteMout,
        MemtoRegMout,
        MemfuncMout ,
        RAddrMout   ,
        ALUDataMout ,
        RtDataMout
    }),
    .Out({
        RegWriteW,
        MemtoRegW,
        MemfuncW ,
        RAddrW   ,
        ALUDataW ,
        RtDataW
    })
);

WB wb0(
    .MemtoReg(MemtoRegW),
    .ALUData (ALUDataW ),
    .RtData  (RtDataW  ),
    .MemData (MemData  ),
    .Memfunc (MemfuncW ),
    .WBData  (RDataW   )
);

FU dfu0(
    .RegWriteE2 (RegWriteE2in),
    .RegWriteM  (RegWriteMin ),
    .RegWriteW  (RegWriteW   ),
    .RAddrE2    (RAddrE2in   ),
    .RAddrM     (RAddrMin    ),
    .RAddrW     (RAddrW      ),
    .RsAddrE1   (RsAddrE1    ),
    .RtAddrE1   (RtAddrE1    ),
    .RsAddrD    (RsAddrD     ),
    .RtAddrD    (RtAddrD     ),
    .ForwardSrcA(ForwardSrcA ),
    .ForwardSrcB(ForwardSrcB ),
    .ForwardA   (ForwardA    ),
    .ForwardB   (ForwardB    )
);

muxfour m0(
    .Sel(ForwardA         ),
    .A  (RsDataE1         ),
    .B  (ALUDataE2in[31:0]),
    .C  (ALUDataMin       ),
    .D  (RDataW           ),
    .Y  (A                )
);

muxfour m1(
    .Sel(ForwardB         ),
    .A  (RtDataE1in       ),
    .B  (ALUDataE2in[31:0]),
    .C  (ALUDataMin       ),
    .D  (RDataW           ),
    .Y  (B                )
);

mux m2(
    .Sel(ForwardSrcA),
    .A  (RsData     ),
    .B  (RDataW     ),
    .Y  (RsDataD    )
);

mux m3(
    .Sel(ForwardSrcB),
    .A  (RtData     ),
    .B  (RDataW     ),
    .Y  (RtDataD    )
);

HDU hdu0(
    .MemReadE(MemReadE1in), //Not sure
    .Clock   (Clock      ),
    .RtAddrE (RtAddrE1   ),
    .RsAddrD (RsAddrD    ),
    .RtAddrD (RtAddrD    ),
    .nStall  (nStall     )
);

endmodule
