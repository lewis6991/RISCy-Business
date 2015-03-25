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

logic JumpD        ;
logic JumpE1       ;

logic BranchD      ;
logic BranchE1     ;

logic ZeroBD       ;
logic ZeroBE1      ;

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

logic BranchTaken  ;

logic ALUCE1       ;
logic ALUCE2       ;
logic ALUZE1       ;
logic ALUZE2       ;
logic ALUOE1       ;
logic ALUOE2       ;
logic ALUNE1       ;
logic ALUNE2       ;

logic ACCEnE1      ;
logic ACCEnE2      ;

logic [31:0] InstructionF;
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

logic [5:0]  ALUfuncD    ;
logic [5:0]  ALUfuncE1   ;
logic [5:0]  ALUfuncE2   ;
wire  [2:0]  BrCodeD     ;
logic [2:0]  BrCodeE1    ;

wire  [5:0]  FuncD       ;
logic [5:0]  FuncE1      ;

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
logic [63:0] ALUDataE2in ;
wire  [31:0] ALUDataE2out;
logic [31:0] ALUDataM    ;
logic [31:0] ALUDataW    ;

logic [ 1:0] ForwardA    ;
logic [ 1:0] ForwardB    ;

logic        ForwardSrcA ;
logic        ForwardSrcB ;
wire         ForwardMem  ;

logic [31:0] A           ;
logic [31:0] B           ;

logic [31:0] BranchAddr  ;

logic        BRASrcD     ;
logic        BRASrcE     ;

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

always_ff @ (posedge Clock, negedge nReset)
begin
    InstructionD <= #1 ~nReset ? 0 : InstructionF;
    InstrAddrD   <= #1 ~nReset ? 0 : InstrAddr & {16{nStall}};
end

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
    .ZeroB       (ZeroBD             ),
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
    .BrCode      (BrCodeD            ),
    .Func        (FuncD              ),
    .Memfunc     (MemfuncD           ),
    .Shamt       (ShamtD             )
);

always_ff @ (posedge Clock, negedge nReset)
begin
    ImmDataE1   <= #1 ~nReset ? 0 : ImmDataD           ;
    RsAddrE1    <= #1 ~nReset ? 0 : RsAddrD            ;
    RtAddrE1    <= #1 ~nReset ? 0 : RtAddrD            ;
    RsDataE1    <= #1 ~nReset ? 0 : RsDataD            ;
    RtDataE1    <= #1 ~nReset ? 0 : RtDataD            ;
    InstrAddrE1 <= #1 ~nReset ? 0 : {16'b0, InstrAddrD};
    RAddrE1     <= #1 ~nReset ? 0 : RAddrD             ;
    BranchE1    <= #1 ~nReset ? 0 : BranchD            ;
    JumpE1      <= #1 ~nReset ? 0 : JumpD              ;
    MemReadE1   <= #1 ~nReset ? 0 : MemReadD           ;
    MemtoRegE1  <= #1 ~nReset ? 0 : MemtoRegD          ;
    ALUOpE1     <= #1 ~nReset ? 0 : ALUOpD             ;
    MULOpE1     <= #1 ~nReset ? 0 : MULOpD             ;
    MemWriteE1  <= #1 ~nReset ? 0 : MemWriteD          ;
    ALUSrcE1    <= #1 ~nReset ? 0 : ALUSrcD            ;
    BRASrcE     <= #1 ~nReset ? 0 : BRASrcD            ;
    RegWriteE1in<= #1 ~nReset ? 0 : RegWriteD          ;
    ALUfuncE1   <= #1 ~nReset ? 0 : ALUfuncD           ;
    BrCodeE1    <= #1 ~nReset ? 0 : BrCodeD            ;
    FuncE1      <= #1 ~nReset ? 0 : FuncD              ;
    MemfuncE1   <= #1 ~nReset ? 0 : MemfuncD           ;
    ShamtE1     <= #1 ~nReset ? 0 : ShamtD             ;
    ZeroBE1     <= #1 ~nReset ? 0 : ZeroBD             ;
end

