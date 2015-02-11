//------------------------------------------------------------------------------
// File              : WB.sv
// Description       : Write Back pipeline stage
// Primary Author    : Dominic Murphy
// Other Contributors: Lewis Russell
// Notes             : - A very basic stage. Simple a mux, along with some
//                       control wires.
//                     - Warning: Names have no meaning yet, hence have been
//                       arbitrarily chosen.
//------------------------------------------------------------------------------

module WB(
        input               Sel,
        input        [31:0] In1, 
                            In2,
        output logic [31:0] Out1
);

    mux mux3(
        .Sel(Sel ),
        .A  (In1 ),
        .B  (In2 ),
        .Y  (Out1)
    );

endmodule
