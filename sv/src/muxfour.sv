//------------------------------------------------------------------------------
// File               : muxfour.sv
// Description        : 4 input multiplexers
// Primary Author     : Dhanushan Raveendran
// Other Contributors :
// Notes              :
//------------------------------------------------------------------------------

module muxfour #(parameter n = 32)(
    input        [  1:0] Sel,
    input        [n-1:0] A  ,
                         B  ,
                         C  ,
                         D  ,
    output logic [n-1:0] Y
);

always_comb
    case(Sel)
        0: Y = A;
        1: Y = B;
        2: Y = C;
        3: Y = D;
    endcase

endmodule
