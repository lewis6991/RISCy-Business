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
`ifdef scan
                        test_si  ,
                        test_se  ,
`endif
    input        [31:0] InstrMem ,
                        MemData  ,
    output logic [31:0] WriteData,
    output logic [15:0] InstrAddr,
                        MemAddr  ,
`ifndef no_check
    input        [ 4:0] RegAddr  ,
    output logic [31:0] RegData  ,
`endif
    output logic        MemWrite ,
                        MemRead  ,
                        WriteL   ,
                        WriteR   ,
                        JBFlush  ,
                        nStall
);

logic Stall2      ;
logic Stall1      ;
logic Flush       ;
logic Flush1      ;
logic Flush2      ;

logic JumpD        ;
logic JumpE1       ;

logic BranchD      ;
logic BranchE1     ;
logic BranchE2     ;

logic MemReadIF    ;
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
logic RegWriteE1   ;
logic RegWriteE1Out;
logic RegWriteE2   ;
logic RegWriteE2Out;
logic RegWriteM    ;
logic RegWriteW    ;

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

logic ALUEnD       ;
logic ALUEnE1      ;
logic ALUEnE2      ;

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
logic [31:0] RsDataIn    ;
logic [31:0] RsDataD     ;
logic [31:0] RsDataE1    ;
logic [31:0] RsDataE2    ;

logic [31:0] RtData      ;
logic [31:0] RtDataIn    ;
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
logic [2:0]  BrCodeE2    ;

logic [2:0]  MemfuncD    ;
logic [2:0]  MemfuncE1   ;
logic [2:0]  MemfuncE2   ;
logic [2:0]  MemFuncM    ;
logic [2:0]  MemfuncW    ;

logic [4:0]  ShamtD      ;
logic [4:0]  ShamtE1     ;

logic [15:0] InstrAddrD  ;
logic [31:0] InstrAddrE1 ;
logic [31:0] InstrAddrE2 ;

logic [31:0] ALUDataE1   ;
logic [31:0] ALUDataE1Out;
logic [31:0] ALUDataE2   ;
logic [31:0] ALUDataE2Out;
logic [31:0] ALUDataM    ;
logic [63:0] MULDataM    ;
wire  [31:0] ALUDataMOut ;
logic [31:0] ALUDataW    ;

wire  [31:0] CLDataE1    ;
logic [31:0] CLDataE2    ;

logic [ 1:0] ForwardA    ;
logic [ 1:0] ForwardB    ;

logic        ForwardSrcA ;
logic        ForwardSrcB ;
wire         ForwardMem  ;

logic [31:0] A           ;
logic [31:0] B           ;

logic [31:0] BranchAddrIF    ;
logic [31:0] BranchAddrD     ;
logic [31:0] BranchAddrE1    ;
logic [31:0] BranchAddrE1Out ;
logic [31:0] BranchAddrE2    ;

logic        BranchTakenE2   ;

logic        RegJumpD        ;
logic        RegJumpE1       ;

logic        MULSelBD        ;
logic        MULSelBE1       ;
logic        MULSelBE2       ;

logic [ 1:0] OutSelD         ;
logic [ 1:0] OutSelE1        ;
logic [ 1:0] OutSelE2        ;

wire  [15:0] OffsetD         ;
logic [15:0] OffsetE1        ;
logic [15:0] OffsetE2        ;

//wire  [31:0] SubOut0_E1      ;
//wire  [31:0] SubOut1_E1      ;
//wire  [31:0] SubOut2_E1      ;
//wire  [31:0] SubOut3_E1      ;
//logic [31:0] SubOut0_E2      ;
//logic [31:0] SubOut1_E2      ;
//logic [31:0] SubOut2_E2      ;
//logic [31:0] SubOut3_E2      ;

