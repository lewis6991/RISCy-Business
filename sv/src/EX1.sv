//------------------------------------------------------------------------------
// File              : EX1.sv
// Description       : First stage of Execute stage logic
// Primary Author    : Ethan Bishop
// Other Contributors: Lewis Russell, Dhanushan Raveendran
// Notes             :
//------------------------------------------------------------------------------

module EX1(
    input               MULSelB    ,
    input        [31:0] A          , // ALU Input A.
                        B          , // ALU Input B.
    input        [ 4:0] Shamt      , // Shift amount.
    input        [ 5:0] Func       ,
    output logic [31:0] ALUOut     ,
    output logic [31:0] MULOut     ,
    output logic        C          , // Carry out flag.
                        Z          , // Output zero flag.
                        O          , // Overflow flag.
                        N            // Output negative flag.
);

    alu alu0(
        .A    (A     ),
        .B    (B     ),
        .Shamt(Shamt ),
        .Func (Func  ),
        .Out  (ALUOut),
        .C    (C     ),
        .Z    (Z     ),
        .O    (O     ),
        .N    (N     )
    );

    ex_mult ex_mult0(
        .A   (A      ),
        .B   (B      ),
        .Func(Func   ),
        .Out (MULOut )
    );

      assign mB = B;

endmodule
