//------------------------------------------------------------------------------
// File              : ex_mult.sv
// Description       : MULT module for execute stage
// Primary Author    : Ethan Bishop
// Other Contributors:
// Notes             :
//------------------------------------------------------------------------------

module ex_mult (
    input        [31:0] A   ,
                        B   ,
    input               SelB, // Enable B input, else multiply by 1
    output logic        C   ,
                        Z   ,
                        O   ,
                        N   ,
    output logic [63:0] Out
);

logic [31:0] mB;

    always_comb
    begin

        mB = SelB ? B : 32'd1;

        Out = A * mB;

        C = Out[32]       ;
        Z = Out[31:0] == 0;
        O = Out[32]       ;
        N = Out[31]       ;

    end

endmodule
