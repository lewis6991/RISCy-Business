//------------------------------------------------------------------------------
// File              : FU.sv
// Description       : Forwarding Unit to prevent Data Hazards
// Primary Author    : Dhanushan Raveendran
// Other Contributors: 
// Notes             :
//------------------------------------------------------------------------------

module FU(
    input               RegWriteM,
                        RegWriteW,
    input        [31:0] RAddrM,
                        RAddrW,
                        RsAddr,
	                RtAddr,
    output logic [ 1:0] ForwardA,
                        ForwardB 
);

always_comb
    begin
        if((RegWriteM) & (RAddrM != 0) & (RAddrM == RsAddr))
            ForwardA = 2'b01;

        if((RegWriteM) & (RAddrM != 0) & (RAddrM == RtAddr))
            ForwardB = 2'b01;

       if((RegWriteW) & (RAddrW != 0) & (RAddrW == RsAddr))
            ForwardA = 2'b10;
 
       if((RegWriteW) & (RAddrW != 0) & (RAddrW == RtAddr))
            ForwardB = 2'b10;
    end

endmodule
