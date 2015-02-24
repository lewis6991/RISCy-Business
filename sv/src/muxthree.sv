//------------------------------------------------------------------------------
// File : muxthree.sv
// Description : 3 input multiplexers
// Primary Author : Dhanushan Raveendran
// Other Contributors:
// Notes :
//------------------------------------------------------------------------------

module muxthree #(parameter n = 32)(
    input        [  1:0] Sel,
    input        [n-1:0] A,
                         B,
                         C,
    output logic [n-1:0] Y            
);

case(Sel)
	0:       Y = A;
	1:       Y = B;
	2:       Y = C;
	default: Y = A;
endcase

endmodule