wire  [15:0] SubOut0_E1      ;
wire  [15:0] SubOut1_E1      ;
wire  [15:0] SubOut2_E1      ;
wire  [15:0] SubOut3_E1      ;
wire  [15:0] SubOut4_E1      ;
wire  [15:0] SubOut5_E1      ;
wire  [15:0] SubOut6_E1      ;
wire  [15:0] SubOut7_E1      ;
wire  [15:0] SubOut8_E1      ;
wire  [15:0] SubOut9_E1      ;
wire  [15:0] SubOut10_E1     ;
wire  [15:0] SubOut11_E1     ;
wire  [15:0] SubOut12_E1     ;
wire  [15:0] SubOut13_E1     ;
wire  [15:0] SubOut14_E1     ;
wire  [15:0] SubOut15_E1     ;

logic [15:0] SubOut0_E2      ;
logic [15:0] SubOut1_E2      ;
logic [15:0] SubOut2_E2      ;
logic [15:0] SubOut3_E2      ;
logic [15:0] SubOut4_E2      ;
logic [15:0] SubOut5_E2      ;
logic [15:0] SubOut6_E2      ;
logic [15:0] SubOut7_E2      ;
logic [15:0] SubOut8_E2      ;
logic [15:0] SubOut9_E2      ;
logic [15:0] SubOut10_E2     ;
logic [15:0] SubOut11_E2     ;
logic [15:0] SubOut12_E2     ;
logic [15:0] SubOut13_E2     ;
logic [15:0] SubOut14_E2     ;
logic [15:0] SubOut15_E2     ;

wire brTakenE2;
logic JBFlush1;
logic JBFlush2;
logic JBFlush_Temp;

logic MRStall;
logic MRStall1;
logic MRStall2;
logic MRStall3;
logic MRStall4;

assign MRStall1 = MemReadD & ~JBFlush_Temp;

`PIPE(MRStall2, MRStall1)
`PIPE(MRStall3, MRStall2)
`PIPE(MRStall4, MRStall3)

assign MRStall = MRStall1 || MRStall2 || MRStall3 || MRStall4;

assign nStall = (~Stall1 & ~Stall2 & ~MRStall);

assign JBFlush = JBFlush1 | JBFlush2;
assign JBFlush_Temp = JBFlush1 | JBFlush2;

assign Flush = (~Flush1 & ~Flush2);

`PIPE(Flush2, Flush1)
`PIPE(JBFlush2, JBFlush1)

IF if0(
    .Clock        (Clock          ),
    .nReset       (nReset         ),
    .nStall       (nStall         ),
    .BranchTaken  (BranchD        ),
    .Jump         (JumpE1         ),
    .RevBranchAddr(InstrAddrE2    ),
    .RevBranch    (Flush1         ),
    .BranchAddr   (BranchAddrD    ),
    .JumpAddr     (BranchAddrE1Out),
    .InstrMem     (InstrMem       ),
    .InstrAddr    (InstrAddr      ),
    .InstrOut     (InstructionF   )
);

addrcalc addrcalc0(
    .PCIn   ({16'b0, InstrAddrD}         ),
    .BrCode (BrCodeD                     ),
    .Address({{16{OffsetD[15]}}, OffsetD}),
    .PCout  (BranchAddrD                 )
);

`PIPE(Stall2, Stall1)

logic nStall2;

`PIPE(nStall2, nStall)

`PIPE(InstructionD, InstructionF & {32{Flush}} & ~{32{JBFlush}} & {32{nStall2}})

`PIPE(InstrAddrD  , InstrAddr   )

DEC dec0(
    .Clock      (Clock              ),
    .nReset     (nReset             ),
`ifndef no_check
    .RegAddr    (RegAddr            ),
    .RegData    (RegData            ),
