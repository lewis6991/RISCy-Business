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
                        ALUC       ,
                        ALUZ       ,
                        ALUO       ,
                        ALUN       ,
                        ACCEn      ,
    input        [63:0] In         , // ACC input
    input        [ 5:0] Func       ,
    output logic [31:0] Out        ,
    output logic        C          , // Carry out flag.
                        Z          , // Output zero flag.
                        O          , // Overflow flag.
                        N            // Output negative flag.
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

    assign Out = ACCEn ? ACCout : In[31:0];

    assign C = ACCEn ? ACCC : ALUC;
    assign Z = ACCEn ? ACCZ : ALUZ;
    assign O = ACCEn ? ACCO : ALUO;
    assign N = ACCEn ? ACCN : ALUN;

endmodule
