//------------------------------------------------------------------------------
// File              : PIPE.sv
// Description       : Pipeline Register bank
// Primary Author    : Dominic Murphy
// Other Contributors: Lewis Russell
// Notes             : Parameter n defines the number of registers generated.
//------------------------------------------------------------------------------

module PIPE #(parameter n = 1)(
    input                Clock ,
                         nReset,
    input        [n-1:0] In    , 
    output logic [n-1:0] Out
);
/* PIPELINE BYPASSED FOR TESTING
    always_ff @ (posedge Clock, negedge nReset)
        if(~nReset)
            Out <= {n{1'b0}};
        else
            Out <= #20 In;
*/

assign Out = In; // Pipeline Bypass

endmodule