EX1 ex1(
    .ALUOp      (ALUOpE1      ),
    .MULOp      (MULOpE1      ),
    .Jump       (JumpE1       ),
    .Branch     (BranchE1     ),
    .ZeroB      (ZeroBE1      ),
    .RegWriteIn (RegWriteE1in ),
    .MemWriteIn (MemWriteE1   ),
    .ALUSrc     (ALUSrcE1     ),
    .BRASrc     (BRASrcE      ),
    .A          (A            ),
    .B          (B            ),
    .Immediate  (ImmDataE1    ),
    .PCin       (InstrAddrE1  ),
    .Shamt      (ShamtE1      ),
    .ALUFunc    (ALUfuncE1    ),
    .Func       (FuncE1       ),
    .BrCode     (BrCodeE1     ),
    .BrRt       (RtAddrE1[0]  ),
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

always_ff @ (posedge Clock, negedge nReset)
begin
    RegWriteE2  <= #1 ~nReset ? 0 : RegWriteE1out;
    MemReadE2   <= #1 ~nReset ? 0 : MemReadE1    ;
    MemtoRegE2  <= #1 ~nReset ? 0 : MemtoRegE1   ;
    MemWriteE2  <= #1 ~nReset ? 0 : MemWriteE1   ;
    MemfuncE2   <= #1 ~nReset ? 0 : MemfuncE1    ;
    ALUCE2      <= #1 ~nReset ? 0 : ALUCE1       ;
    ALUZE2      <= #1 ~nReset ? 0 : ALUZE1       ;
    ALUOE2      <= #1 ~nReset ? 0 : ALUOE1       ;
    ALUNE2      <= #1 ~nReset ? 0 : ALUNE1       ;
    ACCEnE2     <= #1 ~nReset ? 0 : ACCEnE1      ;
    RtDataE2    <= #1 ~nReset ? 0 : B            ;
    ALUDataE2in <= #1 ~nReset ? 0 : ALUDataE1    ;
    RAddrE2     <= #1 ~nReset ? 0 : RAddrE1      ;
    ALUfuncE2   <= #1 ~nReset ? 0 : ALUfuncE1    ;
    RtAddrE2    <= #1 ~nReset ? 0 : RtAddrE1    ;
end

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

always_ff @ (posedge Clock, negedge nReset)
begin
    ALUDataM  <= #1 ~nReset ? 0 : ALUDataE2out;
    RtDataM   <= #1 ~nReset ? 0 : RtDataE2    ;
    RAddrM    <= #1 ~nReset ? 0 : RAddrE2     ;
    MemFuncM  <= #1 ~nReset ? 0 : MemfuncE2   ;
    RegWriteM <= #1 ~nReset ? 0 : RegWriteE2  ;
    MemReadM  <= #1 ~nReset ? 0 : MemReadE2   ;
    MemtoRegM <= #1 ~nReset ? 0 : MemtoRegE2  ;
    MemWriteM <= #1 ~nReset ? 0 : MemWriteE2  ;
    RtAddrM   <= #1 ~nReset ? 0 : RtAddrE2    ;
end

MEM mem0(
    .MemfuncIn   (MemFuncM ),
    .RtDataIn    (RtDataM  ),
    .WriteL      (WriteL   ),
    .WriteR      (WriteR   ),
    .MemWriteData(WriteData)
);

always_ff @ (posedge Clock, negedge nReset)
begin
    RegWriteW <= #1 ~nReset ? 0 : RegWriteM;
    MemtoRegW <= #1 ~nReset ? 0 : MemtoRegM;
    MemfuncW  <= #1 ~nReset ? 0 : MemFuncM ;
    RAddrW    <= #1 ~nReset ? 0 : RAddrM   ;
    ALUDataW  <= #1 ~nReset ? 0 : ALUDataM ;
    RtDataW   <= #1 ~nReset ? 0 : RtDataMout  ;
end

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
    0: A = RsDataE1;
    1: A = ALUDataE2in[31:0];
    2: A = ALUDataM;
    3: A = RDataW;
endcase

always_comb
case (ForwardB)
    0: B = RtDataE1;
    1: B = ALUDataE2in[31:0];
    2: B = ALUDataM;
    3: B = RDataW;
endcase

assign RsDataD    = ForwardSrcA ? RDataW : RsData ;
assign RtDataD    = ForwardSrcB ? RDataW : RtData ;
assign RtDataMout = ForwardMem  ? RDataW : RtDataM;

HDU hdu0(
    .MemReadE(MemReadE1), //Not sure
    .Clock   (Clock    ),
    .RtAddrE (RtAddrE1 ),
    .RsAddrD (RsAddrD  ),
    .RtAddrD (RtAddrD  ),
    .nStall  (nStall   )
);

assign MemWrite = MemWriteM;
assign MemRead  = MemReadM ;
assign MemAddr  = ALUDataM ;

endmodule
