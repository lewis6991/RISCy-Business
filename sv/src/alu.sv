//------------------------------------------------------------------------------
// File              : EX.sv
// Description       : Execute stage logic
// Primary Author    : Ethan Bishop
// Other Contributors: Lewis Russell, Dhanushan Raveendran
// Notes             :
//------------------------------------------------------------------------------

module EX(
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
    output logic [31:0] Out        ,
                        RtDataOut  ,
                        PCout      ,  // Program counter output.
    output logic [ 4:0] RAddrOut   ,
    output logic        C          , // Carry out flag.
                        Z          , // Output zero flag.
                        O          , // Overflow flag.
                        N          , // Output negative flag.
                        RegWriteOut,
                        MemReadOut ,
                        MemtoRegOut,
                        MemWriteOut
);

    wire [ 5:0] ALUfunc;
    wire [31:0] ALUout ;
    wire [31:0] ACCout ;
    wire [63:0] MULout ;
    wire [31:0] Y      ;

    wire ALUO;
    wire ALUZ;
    wire ALUN;
    wire ALUC;
    wire ACCO;
    wire ACCZ;
    wire ACCN;
    wire ACCC;
    
    wire ACCEn;
    wire MULSelB;

    alu alu0 (
        .A       (A      ),
        .B       (Y      ),
        .Shamt   (Shamt  ),
        .ALUfunc (Func   ),
        .Out     (ALUout ),
        .En      (LoadReg),
        .C       (ALUC   ),
        .Z       (ALUZ   ),
        .O       (ALUO   ),
        .N       (ALUN   )
    );
    
    acc_control acc_control0 (
        .Clock   (Clock ),
        .nReset  (nReset),
        .Enable  (ACCEn ),
        .MULfunc (Func  ),
        .In      (MULout),
        .Out     (ACCout),
        .C       (ACCC  ), // Carry flag.
        .Z       (ACCZ  ), // Zero flag.
        .O       (ACCO  ), // Overflow flag.
        .N       (ACCN  )  // Negative flag.
    );

    ex_mult ex_mult0 (
        .A   (A      ),
        .B   (Y      ),
        .SelB(MULSelB), // MUL module select
        .Out (MULout )
    );

    mux mux2(
        .A  (B),
        .B  (Immediate),
        .Y  (Y),
        .Sel(ALUSrc)
    );
    
    ex_control ex_control0 (
        .ALUOp       (ALUOp      ),
        .MULOp       (MULOp      ),
        .Jump        (Jump       ),
        .Branch      (Branch     ),
        .RegWriteIn  (RegWriteIn ),
        .ALUO        (ALUO       ), // ALU Flag outputs
        .ALUZ        (ALUZ       ),
        .ALUN        (ALUN       ),
        .ALUC        (ALUC       ),
        .ACCO        (ACCO       ), // ACC Flag outputs
        .ACCZ        (ACCZ       ),
        .ACCN        (ACCN       ),
        .ACCC        (ACCC       ),
        .ACCEn       (ACCEn      ),
        .PCin        (PCin       ), // Program counter input.
        .ALUout      (ALUout     ), // ALU Module output
        .ACCout      (ACCout     ), // ACC Module output
        .MULout      (MULout     ), // MUL Module output
        .Func        (Func       ),
        .Out         (Out        ),
        .PCout       (PCout      ), // Program counter 
        .C           (C          ), // Carry out flag.
        .Z           (Z          ), // Output zero flag.
        .O           (O          ), // Overflow flag.
        .N           (N          ), // Output negative flag.
        .MULSelB     (MULSelB    ), // MUL module select
        .RegWriteOut (RegWriteOut)
    );


    assign MemReadOut  = MemReadIn;
    assign MemtoRegOut = MemtoRegIn;
    assign MemWriteOut = MemWriteIn;
    assign RAddrOut    = RAddrIn;
    assign RtDataOut   = B;

endmodule
