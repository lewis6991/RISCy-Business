//----------------------------------------
// File: WB.sv
// Description: Write Back pipeline stage
// Primary Author: Dominic
// Other Contributors: N/A
// Notes: - A very basic stage. Simple a mux, along with some
//          control wires.
//        - Warning: Names have no meaning yet, hence have been arbitrarily chosen.
//----------------------------------------
module WB(
        input        [31:0] Jack, 
                            Ethan,
        output logic [31:0] Lewis,
        output logic        Dhanu
);

mux mux3(.sel(UNKNOWN),.A(Jack),.B(Ethan),.Y(Lewis));

endmodule