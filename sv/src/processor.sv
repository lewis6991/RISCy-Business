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
                        WriteR   ,
                        nStall
);

wire JumpD        ;
wire JumpE1       ;

wire BranchD      ;
wire BranchE1     ;

wire MemReadD     ;
wire MemReadE1    ;
wire MemReadE2    ;
wire MemReadM     ;

wire MemtoRegD    ;
wire MemtoRegE1   ;
wire MemtoRegE2   ;
wire MemtoRegM    ;
wire MemtoRegW    ;

wire MemWriteD    ;
wire MemWriteE1   ;
wire MemWriteE2   ;
wire MemWriteM    ;

wire ALUSrcD      ;
wire ALUSrcE1     ;

wire RegWriteD    ;
wire RegWriteE1in ;
wire RegWriteE1out;
wire RegWriteE2   ;
wire RegWriteM    ;
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

wire [31:0] InstructionF;
wire [31:0] InstructionD;

wire [31:0] RDataW      ;

wire [4:0]  RAddrD      ;
wire [4:0]  RAddrE1     ;
wire [4:0]  RAddrE2     ;
wire [4:0]  RAddrM      ;
wire [4:0]  RAddrW      ;

wire [4:0]  RsAddrD     ;
wire [4:0]  RsAddrE1    ;
wire [4:0]  RtAddrD     ;
wire [4:0]  RtAddrE1    ;

wire [31:0] ImmDataD    ;
wire [31:0] ImmDataE1   ;

wire [31:0] RsData      ;
wire [31:0] RsDataD     ;
wire [31:0] RsDataE1    ;

wire [31:0] RtData      ;
wire [31:0] RtDataD     ;
wire [31:0] RtDataE1    ;
wire [31:0] RtDataE2    ;
wire [31:0] RtDataM     ;
wire [31:0] RtDataW     ;

wire [5:0]  ALUfuncD    ;
wire [5:0]  ALUfuncE1   ;
wire [5:0]  ALUfuncE2   ;

wire [2:0]  MemfuncD    ;
wire [2:0]  MemfuncE1   ;
wire [2:0]  MemfuncE2   ;
wire [2:0]  MemFuncM    ;
wire [2:0]  MemfuncW    ;

wire [4:0]  ShamtD      ;
wire [4:0]  ShamtE1     ;

wire [31:0] PCAddrInc   ;

wire [15:0] InstrAddrD  ;
wire [31:0] InstrAddrE1 ;

wire [63:0] ALUDataE1   ;
wire [63:0] ALUDataE2in ;
wire [31:0] ALUDataE2out;
wire [31:0] ALUDataM    ;
wire [31:0] ALUDataW    ;

wire [ 1:0] ForwardA    ;
wire [ 1:0] ForwardB    ;

wire        ForwardSrcA ;
wire        ForwardSrcB ;

wire [31:0] A           ;
wire [31:0] B           ;

wire [31:0] BranchAddr  ;

wire        BRASrcD     ;
wire        BRASrcE     ;

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
    .Clock (Clock                                   ),
    .nReset(nReset                                  ),
    .In    ({InstructionF, InstrAddr & {16{nStall}}}),
    .Out   ({InstructionD, InstrAddrD}              )
);

