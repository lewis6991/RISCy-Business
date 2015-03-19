//------------------------------------------------------------------------------
// File              : FU.sv
// Description       : Forwarding Unit to prevent Data Hazards
// Primary Author    : Dhanushan Raveendran
// Other Contributors: Lewis Russell
// Notes             :
//------------------------------------------------------------------------------

module FU(
    input               RegWriteE2 ,
                        RegWriteM  ,
                        RegWriteW  ,
    input        [ 4:0] RAddrE2    ,
                        RAddrM     ,
                        RAddrW     ,
                        RsAddrE1   , //E1
                        RtAddrE1   , //E1
                        RsAddrD    , //DEC./RU
			            RtAddrD    , //DEC
    output logic        ForwardSrcA,
                        ForwardSrcB,
    output logic [ 1:0] ForwardA   ,
                        ForwardB
);

always_comb
    begin
       ForwardA    = 2'b00;
       ForwardB    = 2'b00;
       ForwardSrcA = 0    ;
       ForwardSrcB = 0    ;

       if(RegWriteE2 && (RAddrE2 != 0) && (RAddrE2 == RsAddrE1))
            ForwardA = 2'b01;
       else if(RegWriteM && (RAddrM != 0) && (RAddrM == RsAddrE1))
            ForwardA = 2'b10;
       else if(RegWriteW && (RAddrW != 0) && (RAddrW == RsAddrE1))
            ForwardA = 2'b11;

       if(RegWriteE2 && (RAddrE2 != 0) && (RAddrE2 == RtAddrE1))
            ForwardB = 2'b01;
       else if(RegWriteM && (RAddrM != 0) && (RAddrM == RtAddrE1))
            ForwardB = 2'b10;
       else if(RegWriteW && (RAddrW != 0) && (RAddrW == RtAddrE1))
            ForwardB = 2'b11;

       if(RegWriteW &&
         (RAddrW != 0)) /*&&
         (    (RAddrE2 != 0 && ((RAddrE2 == RsAddrE1) || (RAddrE2 == RtAddrE1))) ||
              (RAddrM != 0 && ((RAddrM == RsAddrE1) || (RAddrM == RtAddrE1))) ||
              (RAddrW == RsAddrE1) ||
              (RAddrW == RtAddrE1)))*/
            begin
                ForwardSrcA = (RAddrW == RsAddrD);
                ForwardSrcB = (RAddrW == RtAddrD);
            end
    end

endmodule
