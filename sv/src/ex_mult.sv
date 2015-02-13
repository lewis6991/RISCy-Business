//------------------------------------------------------------------------------
// File              : ex_mult.sv
// Description       : MULT module for execute stage
// Primary Author    : Ethan Bishop
// Other Contributors: 
// Notes             : 
//------------------------------------------------------------------------------

module ex_mult (
    input        [31:0] A   ,
                        B   ,
    input               SelB, // Enable B input, else multiply by 1
    output logic [63:0] Out
);

    always_comb
    begin

        if (SelB)
            Out   = A * B;
        else
            Out   = A;
        
    end

endmodule
