//------------------------------------------------------------------------------
// File              : EX1.sv
// Description       : First stage of Execute stage logic
// Primary Author    : Ethan Bishop
// Other Contributors: Lewis Russell, Dhanushan Raveendran
// Notes             :
//------------------------------------------------------------------------------

module EX1(
    input               Clock      ,
                        nReset     ,
                        ALUOp      ,
                        MULOp      ,
                        Jump       ,
                        Branch     ,
                        RegWriteIn ,
                        MemReadIn  ,
                        MemtoRegIn ,
                        MemWriteIn ,
                        ALUSrc     ,
    input        [31:0] A          , // ALU Input A.
                        B          , // ALU Input B.
                        Immediate  , // Immediate from Decode stage.
                        PCin       , // Program counter input.
    input        [ 4:0] Shamt      , // Shift amount.
    input        [ 4:0] RAddrIn    ,
    input        [ 5:0] Func       ,
    output logic [63:0] Out        ,
    input        [ 2:0] MemfuncIn  ,
                        RtDataOut  ,
                        PCout      ,  // Program counter output.
    output logic [ 4:0] RAddrOut   ,
    output logic [ 2:0] MemfuncOut ,
    output logic        C          , // Carry out flag.
                        Z          , // Output zero flag.
                        O          , // Overflow flag.
                        N          , // Output negative flag.
                        RegWriteOut,
                        MemReadOut ,
                        MemtoRegOut,
                        MemWriteOut,
                        BranchTaken,
                        ACCEn
);

    wire [31:0] Y      ;
    wire [63:0] Out1   ;

    wire [ 1:0] OutSel;

    wire [31:0] ALUout;
    wire [63:0] MULout;
    wire [31:0] BRAret;

    wire ALUC, ALUZ, ALUO, ALUN;
    wire MULC, MULZ, MULO, MULN;
    wire C1  , Z1  , O1  , N1;
    
    wire MULSelB;
    wire ALUEn;
    wire BRAEn;
    wire BRAtaken;

    alu alu0 (
        .A       (A      ),
        .B       (Y      ),
        .Shamt   (Shamt  ),
        .ALUfunc (Func   ),
        .Out     (ALUout ),
        .En      (ALUEn  ),
        .C       (ALUC   ),
        .Z       (ALUZ   ),
        .O       (ALUO   ),
        .N       (ALUN   )
    );

    branch branch0 (
        .Enable (BRAEn    ), // Enable branch module
        .PCIn   (PCin     ), // Program counter input.
        .A      (A        ), // ALU input A
        .B      (B        ), // ALU input B
        .Address(Immediate), // Address input
        .Func   (Func     ), 
        .PCout  (PCout    ), // Program counter
        .Ret    (BRAret   ), // Return address
        .Taken  (BRAtaken )  // Branch taken
    );

    ex_mult ex_mult0 (
        .A   (A      ),
        .B   (Y      ),
        .SelB(MULSelB), // MUL module select
        .C   (MULC   ),
        .Z   (MULZ   ),
        .O   (MULO   ),
        .N   (MULN   ),
        .Out (MULout )
    );

    mux mux3 (
        .A  (B        ),
        .B  (Immediate),
        .Y  (Y        ),
        .Sel(ALUSrc   )
    );

    ex_control ex_control0 (
        .ALUOp       (ALUOp      ),
        .MULOp       (MULOp      ),
        .Jump        (Jump       ),
        .Branch      (Branch     ),
        .RegWriteIn  (RegWriteIn ),
        .BRAtaken    (BRAtaken   ),
        .ALUEn       (ALUEn      ),
        .Func        (Func       ),
        .ACCEn       (ACCEn      ),
        .MULSelB     (MULSelB    ), // MUL module select
        .RegWriteOut (RegWriteOut),
        .BRAEn       (BRAEn      ),
        .BranchTaken (BranchTaken),
        .OutSel      (OutSel     )  // OutSel = 00: ALU
                                    //          01: BRA
                                    //          10: MUL
    );

    mux mux4(
        .A  ({16'b0, ALUout}),
        .B  ({16'b0, BRAret}),
        .Y  (Out1           ),
        .Sel(OutSel[1]      )
    );

    mux mux5(
        .A  (Out1     ),
        .B  (MULout   ),
        .Y  (Out      ),
        .Sel(OutSel[0])
    );
    
    mux #(.n(4)) mux6(
        .A  ({ALUC, ALUZ, ALUO, ALUN}),
        .B  (4'b0                    ),
        .Y  ({C1  , Z1  , O1  , N1  }),
        .Sel(OutSel[1])
    );
    
    mux #(.n(4)) mux7(
        .A  ({C1  , Z1  , O1  , N1  }),
        .B  ({MULC, MULZ, MULO, MULN}),
        .Y  ({C   , Z   , O   , N   }),
        .Sel(OutSel[0])
    );
    
    assign MemReadOut  = MemReadIn;
    assign MemtoRegOut = MemtoRegIn;
    assign MemWriteOut = MemWriteIn;
    assign RAddrOut    = RAddrIn   ;
    assign RtDataOut   = B         ;
    assign MemfuncOut  = MemfuncIn ;

endmodule