`endif
    .RegWriteIn (RegWriteW          ),
    .Instruction(InstructionD       ),
    .RData      (RDataW             ),
    .RAddrIn    (RAddrW             ),
    .ImmData    (ImmDataD           ),
    .Offset     (OffsetD            ),
    .RsData     (RsData             ),
    .RtData     (RtData             ),
    .RAddrOut   (RAddrD             ),
    .Branch     (BranchD            ),
    .Jump       (JumpD              ),
    .MemRead    (MemReadD           ),
    .MemtoReg   (MemtoRegD          ),
    .MULOp      (MULOpD             ),
    .MemWrite   (MemWriteD          ),
    .ALUSrc     (ALUSrcD            ),
    .RegJump    (RegJumpD           ),
    .RegWriteOut(RegWriteD          ),
    .ACCEn      (ACCEnD             ),
    .ALUEn      (ALUEnD             ),
    .MULSelB    (MULSelBD           ),
    .OutSel     (OutSelD            ),
    .ALUfunc    (FuncD              ),
    .Memfunc    (MemfuncD           ),
    .RsAddr     (RsAddrD            ),
    .RtAddr     (RtAddrD            ),
    .BrCode     (BrCodeD            ),
    .Shamt      (ShamtD             )
);

logic [5:0] MULFuncE1;

`PIPE(ImmDataE1   , ImmDataD           )
`PIPE(MULFuncE1   , InstructionD[5:0]  )
`PIPE(OffsetE1    , OffsetD            )
`PIPE(RsAddrE1    , RsAddrD            )
`PIPE(RtAddrE1    , RtAddrD            )
`PIPE(RsDataE1    , RsDataIn           )
`PIPE(RtDataE1    , RtDataIn           )
`PIPE(InstrAddrE1 , {16'b0, InstrAddrD})
`PIPE(RAddrE1     , RAddrD             )
`PIPE(BranchE1    , BranchD            )
`PIPE(JumpE1      , JumpD              )
`PIPE(MemReadE1   , MemReadD           )
`PIPE(MemtoRegE1  , MemtoRegD          )
`PIPE(MULOpE1     , MULOpD             )
`PIPE(MemWriteE1  , MemWriteD          )
`PIPE(ALUSrcE1    , ALUSrcD            )
`PIPE(RegJumpE1   , RegJumpD           )
`PIPE(RegWriteE1  , RegWriteD          )
`PIPE(ACCEnE1     , ACCEnD             )
`PIPE(ALUEnE1     , ALUEnD             )
`PIPE(MULSelBE1   , MULSelBD           )
`PIPE(OutSelE1    , OutSelD            )
`PIPE(FuncE1      , FuncD              )
`PIPE(BrCodeE1    , BrCodeD            )
`PIPE(MemfuncE1   , MemfuncD           )
`PIPE(ShamtE1     , ShamtD             )
`PIPE(BranchAddrE1, BranchAddrD        )

logic [63:0] MULDataE2;
wire  [31:0] MULOutE1;

EX1 ex1(
    .MULSelB(MULSelBE1                      ),
    .A      (RsDataE1                       ),
    .B      (ALUSrcE1 ? ImmDataE1 : RtDataE1),
    .Shamt  (ShamtE1                        ),
    .Func   (FuncE1                         ),
    .ALUOut (ALUDataE1                      ),
    .MULOut (CLDataE1                       ),
    .C      (ALUCE1                         ),
    .Z      (ALUZE1                         ),
    .O      (ALUOE1                         ),
    .N      (ALUNE1                         )
);

assign BranchAddrE1Out = RegJumpE1 ? RsDataE1 : BranchAddrE1;

mult1 mult0(
    .A       (RsDataE1   ),
    .B       (RtDataE1   ),
    .SubOut0 (SubOut0_E1 ),
    .SubOut1 (SubOut1_E1 ),
    .SubOut2 (SubOut2_E1 ),
    .SubOut3 (SubOut3_E1 ),
    .SubOut4 (SubOut4_E1 ),
    .SubOut5 (SubOut5_E1 ),
    .SubOut6 (SubOut6_E1 ),
    .SubOut7 (SubOut7_E1 ),
    .SubOut8 (SubOut8_E1 ),
    .SubOut9 (SubOut9_E1 ),
    .SubOut10(SubOut10_E1),
    .SubOut11(SubOut11_E1),
    .SubOut12(SubOut12_E1),
    .SubOut13(SubOut13_E1),
    .SubOut14(SubOut14_E1),
    .SubOut15(SubOut15_E1)
);

