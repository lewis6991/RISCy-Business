//------------------------------------------------------------------------------
// File              : mult.sv
// Description       : Multiplier module for execute stage
// Primary Author    : Ethan Bishop
// Other Contributors: Lewis Russell
//------------------------------------------------------------------------------

module mult(
    input        [31:0] A  ,
                        B  ,
    output logic [63:0] Out
);

assign Out = A * B;

endmodule

