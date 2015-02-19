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
        input               MemtoReg,
        input        [31:0] ALUData, 
                            MemData,
        output logic [31:0] WBData
);

    mux mux4(
        .Sel(MemtoReg),
        .A  (ALUData ),
        .B  (MemData ),
        .Y  (WBData  )
    );

endmodule
