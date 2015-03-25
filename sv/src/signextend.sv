//------------------------------------------------------------------------------
// File              : signextend.sv
// Description       : 16-bit to 32-bit sign extension
// Primary Author    : Dominic Murphy
// Other Contributors: Lewis Russell
// Notes             :
//------------------------------------------------------------------------------

module signextend(
    input        [15:0] In      ,
    input               Unsgnsel,
    output logic [31:0] Out
);

assign Out = Unsgnsel ? In : $signed(In);

endmodule
