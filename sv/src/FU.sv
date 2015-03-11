//------------------------------------------------------------------------------
// File              : FU.sv
// Description       : Forwarding Unit to prevent Data Hazards
// Primary Author    : Dhanushan Raveendran
// Other Contributors: Lewis Russell
// Notes             :
//------------------------------------------------------------------------------

module FU(
    input               RegWriteM  ,
                        RegWriteW  ,
    input        [ 4:0] RAddrM     ,
                        RAddrW     ,
                        RsAddrE    ,
                        RtAddrE    ,
                        RsAddrD    ,
			RtAddrD    ,
    output logic        ForwardSrcA,
                        ForwardSrcB,
    output logic [ 1:0] ForwardA   ,
                        ForwardB 
);

always_comb
    begin
       ForwardA    = 2'b00;
       ForwardB    = 2'b00;
       ForwardSrcA =     0;
       ForwardSrcB =     0;

       if(RegWriteM && (RAddrM != 0) && (RAddrM == RsAddrE))
            ForwardA = 2'b01;
       else if(RegWriteW && (RAddrW != 0) && (RAddrW == RsAddrE))
            ForwardA = 2'b10;	
		   
       if(RegWriteM && (RAddrM != 0) && (RAddrM == RtAddrE))
            ForwardB = 2'b01; 
       else if(RegWriteW && (RAddrW != 0) && (RAddrW == RtAddrE))
            ForwardB = 2'b10;

       if(RegWriteW && (RAddrW != 0) && ((RAddrM != 0 && 
	     ((RAddrM == RsAddrE) || (RAddrM == RtAddrE))) || 
          (RAddrW == RsAddrE) || (RAddrW == RtAddrE)))
            begin
                ForwardSrcA = (RAddrW == RsAddrD);
                ForwardSrcB = (RAddrW == RtAddrD);
            end
    end

endmodule
