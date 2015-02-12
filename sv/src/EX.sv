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
                        PCin       , // Program counter input.
                        RegWriteIn ,
                        MemReadIn  ,
                        MemtoRegIn ,
			MemWriteIn ,
                        ALUSrc     ,
    input        [31:0] A          , // ALU Input A.
                        B          , // ALU Input B.
                        Immediate  , // Immediate from Decode stage.
    input        [ 4:0] Shamt      , // Shift amount.
    input        [ 4:0] RAddrIn    ,
    input        [ 5:0] Func       ,
    output logic [31:0] Out        ,
                        RtDataOut  ,
    output logic [ 4:0] RAddrOut   ,
    output logic        C          , // Carry out flag.
                        Z          , // Output zero flag.
                        O          , // Overflow flag.
                        N          , // Output negative flag.
                        RegWriteOut,
                        MemReadOut ,
                        MemtoRegOut,
                        MemWriteOut,
                        PCout        // Program counter output.
);

    wire [ 5:0] ALUfunc;
    wire [31:0] ALUout ;
    wire [63:0] MULout ;
    wire [31:0] ACCout ;
    wire [31:0] Y      ;

    wire ALUO;
    wire ALUZ;
    wire ALUN;
    wire ALUC;
    wire ACCO;
    wire ACCZ;
    wire ACCN;

    alu alu0 (
        .A       (A      ),
        .B       (Y      ),
        .Shamt   (Shamt  ),
        .ALUfunc (ALUfunc),
        .Out     (ALUout ),
        .En      (LoadReg),
        .C       (ALUC   ),
        .Z       (ALUZ   ),
        .O       (ALUO   ),
        .N       (ALUN   )
    );

    mux mux2(
        .A  (B),
        .B  (Immediate),
        .Y  (Y),
        .sel(ALUSrc).
    );


    assign MemReadOut  = MemReadIn;
    assign MemtoRegOut = MemtoRegIn;
    assign MemWriteOut = MemWriteIn;
    assign RAddrOut    = RAddrIn;
    assign RtDataOut   = B;

    // TODO: These will eventually do something
    assign RegWriteOut = RegWriteIn;
    assign PCout       = PCin;

    always_comb
    begin
        Out     = 0;
        ALUfunc = 0;
        MULfunc = 0;
        ACCfunc = 0;

        C = 0;
        Z = 0;
        O = 0;
        N = 0;

        if (ALUOp)
            case (Func)
                // TODO: Non-ALU instructions with ALU opcode
                `MULT:
                `MULTU:
                `MFHI:
                `MFLO:
                `MTHI:
                `MTLO:

                `JALR:
                `JR:

                default:
                begin
                    ALUfunc = Func  ;
                    Out     = ALUout;
                    C       = ALUC;
                    Z       = ALUZ;
                    O       = ALUO;
                    N       = ALUN;
                end
            endcase

        if (MULOp)
            case (Func)
                // TODO: Non-MUL instructions with MUL opcode
                `CLZ:
                `CLO:

                default:
                begin
                    // TODO: MUL instructions
                    Z = ACCZ;
                    O = ACCO;
                    N = ACCN;
                end
            endcase
    end
endmodule
