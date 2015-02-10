//----------------------------------------
// File: mux.sv
// Description: Standard 2:1 32-bit signal multiplexer
// Primary Author: Dominic Murphy
// Other Contributors: N/A
// Notes: - When sel is 0, Y = A. Else, Y = B.
//        - parameter n determines the bit width.
//----------------------------------------
module mux #(parameter n = 32)(
        input               sel,
        input        [n-1:0] A,
                            B,
        output logic [n-1:0] Y
        );

assign Y = (sel ? B : A);

endmodule