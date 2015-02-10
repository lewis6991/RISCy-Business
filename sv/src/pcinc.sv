//----------------------------------------
// File: pcinc.sv
// Description: Adds 4 to the input. Used for PC incrementation.
// Primary Author: Dominic Murphy
// Other Contributors: N/A
// Notes: Out = In + 4.
//----------------------------------------
module pcinc(
        input        [31:0] In,
        output logic [31:0] Out
);

assign Out = In + 32'd4;

assert(Out > In)
else
    $error("%dns: add4 has overflowed.", $time);

endmodule