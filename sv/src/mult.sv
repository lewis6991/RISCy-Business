//----------------------------------------
// File: mult.sv
// Description: Multiplier module for execute stage
// Primary Author: Ethan Bishop
// Other Contributors: 
//----------------------------------------

module mult(
    input        [31:0] A  ,
    input        [31:0] B  ,
    output logic [63:0] Out
);

assign Out = A * B;

endmodule

