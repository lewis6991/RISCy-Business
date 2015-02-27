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
    input        [ 4:0] RAddrM,
                        RAddrW,
                        RsAddrE,
                        RtAddrE,
                        RsAddr,
	                RtAddr,
    output logic        ForwardSrcA,
                        ForwardSrcB,
    output logic [ 1:0] ForwardA,
                        ForwardB 
);

always_comb
    begin
       ForwardA = 2'b00;
       ForwardB = 2'b00;
       ForwardSrcA = 0;
       ForwardSrcB = 0;

       if((RegWriteM) & (RAddrM != 0) & (RAddrM == RsAddrE))
            ForwardA = 2'b01;
       else if((RegWriteW) & (RAddrW != 0) & (RAddrW == RsAddrE))
            ForwardA = 2'b10;	
		   
       if((RegWriteM) & (RAddrM != 0) & (RAddrM == RtAddrE))
            ForwardB = 2'b01; 
       else if((RegWriteW) & (RAddrW != 0) & (RAddrW == RtAddrE))
            ForwardB = 2'b10;

       if((RegWriteW) & (RAddrW != 0) & (RAddrW == RsAddr) & (
         ((RegWriteM) & (RAddrM != 0) & (RAddrM == RsAddrE)) | 
         ((RegWriteM) & (RAddrM != 0) & (RAddrM == RtAddrE)) | 
         ((RegWriteW) & (RAddrW != 0) & (RAddrW == RsAddrE)) | 
         ((RegWriteW) & (RAddrW != 0) & (RAddrW == RtAddrE))))
            ForwardSrcA = 1;

       if((RegWriteW) & (RAddrW != 0) & (RAddrW == RtAddr) & (
         ((RegWriteM) & (RAddrM != 0) & (RAddrM == RsAddrE)) | 
         ((RegWriteM) & (RAddrM != 0) & (RAddrM == RtAddrE)) | 
         ((RegWriteW) & (RAddrW != 0) & (RAddrW == RsAddrE)) | 
         ((RegWriteW) & (RAddrW != 0) & (RAddrW == RtAddrE))))
            ForwardSrcB = 1;
    end

endmodule