DEC de0(
    .Clock       (Clock              ),
    .nReset      (nReset             ),
    .RegWriteIn  (RegWriteW          ),
    .Instruction (InstructionD       ),
    .RData       (RDataW             ),
    .InstrAddrIn ({16'b0, InstrAddrD}),
    .RAddrIn     (RAddrW             ),
    .RegAddr     (RegAddr            ),
    .ImmData     (ImmDataD           ),
    .RsAddr      (RsAddrD            ),
    .RtAddr      (RtAddrD            ),
    .RsData      (RsData             ),
    .RtData      (RtData             ),
    .RegData     (RegData            ),
    .RAddrOut    (RAddrD             ),
    .Branch      (BranchD            ),
    .Jump        (JumpD              ),
    .MemRead     (MemReadD           ),
    .MemtoReg    (MemtoRegD          ),
    .ALUOp       (ALUOpD             ),
    .MULOp       (MULOpD             ),
    .MemWrite    (MemWriteD          ),
    .ALUSrc      (ALUSrcD            ),
    .BRASrc      (BRASrcD            ),
    .RegWriteOut (RegWriteD          ),
    .ALUfunc     (ALUfuncD           ),
    .Memfunc     (MemfuncD           ),
    .Shamt       (ShamtD             )
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
        {16'b0, InstrAddrD},
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
    }),
    .Out({
        ImmDataE1   ,
        RsAddrE1    ,
        RtAddrE1    ,
        RsDataE1    ,
        RtDataE1    ,
        InstrAddrE1 ,
        RAddrE1     ,
        BranchE1    ,
        JumpE1      ,
        MemReadE1   ,
        MemtoRegE1  ,
        ALUOpE1     ,
        MULOpE1     ,
        MemWriteE1  ,
        ALUSrcE1    ,
        BRASrcE     ,
        RegWriteE1in,
        ALUfuncE1   ,
        MemfuncE1   ,
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
    .MemWriteIn (MemWriteE1   ),
    .ALUSrc     (ALUSrcE1     ),
    .BRASrc     (BRASrcE      ),
    .A          (A            ),//(RsDataE     ),//(A           ),
    .B          (B            ),//(RtDataEin   ),//(B           ),
    .Immediate  (ImmDataE1    ),
    .PCin       (InstrAddrE1  ),
    .Shamt      (ShamtE1      ),
    .Func       (ALUfuncE1    ),
    .Out        (ALUDataE1    ),
    .PCout      (BranchAddr   ),
    .C          (ALUCE1       ),
    .Z          (ALUZE1       ),
    .O          (ALUOE1       ),
    .N          (ALUNE1       ),
    .RegWriteOut(RegWriteE1out),
    .BranchTaken(BranchTaken  ),
    .ACCEn      (ACCEnE1      )
);

PIPE #(.n(119)) pipe2(
    .Clock(Clock),
    .nReset(nReset),
    .In({
        RegWriteE1out,
        MemReadE1    ,
        MemtoRegE1   ,
        MemWriteE1   ,
        MemfuncE1    ,
        ALUCE1       ,
        ALUZE1       ,
        ALUOE1       ,
        ALUNE1       ,
        ACCEnE1      ,
        B            ,
        ALUDataE1    ,
        RAddrE1      ,
        ALUfuncE1
    }),
    .Out({
        RegWriteE2 ,
        MemReadE2  ,
        MemtoRegE2 ,
        MemWriteE2 ,
        MemfuncE2  ,
        ALUCE2     ,
        ALUZE2     ,
        ALUOE2     ,
        ALUNE2     ,
        ACCEnE2    ,
        RtDataE2   ,
        ALUDataE2in,
        RAddrE2    ,
        ALUfuncE2
    })
);

EX2 ex2(
    .Clock (Clock       ),
    .nReset(nReset      ),
    .ALUC  (ALUCE2      ),
    .ALUZ  (ALUZE2      ),
    .ALUO  (ALUOE2      ),
    .ALUN  (ALUNE2      ),
    .ACCEn (ACCEnE2     ),
    .In    (ALUDataE2in ),
    .Func  (ALUfuncE2   ),
    .Out   (ALUDataE2out),
    .C     (            ),
    .Z     (            ),
    .O     (            ),
    .N     (            )
);

PIPE #(.n(76)) pipe3(
    .Clock(Clock),
    .nReset(nReset),
    .In({
        ALUDataE2out,
        RtDataE2    ,
        RAddrE2     ,
        MemfuncE2   ,
        RegWriteE2  ,
        MemReadE2   ,
        MemtoRegE2  ,
        MemWriteE2
    }),
    .Out({
        ALUDataM ,
        RtDataM  ,
        RAddrM   ,
        MemFuncM ,
        RegWriteM,
        MemReadM ,
        MemtoRegM,
        MemWriteM
    })
);

MEM mem0(
    .MemfuncIn   (MemFuncM ),
    .RtDataIn    (RtDataM  ),
    .WriteL      (WriteL   ),
    .WriteR      (WriteR   ),
    .MemWriteData(WriteData)
);

PIPE #(.n(74)) pipe4(
    .Clock(Clock),
    .nReset(nReset),
    .In({
        RegWriteM,
        MemtoRegM,
        MemFuncM ,
        RAddrM   ,
        ALUDataM ,
        RtDataM
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
    .RegWriteE2 (RegWriteE2 ),
    .RegWriteM  (RegWriteM  ),
    .RegWriteW  (RegWriteW  ),
    .RAddrE2    (RAddrE2    ),
    .RAddrM     (RAddrM     ),
    .RAddrW     (RAddrW     ),
    .RsAddrE1   (RsAddrE1   ),
    .RtAddrE1   (RtAddrE1   ),
    .RsAddrD    (RsAddrD    ),
    .RtAddrD    (RtAddrD    ),
    .ForwardSrcA(ForwardSrcA),
    .ForwardSrcB(ForwardSrcB),
    .ForwardA   (ForwardA   ),
    .ForwardB   (ForwardB   )
);

muxfour m0(
    .Sel(ForwardA         ),
    .A  (RsDataE1         ),
    .B  (ALUDataE2in[31:0]),
    .C  (ALUDataM         ),
    .D  (RDataW           ),
    .Y  (A                )
);

muxfour m1(
    .Sel(ForwardB         ),
    .A  (RtDataE1         ),
    .B  (ALUDataE2in[31:0]),
    .C  (ALUDataM         ),
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
    .MemReadE(MemReadE1), //Not sure
    .Clock   (Clock    ),
    .RtAddrE (RtAddrE1 ),
    .RsAddrD (RsAddrD  ),
    .RtAddrD (RtAddrD  ),
    .nStall  (nStall   )
);

endmodule
