//------------------------------------------------------------------------------
// File              : unsignextend.sv
// Description       : 16-bit to 32-bit sign extension
// Primary Author    : Dhanushan Raveendran
// Other Contributors: 
// Notes             : 
//------------------------------------------------------------------------------

module unsignextend(
    input        [15:0] In ,
    output logic [31:0] Out
);

    assign Out = {{16{1'b0}}, In};

endmodule
