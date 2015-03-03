//------------------------------------------------------------------------------
// File              : FU.sv
// Description       : Forwarding Unit to prevent Data Hazards
// Primary Author    : Dhanushan Raveendran
// Other Contributors: Lewis Russell
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

logic DataCheckM   = RegWriteM && RAddrM != 0;
logic DataCheckW   = RegWriteW && RAddrW != 0;
logic AddrCheckMRs = RAddrM == RsAddrE;
logic AddrCheckMRt = RAddrM == RtAddrE;
logic AddrCheckWRs = RAddrW == RsAddrE;
logic AddrCheckWRt = RAddrW == RtAddrE;

always_comb
    begin
       ForwardA = 2'b00;
       ForwardB = 2'b00;
       ForwardSrcA = 0;
       ForwardSrcB = 0;

       if(DataCheckM && AddrCheckMRs)
            ForwardA = 2'b01;
       else if(DataCheckW && AddrCheckWRs)
            ForwardA = 2'b10;	
		   
       if(DataCheckM && AddrCheckMRt)
            ForwardB = 2'b01; 
       else if(DataCheckW && AddrCheckWRt)
            ForwardB = 2'b10;

       if(DataCheckW && ((RAddrM != 0 && 
	     (AddrCheckMRs || AddrCheckMRt)) || 
          AddrCheckWRs || AddrCheckWRt))
            begin
                ForwardSrcA = (RAddrW == RsAddr);
                ForwardSrcB = (RAddrW == RtAddr);
            end
    end

endmodule
