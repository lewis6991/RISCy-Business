//------------------------------------------------------------------------------
// File              : EX1.sv
// Description       : First stage of Execute stage logic
// Primary Author    : Ethan Bishop
// Other Contributors: Lewis Russell, Dhanushan Raveendran
// Notes             :
//------------------------------------------------------------------------------

module EX1(
    input               ALUOp      ,
                        MULOp      ,
                        Jump       ,
                        Branch     ,
                        RegWriteIn ,
                        MemWriteIn ,
                        ALUSrc     ,
                        BRASrc     ,
                        MULSelB    ,
    input        [31:0] A          , // ALU Input A.
                        B          , // ALU Input B.
                        Immediate  , // Immediate from Decode stage.
                        PCin       , // Program counter input.
    input        [15:0] Offset     , // Offset from decode stage.
    input        [ 4:0] Shamt      , // Shift amount.
    input        [ 5:0] Func       ,
    input        [ 2:0] BrCode     , // 3 LSB of OpCode used to differentiate branch and jump instructions.
    input        [ 1:0] OutSel     , // 00: ALU, 01: BRA, 10: MUL
    input               BrRt       , // LSB of Rt used for branch instructions.
    output logic [63:0] Out        ,
    output logic [31:0] MULOut     ,
    output logic [31:0] PCout      , // Program counter output.
                        mB         ,
    output logic        C          , // Carry out flag.
                        Z          , // Output zero flag.
                        O          , // Overflow flag.
                        N          , // Output negative flag.
                        RegWriteOut,
                        BranchTaken
);

    wire [31:0] Y      ;

    wire [31:0] ALUout ;
    wire [31:0] brAddr ;
    wire [31:0] BRAret ;

    wire ALUC, ALUZ, ALUO, ALUN;
    wire MULC, MULZ, MULO, MULN;

    wire brTaken ;

    alu alu0(
        .A    (A     ),
        .B    (Y     ),
        .Shamt(Shamt ),
        .Func (Func  ),
        .Out  (ALUout),
        .C    (ALUC  ),
        .Z    (ALUZ  ),
        .O    (ALUO  ),
        .N    (ALUN  )
    );

    branch branch0(
        .C      (ALUC   ),
        .Z      (ALUZ   ),
        .O      (ALUO   ),
        .N      (ALUN   ),
        .PCIn   (PCin   ), // Program counter input.
        .Address(brAddr ), // Address input
        .BrCode (BrCode ),
        .BrRt   (BrRt   ),
        .PCout  (PCout  ), // Program counter
        .Ret    (BRAret ), // Return address
        .Taken  (brTaken)  // Branch taken
    );

    ex_mult ex_mult0(
        .A   (A      ),
        .B   (Y      ),
        .SelB(MULSelB), // MUL module select
        .C   (MULC   ),
        .Z   (MULZ   ),
        .O   (MULO   ),
        .N   (MULN   ),
        .Func(Func   ),
        .Out (MULOut ),
        .mB  (mB     )
    );

    assign brAddr = BRASrc ? Offset    : A;
    assign Y      = ALUSrc ? Immediate : B;

    assign RegWriteOut = Branch ? RegWriteIn & brTaken : RegWriteIn;

    assign BranchTaken = Jump | Branch & brTaken ;

    assign Out = OutSel[1] ? MULOut :
                 OutSel[0] ? BRAret : ALUout;

    assign {C, Z, O, N} = OutSel[1] ? {MULC, MULZ, MULO, MULN} :
                          OutSel[0] ? 1'd0 : {ALUC, ALUZ, ALUO, ALUN};

endmodule
