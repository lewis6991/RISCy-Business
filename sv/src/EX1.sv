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
                        ZeroB      ,
                        RegWriteIn ,
                        MemWriteIn ,
                        ALUSrc     ,
                        BRASrc     ,
    input        [31:0] A          , // ALU Input A.
                        B          , // ALU Input B.
                        Immediate  , // Immediate from Decode stage.
                        PCin       , // Program counter input.
    input        [ 4:0] Shamt      , // Shift amount.
    input        [ 5:0] Func       ,
    input        [ 5:0] ALUFunc    ,
    input        [ 2:0] BrCode     , // 3 LSB of OpCode used to differentiate branch and jump instructions.
    input               BrRt       , // LSB of Rt used for branch instructions.
    output logic [63:0] Out        ,
    output logic [31:0] PCout      , // Program counter output.
    output logic        C          , // Carry out flag.
                        Z          , // Output zero flag.
                        O          , // Overflow flag.
                        N          , // Output negative flag.
                        RegWriteOut,
                        BranchTaken,
                        ACCEn
);

    wire [31:0] Y      ;
    wire [63:0] Out1   ;

    wire [ 1:0] OutSel;

    wire [31:0] ALUout ;
    wire [63:0] MULout ;
    wire [31:0] BRAAddr;
    wire [31:0] BRAret ;

    wire ALUC, ALUZ, ALUO, ALUN;
    wire MULC, MULZ, MULO, MULN;

    wire MULSelB;
    wire ALUEn;
    wire BRAEn;
    wire BRAtaken;

    always @ (ALUFunc)
        $display("DEBUG: Func = %6b, ALUFunc = %6b", Func, ALUFunc);

    alu alu0 (
        .A       (A      ),
        .B       (Y      ),
        .Shamt   (Shamt  ),
        .ALUfunc (ALUFunc),
        .Out     (ALUout ),
        .En      (ALUEn  ),
        .C       (ALUC   ),
        .Z       (ALUZ   ),
        .O       (ALUO   ),
        .N       (ALUN   )
    );

    branch branch0(
        .Enable (BRAEn   ), // Enable branch module
        .ALUC   (ALUC    ),
        .ALUZ   (ALUZ    ),
        .ALUO   (ALUO    ),
        .ALUN   (ALUN    ),
        .PCIn   (PCin    ), // Program counter input.
        .Address(BRAAddr ), // Address input
        .BrCode (BrCode  ),
        .BrRt   (BrRt    ),
        .PCout  (PCout   ), // Program counter
        .Ret    (BRAret  ), // Return address
        .Taken  (BRAtaken)  // Branch taken
    );

    ex_mult ex_mult0 (
        .A   (A      ),
        .B   (Y      ),
        .SelB(MULSelB), // MUL module select
        .C   (MULC   ),
        .Z   (MULZ   ),
        .O   (MULO   ),
        .N   (MULN   ),
        .Func(Func   ),
        .Out (MULout )
    );

    assign BRAAddr = BRASrc ? Immediate : A;
    assign Y       = ZeroB ? 32'd0 : ALUSrc ? Immediate : B;

    ex_control ex_control0 (
        .ALUOp       (ALUOp      ),
        .MULOp       (MULOp      ),
        .Jump        (Jump       ),
        .Branch      (Branch     ),
        .RegWriteIn  (RegWriteIn ),
        .BRAtaken    (BRAtaken   ),
        .ALUEn       (ALUEn      ),
        .MemWrite    (MemWriteIn ),
        .Func        (ALUFunc    ),
        .ACCEn       (ACCEn      ),
        .MULSelB     (MULSelB    ), // MUL module select
        .RegWriteOut (RegWriteOut),
        .BRAEn       (BRAEn      ),
        .BranchTaken (BranchTaken),
        .OutSel      (OutSel     )  // OutSel = 00: ALU
                                    //          01: BRA
                                    //          10: MUL
    );

    assign Out = OutSel[1] ? MULout :
                 OutSel[0] ? BRAret : ALUout;

    assign {C, Z, O, N} = OutSel[1] ? {MULC, MULZ, MULO, MULN} :
                          OutSel[0] ? 1'd0 : {ALUC, ALUZ, ALUO, ALUN};

endmodule
