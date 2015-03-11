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
wire [31:0] RtDataM      ;

wire [5:0]  ALUfuncD     ;
wire [5:0]  ALUfuncE1    ;
wire [5:0]  ALUfuncE2    ;

wire [4:0]  ShamtD       ;
wire [4:0]  ShamtE1      ;

wire [31:0] PCAddrInc    ;

wire [31:0] InstrAddrDin ;
wire [31:0] InstrAddrDout;
wire [31:0] InstrAddrE1  ;

wire [31:0] ALUDataE1    ;
wire [31:0] ALUDataE2in  ;
wire [31:0] ALUDataE2out ;
wire [31:0] ALUDataMin   ;
wire [31:0] ALUDataMout  ;
wire [31:0] ALUDataW     ;

wire [31:0] MemDataM     ;
wire [31:0] MemDataW     ;

wire [ 1:0] ForwardA     ;
wire [ 1:0] ForwardB     ;

wire        ForwardSrcA  ;
wire        ForwardSrcB  ;

wire [31:0] A            ;
wire [31:0] B            ;

wire [31:0] BranchAddr   ;
//wire        Stall        ;

IF if0(
    .Clock      (Clock       ),
    .nReset     (nReset      ),
//  .Stall      (Stall       ),
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
    .RsData      (RsData       ),
    .RtData      (RtData       ),
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
        RegWriteE1in,
        ALUfuncE1   ,
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
    .A          (A            ),//(RsDataE     ),//(A           ),
    .B          (B            ),//(RtDataEin   ),//(B           ),
    .Immediate  (ImmDataE1    ),
    .PCin       (InstrAddrE1  ),
    .Shamt      (ShamtE1      ),
    .RAddrIn    (RAddrE1in    ),
    .Func       (ALUfuncE1    ),
    .Out        (ALUDataE1    ),
    .RtDataOut  (RtDataE1out  ),
    .PCout      (BranchAddr   ),
    .RAddrOut   (RAddrE1out   ),
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

PIPE #(.n(124)) pipe2(
    .Clock(Clock),
    .nReset(nReset),
    .In({
        RegWriteE1out,
        MemReadE1out ,
        MemtoRegE1out,
        MemWriteE1out,
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
    .RtDataIn   (RtDataE2in   ),
    .In         (ALUDataE2in  ),
    .RAddrIn    (RAddrE2in    ),
    .Func       (ALUfuncE2    ),
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

PIPE #(.n(73)) pipe3(
    .Clock(Clock),
    .nReset(nReset),
    .In({
        ALUDataE2out ,
        RtDataE2out  ,
        RAddrE2out   ,
        RegWriteE2out,
        MemReadE2out ,
        MemtoRegE2out,
        MemWriteE2out
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

PIPE #(.n(71)) pipe4(
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

FU dfu0(
    .RegWriteM  (RegWriteMin),
    .RegWriteW  (RegWriteW  ),
    .RAddrM     (RAddrMin   ),
    .RAddrW     (RAddrW     ),
    .RsAddrE    (RsAddrE1   ),
    .RtAddrE    (RtAddrE1   ),
    .RsAddrD    (RsAddrD    ),
    .RtAddrD    (RtAddrD    ),
    .ForwardSrcA(ForwardSrcA),
    .ForwardSrcB(ForwardSrcB),
    .ForwardA   (ForwardA   ),
    .ForwardB   (ForwardB   )
);

muxthree m0(
    .Sel(ForwardA  ),
    .A  (RsDataE1  ),
    .B  (ALUDataMin),
    .C  (RDataW    ),
    .Y  (A         )
);

muxthree m1(
    .Sel(ForwardB  ),
    .A  (RtDataE1in),
    .B  (ALUDataMin),
    .C  (RDataW    ),
    .Y  (B         )
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

/*HDU hdu0(
    .MemReadE(MemReadEin),
    .Clock   (Clock     ),
    .RtAddrE (RtAddrE1  ),
    .RsAddrD (RsAddrD   ),
    .RtAddrD (RtAddrD   ),
    .Stall   (Stall     )
);*/

endmodule
