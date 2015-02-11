//------------------------------------------------------------------------------
// File              : pc.sv
// Description       : Program Counter
// Primary Author    : Dominic Murphy
// Other Contributors: Lewis Russell
// Notes             : 
//------------------------------------------------------------------------------

module pc(
    input               Clock      , 
                        nReset     ,
    input        [31:0] ProgAddrIn , 
    output logic [31:0] ProgAddrOut
);

    always_ff @ (posedge Clock, negedge nReset)
        if(~nReset)
            ProgAddrOut <= 32'd0;
        else
            ProgAddrOut <= ProgAddrIn;

endmodule
