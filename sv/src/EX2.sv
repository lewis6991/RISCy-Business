//------------------------------------------------------------------------------
// File              : EX2.sv
// Description       : Second stage of Execute stage logic
// Primary Author    : Ethan Bishop
// Other Contributors: Lewis Russell, Dhanushan Raveendran
// Notes             :
//------------------------------------------------------------------------------

module EX2(
    input               Clock      ,
                        nReset     ,
                        RegWriteIn ,
                        MemReadIn  ,
                        MemtoRegIn ,
                        MemWriteIn ,
                        ALUC       ,
                        ALUZ       ,
                        ALUO       ,
                        ALUN       ,
                        ACCEn      ,
    input        [ 2:0] MemfuncIn  ,
    input        [31:0] RtDataIn   ,
    input        [63:0] In         , // ACC input
    input        [ 4:0] RAddrIn    ,
    input        [ 5:0] Func       ,
    output logic [ 2:0] MemfuncOut ,
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
                        MemWriteOut
);

    wire [31:0] ACCout;

    wire ACCO;
    wire ACCZ;
    wire ACCN;
    wire ACCC;

    acc_control acc_control0 (
        .Clock   (Clock ),
        .nReset  (nReset),
        .ACCEn   (ACCEn ),
        .MULfunc (Func  ),
        .In      (In    ),
        .Out     (ACCout),
        .C       (ACCC  ), // Carry flag.
        .Z       (ACCZ  ), // Zero flag.
        .O       (ACCO  ), // Overflow flag.
        .N       (ACCN  )  // Negative flag.
    );

    mux mux0(
        .A  (In[31:0]),
        .B  (ACCout  ),
        .Y  (Out     ),
        .Sel(ACCEn   )
    );

    mux #(.n(4)) mux1(
        .A  ({ALUC, ALUZ, ALUO, ALUN}),
        .B  ({ACCC, ACCZ, ACCO, ACCN}),
        .Y  ({C   , Z   , O   , N   }),
        .Sel(ACCEn                   )
    );

    assign RegWriteOut = RegWriteIn;
    assign MemReadOut  = MemReadIn;
    assign MemtoRegOut = MemtoRegIn;
    assign MemWriteOut = MemWriteIn;
    assign MemfuncOut  = MemfuncIn;
    assign RAddrOut    = RAddrIn;
    assign RtDataOut   = RtDataIn;

endmodule
