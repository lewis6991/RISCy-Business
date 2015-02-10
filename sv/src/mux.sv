//----------------------------------------
// File: mux.sv
// Description: Standard 2:1 32-bit signal multiplexer
// Primary Author: Dominic
// Other Contributors: N/A
// Notes: When sel is 0, Y = A. Else, Y = B.
//----------------------------------------
module mux(
        input               sel,
        input        [31:0] A,
                            B,
        output logic [31:0] Y
        );

assign Y = (sel ? B : A);

endmodule