always_comb
    if(FuncE1 == `MOVN && ALUEnE1)
        RegWriteE1Out = (RtDataE1 != 0);
    else if(FuncE1 == `MOVZ && ALUEnE1)
        RegWriteE1Out = (RtDataE1 == 0);
    else
        RegWriteE1Out = RegWriteE1;

assign ALUDataE1Out = OutSelE1[0] ? InstrAddrE1 + 8 : ALUDataE1;

`PIPE(MULSelBE2   , MULSelBE1            )
`PIPE(CLDataE2    , CLDataE1             )
`PIPE(MULOpE2     , MULOpE1              )
`PIPE(MULOpM      , MULOpE2              )
`PIPE(RegWriteE2  , RegWriteE1Out )
`PIPE(MemReadE2   , MemReadE1            )
`PIPE(MemtoRegE2  , MemtoRegE1           )
`PIPE(MemWriteE2  , MemWriteE1    )
`PIPE(MemfuncE2   , MemfuncE1            )
`PIPE(ALUCE2      , ALUCE1               )
`PIPE(ALUZE2      , ALUZE1               )
`PIPE(ALUOE2      , ALUOE1               )
`PIPE(ALUNE2      , ALUNE1               )
`PIPE(ACCEnE2     , ACCEnE1       )
`PIPE(RsDataE2    , RsDataE1             )
`PIPE(RtDataE2    , RtDataE1             )
`PIPE(ALUDataE2   , ALUDataE1Out         )
`PIPE(RAddrE2     , RAddrE1              )
`PIPE(ALUEnE2     , ALUEnE1              )
`PIPE(FuncE2      , FuncE1               )
`PIPE(RtAddrE2    , RtAddrE1             )
`PIPE(OffsetE2    , OffsetE1             )
`PIPE(InstrAddrE2 , InstrAddrE1          )
`PIPE(BrCodeE2    , BrCodeE1             )
`PIPE(OutSelE2    , OutSelE1             )
`PIPE(BranchE2    , BranchE1             )
`PIPE(SubOut0_E2  , SubOut0_E1           )
`PIPE(SubOut1_E2  , SubOut1_E1           )
`PIPE(SubOut2_E2  , SubOut2_E1           )
`PIPE(SubOut3_E2  , SubOut3_E1           )
`PIPE(BranchAddrE2, BranchAddrE1Out      )

always_comb
case (FuncE2)
    `CLO, `CLZ: MULDataE2 = CLDataE2;
    default   :
        if (MULSelBE2)
            // Shift and Add sub results from the multipliers.
//            MULDataE2 = (SubOut0_E2 << 32)
//                      + ((SubOut1_E2 + SubOut2_E2) << 16)
//                      +  SubOut3_E2;
            MULDataE2 = (SubOut0_E2                                    << 48)
             + ((SubOut1_E2  + SubOut4_E2                            ) << 40)
             + ((SubOut2_E2  + SubOut5_E2  + SubOut8_E2              ) << 32)
             + ((SubOut3_E2  + SubOut6_E2  + SubOut9_E2 + SubOut12_E2) << 24)
             + ((SubOut7_E2  + SubOut10_E2 + SubOut13_E2             ) << 16)
             + ((SubOut11_E2 + SubOut14_E2                           ) << 8 )
             +   SubOut15_E2;
        else
            MULDataE2 = RsDataE2;
endcase

// Branch stuff ----------------------------------

branch branch0(
    .C     (ALUCE2     ),
    .Z     (ALUZE2     ),
    .O     (ALUOE2     ),
    .N     (ALUNE2     ),
    .BrCode(BrCodeE2   ),
    .BrRt  (RtAddrE2[0]),
    .Taken (brTakenE2  )
);

assign BranchTakenE2 = BranchE2 & brTakenE2;

assign ALUDataE2Out = OutSelE2[1] ? RsDataE2 : ALUDataE2;

assign RegWriteE2Out = BranchE2 ? RegWriteE2 & brTakenE2 : RegWriteE2;
// ------------------------------------------------

logic [31:0] RtDataE2out;

`PIPE(ALUDataM , ALUDataE2Out         )
`PIPE(MULDataM , MULDataE2            )
`PIPE(RtDataM  , RtDataE2out          )
`PIPE(RAddrM   , RAddrE2              )
`PIPE(MemFuncM , MemfuncE2            )
`PIPE(RegWriteM, RegWriteE2Out )
`PIPE(MemReadM , MemReadE2            )
`PIPE(MemtoRegM, MemtoRegE2           )
`PIPE(MemWriteM, MemWriteE2    )
`PIPE(RtAddrM  , RtAddrE2             )
`PIPE(ALUCM    , ALUCE2               )
`PIPE(ALUZM    , ALUZE2               )
`PIPE(ALUOM    , ALUOE2               )
`PIPE(ALUNM    , ALUNE2               )
`PIPE(ACCEnM   , ACCEnE2       )
`PIPE(FuncM    , FuncE2               )

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
    .MULIn (MULDataM   ),
    .Func  (FuncM      ),
    .Out   (ALUDataMOut),
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
`PIPE(ALUDataW , ALUDataMOut)
`PIPE(RtDataW  , RtDataMout )

WB wb0(
    .MemtoReg(MemtoRegW),
    .ALUData (ALUDataW ),
    .RtData  (RtDataW  ),
    .MemData (MemData  ),
    .Memfunc (MemfuncW ),
    .WBData  (RDataW   )
);

logic ForwardMem2;

FU fu0(
    .RegWriteE2 (RegWriteE2   ),
    .RegWriteE1 (RegWriteE1Out),
    .RegWriteM  (RegWriteM    ),
    .RegWriteW  (RegWriteW    ),
    .MemWriteE2 (MemWriteE2   ),
    .Memfunc    (MemFuncM     ),
    .RAddrE2    (RAddrE2      ),
    .RAddrE1    (RAddrE1      ),
    .RAddrM     (RAddrM       ),
    .RAddrW     (RAddrW       ),
    .RtAddrM    (RtAddrM      ),
    .RsAddrE1   (RsAddrE1     ),
    .RtAddrE1   (RtAddrE1     ),
    .RtAddrE2   (RtAddrE2     ),
    .RsAddrD    (RsAddrD      ),
    .RtAddrD    (RtAddrD      ),
    .ForwardSrcA(ForwardSrcA  ),
    .ForwardSrcB(ForwardSrcB  ),
    .ForwardMem1(ForwardMem1  ),
    .ForwardMem2(ForwardMem2  ),
    .ForwardA   (ForwardA     ),
    .ForwardB   (ForwardB     )
);

always_comb
case (ForwardA)
    0: RsDataIn = RsDataD     ;
    1: RsDataIn = ALUDataE1Out;
    2: RsDataIn = ALUDataE2Out;
    3: RsDataIn = ALUDataMOut ;
endcase

always_comb
case (ForwardB)
    0: RtDataIn = RtDataD     ;
    1: RtDataIn = ALUDataE1Out;
    2: RtDataIn = ALUDataE2Out;
    3: RtDataIn = ALUDataMOut ;
endcase

assign RsDataD    = ForwardSrcA ? RDataW  : RsData  ;
assign RtDataD    = ForwardSrcB ? RDataW  : RtData  ;
assign RtDataMout = ForwardMem1 ? RDataW  : RtDataM ;
assign RtDataE2out= ForwardMem2 ? ALUDataM: RtDataE2;

HDU hdu0(
    .MULOp   (MULOpD           ),
    .ALUOp   (ALUEnD           ),
    .Func    (InstructionD[5:0]),
    .Stall   (Stall1           )
);

assign Flush1   = ~brTakenE2 & BranchE2;
assign JBFlush1 = BranchD || JumpD     ;

assign MemWrite = MemWriteM  ;
assign MemRead  = MemReadM   ;
assign MemAddr  = ALUDataMOut;

endmodule
