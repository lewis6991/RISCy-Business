//-----------------------------------------------------------------------------
// File              : PROCESSOR.sv
// Description       : Top-Level Processor
// Primary Author    : Dominic Murphy
// Other Contributors: Dhanushan Raveendran, Lewis Russell
// Notes             :
//------------------------------------------------------------------------------

`define PIPE(x,y) always_ff @ (posedge Clock, negedge nReset)\
                      if(~nReset) x <= #1 0;\
                      else        x <= #1 y;

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

logic JumpD        ;
logic JumpE1       ;

logic BranchD      ;
logic BranchE1     ;

logic MemReadD     ;
logic MemReadE1    ;
logic MemReadE2    ;
logic MemReadM     ;

logic MemtoRegD    ;
logic MemtoRegE1   ;
logic MemtoRegE2   ;
logic MemtoRegM    ;
logic MemtoRegW    ;

logic MemWriteD    ;
logic MemWriteE1   ;
logic MemWriteE2   ;
logic MemWriteM    ;

logic ALUSrcD      ;
logic ALUSrcE1     ;

logic RegWriteD    ;
logic RegWriteE1in ;
wire  RegWriteE1out;
logic RegWriteE2   ;
logic RegWriteM    ;
logic RegWriteW    ;

logic ALUOpD       ;
logic ALUOpE1      ;

logic MULOpD       ;
logic MULOpE1      ;
logic MULOpE2      ;
logic MULOpM       ;

wire  ALUCE1       ;
logic ALUCE2       ;
logic ALUCM        ;
wire  ALUZE1       ;
logic ALUZE2       ;
logic ALUZM        ;
wire  ALUOE1       ;
logic ALUOE2       ;
logic ALUOM        ;
wire  ALUNE1       ;
logic ALUNE2       ;
logic ALUNM        ;

logic ACCEnD       ;
logic ACCEnE1      ;
logic ACCEnE2      ;
logic ACCEnM       ;

wire  [31:0] InstructionF;
logic [31:0] InstructionD;

logic [31:0] RDataW      ;

logic [4:0]  RAddrD      ;
logic [4:0]  RAddrE1     ;
logic [4:0]  RAddrE2     ;
logic [4:0]  RAddrM      ;
logic [4:0]  RAddrW      ;

logic [4:0]  RsAddrD     ;
logic [4:0]  RsAddrE1    ;

logic [4:0]  RtAddrD     ;
logic [4:0]  RtAddrE1    ;
logic [4:0]  RtAddrE2    ;
logic [4:0]  RtAddrM     ;

logic [31:0] ImmDataD    ;
logic [31:0] ImmDataE1   ;

logic [31:0] RsData      ;
logic [31:0] RsDataD     ;
logic [31:0] RsDataE1    ;

logic [31:0] RtData      ;
logic [31:0] RtDataD     ;
logic [31:0] RtDataE1    ;
logic [31:0] RtDataE2    ;
logic [31:0] RtDataM     ;
logic [31:0] RtDataMout  ;
logic [31:0] RtDataW     ;

logic [5:0]  FuncD       ;
logic [5:0]  FuncE1      ;
logic [5:0]  FuncE2      ;
logic [5:0]  FuncM       ;

wire  [2:0]  BrCodeD     ;
logic [2:0]  BrCodeE1    ;

logic [2:0]  MemfuncD    ;
logic [2:0]  MemfuncE1   ;
logic [2:0]  MemfuncE2   ;
logic [2:0]  MemFuncM    ;
logic [2:0]  MemfuncW    ;

logic [4:0]  ShamtD      ;
logic [4:0]  ShamtE1     ;

logic [31:0] PCAddrInc   ;

logic [15:0] InstrAddrD  ;
logic [31:0] InstrAddrE1 ;

logic [63:0] ALUDataE1   ;
logic [63:0] ALUDataE2   ;
logic [63:0] ALUDataMin  ;
wire  [31:0] ALUDataMout ;
logic [31:0] ALUDataW    ;

logic [ 1:0] ForwardA    ;
logic [ 1:0] ForwardB    ;

logic        ForwardSrcA ;
logic        ForwardSrcB ;
wire         ForwardMem  ;

logic [31:0] A           ;
logic [31:0] B           ;

logic [31:0] BranchAddrE1 ;
logic [31:0] BranchAddrE2 ;
logic        BranchTakenE2;
logic        BranchTakenE1;

logic        BRASrcD     ;
logic        BRASrcE     ;

logic        MULSelBD    ;
logic        MULSelBE1   ;

logic [ 1:0] OutSelD     ;
logic [ 1:0] OutSelE1    ;

wire  [15:0] OffsetD     ;
logic [15:0] OffsetE1    ;

IF if0(
    .Clock      (Clock        ),
    .nReset     (nReset       ),
    .nStall     (nStall       ),
    .BranchTaken(BranchTakenE2),
    .BranchAddr (BranchAddrE2 ),
    .InstrMem   (InstrMem     ),
    .InstrAddr  (InstrAddr    ),
    .InstrOut   (InstructionF ),
    .PCAddrInc  (PCAddrInc    )
);

`PIPE(InstructionD, InstructionF            )
`PIPE(InstrAddrD  , InstrAddr & {16{nStall}})

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
    .Offset      (OffsetD            ),
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
    .ACCEn       (ACCEnD             ),
    .MULSelB     (MULSelBD           ),
    .OutSel      (OutSelD            ),
    .ALUfunc     (FuncD              ),
    .BrCode      (BrCodeD            ),
    .Memfunc     (MemfuncD           ),
    .Shamt       (ShamtD             )
);

`PIPE(ImmDataE1   , ImmDataD           )
`PIPE(OffsetE1    , OffsetD            )
`PIPE(RsAddrE1    , RsAddrD            )
`PIPE(RtAddrE1    , RtAddrD            )
`PIPE(RsDataE1    , RsDataD            )
`PIPE(RtDataE1    , RtDataD            )
`PIPE(InstrAddrE1 , {16'b0, InstrAddrD})
`PIPE(RAddrE1     , RAddrD             )
`PIPE(BranchE1    , BranchD            )
`PIPE(JumpE1      , JumpD              )
`PIPE(MemReadE1   , MemReadD           )
`PIPE(MemtoRegE1  , MemtoRegD          )
`PIPE(ALUOpE1     , ALUOpD             )
`PIPE(MULOpE1     , MULOpD             )
`PIPE(MemWriteE1  , MemWriteD          )
`PIPE(ALUSrcE1    , ALUSrcD            )
`PIPE(BRASrcE     , BRASrcD            )
`PIPE(RegWriteE1in, RegWriteD          )
`PIPE(ACCEnE1     , ACCEnD             )
`PIPE(MULSelBE1   , MULSelBD           )
`PIPE(OutSelE1    , OutSelD            )
`PIPE(FuncE1      , FuncD              )
`PIPE(BrCodeE1    , BrCodeD            )
`PIPE(MemfuncE1   , MemfuncD           )
`PIPE(ShamtE1     , ShamtD             )

logic [31:0] B_E1  ;
logic [31:0] B_E2  ;
logic [63:0] Out_E2;
wire  [31:0] MULOutE1;
logic [31:0] MULOutE2;

EX1 ex1(
    .ALUOp      (ALUOpE1      ),
    .MULOp      (MULOpE1      ),
    .Jump       (JumpE1       ),
    .Branch     (BranchE1     ),
    .RegWriteIn (RegWriteE1in ),
    .ALUSrc     (ALUSrcE1     ),
    .BRASrc     (BRASrcE      ),
    .MULSelB    (MULSelBE1    ),
    .OutSel     (OutSelE1     ),
    .A          (A            ),
    .B          (B            ),
    .Immediate  (ImmDataE1    ),
    .Offset     (OffsetE1     ),
    .PCin       (InstrAddrE1  ),
    .Shamt      (ShamtE1      ),
    .Func       (FuncE1       ),
    .BrCode     (BrCodeE1     ),
    .BrRt       (RtAddrE1[0]  ),
    .Out        (ALUDataE1    ),
    .MULOut     (MULOutE1     ),
    .PCout      (BranchAddrE1 ),
    .C          (ALUCE1       ),
    .Z          (ALUZE1       ),
    .O          (ALUOE1       ),
    .N          (ALUNE1       ),
    .RegWriteOut(RegWriteE1out),
    .BranchTaken(BranchTakenE1),
    .mB         (B_E1         )
);

`PIPE(MULOpE2      , MULOpE1      )
`PIPE(MULOpM       , MULOpE2      )
`PIPE(MULOutE2     , MULOutE1     )
`PIPE(BranchTakenE2, BranchTakenE1)
`PIPE(BranchAddrE2 , BranchAddrE1 )
`PIPE(RegWriteE2   , RegWriteE1out)
`PIPE(MemReadE2    , MemReadE1    )
`PIPE(MemtoRegE2   , MemtoRegE1   )
`PIPE(MemWriteE2   , MemWriteE1   )
`PIPE(MemfuncE2    , MemfuncE1    )
`PIPE(ALUCE2       , ALUCE1       )
`PIPE(ALUZE2       , ALUZE1       )
`PIPE(ALUOE2       , ALUOE1       )
`PIPE(ALUNE2       , ALUNE1       )
`PIPE(ACCEnE2      , ACCEnE1      )
`PIPE(RtDataE2     , B            )
`PIPE(ALUDataE2    , ALUDataE1    )
`PIPE(RAddrE2      , RAddrE1      )
`PIPE(FuncE2       , FuncE1       )
`PIPE(RtAddrE2     , RtAddrE1     )
`PIPE(B_E2         , B_E1         )

assign Out_E2 = MULOutE2 * B_E2;

logic [31:0] ALUDataM;
`PIPE(ALUDataM, ALUDataE2)

`PIPE(ALUDataMin, Out_E2    )
`PIPE(RtDataM   , RtDataE2  )
`PIPE(RAddrM    , RAddrE2   )
`PIPE(MemFuncM  , MemfuncE2 )
`PIPE(RegWriteM , RegWriteE2)
`PIPE(MemReadM  , MemReadE2 )
`PIPE(MemtoRegM , MemtoRegE2)
`PIPE(MemWriteM , MemWriteE2)
`PIPE(RtAddrM   , RtAddrE2  )
`PIPE(ALUCM     , ALUCE2    )
`PIPE(ALUZM     , ALUZE2    )
`PIPE(ALUOM     , ALUOE2    )
`PIPE(ALUNM     , ALUNE2    )
`PIPE(ACCEnM    , ACCEnE2   )
`PIPE(FuncM     , FuncE2    )

EX2 ex2(
    .Clock (Clock      ),
    .nReset(nReset     ),
    .ALUC  (ALUCM      ),
    .ALUZ  (ALUZM      ),
    .ALUO  (ALUOM      ),
    .ALUN  (ALUNM      ),
    .ACCEn (ACCEnM     ),
    .MULOp (MULOpM     ),
    .ALUIn (ALUDataM   ),
    .MULIn (ALUDataMin ),
    .Func  (FuncM      ),
    .Out   (ALUDataMout),
    .C     (           ),
    .Z     (           ),
    .O     (           ),
    .N     (           )
);

MEM mem0(
    .MemfuncIn   (MemFuncM ),
    .RtDataIn    (RtDataM  ),
    .WriteL      (WriteL   ),
    .WriteR      (WriteR   ),
    .MemWriteData(WriteData)
);

`PIPE(RegWriteW, RegWriteM  )
`PIPE(MemtoRegW, MemtoRegM  )
`PIPE(MemfuncW , MemFuncM   )
`PIPE(RAddrW   , RAddrM     )
`PIPE(ALUDataW , ALUDataMout)
`PIPE(RtDataW  , RtDataMout )

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
    .Memfunc    (MemFuncM   ),
    .RAddrE2    (RAddrE2    ),
    .RAddrM     (RAddrM     ),
    .RAddrW     (RAddrW     ),
    .RtAddrM    (RtAddrM    ),
    .RsAddrE1   (RsAddrE1   ),
    .RtAddrE1   (RtAddrE1   ),
    .RsAddrD    (RsAddrD    ),
    .RtAddrD    (RtAddrD    ),
    .ForwardSrcA(ForwardSrcA),
    .ForwardSrcB(ForwardSrcB),
    .ForwardMem (ForwardMem ),
    .ForwardA   (ForwardA   ),
    .ForwardB   (ForwardB   )
);

always_comb
case (ForwardA)
    0: A = RsDataE1       ;
    1: A = ALUDataE2[31:0];
    2: A = ALUDataMout    ;
    3: A = RDataW         ;
endcase

always_comb
case (ForwardB)
    0: B = RtDataE1       ;
    1: B = ALUDataE2[31:0];
    2: B = ALUDataMout    ;
    3: B = RDataW         ;
endcase

assign RsDataD    = ForwardSrcA ? RDataW : RsData ;
assign RtDataD    = ForwardSrcB ? RDataW : RtData ;
assign RtDataMout = ForwardMem  ? RDataW : RtDataM;

HDU hdu0(
    .MemReadE(MemReadE1),
    .Clock   (Clock    ),
    .RtAddrE (RtAddrE1 ),
    .RsAddrD (RsAddrD  ),
    .RtAddrD (RtAddrD  ),
    .nStall  (nStall   )
);

assign MemWrite = MemWriteM  ;
assign MemRead  = MemReadM   ;
assign MemAddr  = ALUDataMout;

endmodule
