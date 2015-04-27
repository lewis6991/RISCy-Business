//------------------------------------------------------------------------------
// File              : FU.sv
// Description       : Forwarding Unit to prevent Data Hazards
// Primary Author    : Dhanushan Raveendran
// Other Contributors: Lewis Russell
// Notes             :
//------------------------------------------------------------------------------

module FU(
    input               RegWriteE2 ,
                        RegWriteE1 ,
                        RegWriteM  ,
                        RegWriteW  ,
                        MemWriteE2 ,
    input        [ 2:0] Memfunc    ,
    input        [ 4:0] RAddrE2    ,
                        RAddrE1    ,
                        RAddrM     ,
                        RAddrW     ,
                        RtAddrM    ,
                        RsAddrE1   , //E1
                        RtAddrE1   , //E1
                        RtAddrE2   , //E2
                        RsAddrD    , //DEC./RU
                        RtAddrD    , //DEC
    output logic        ForwardSrcA,
                        ForwardSrcB,
                        ForwardMem1,
                        ForwardMem2,
    output logic [ 1:0] ForwardA   ,
                        ForwardB
);

always_comb
    begin
       ForwardA    = 2'b00;
       ForwardB    = 2'b00;
       ForwardSrcA = 0    ;
       ForwardSrcB = 0    ;
       ForwardMem1 = 0    ;
       ForwardMem2 = 0    ;

       if(RegWriteE1 && (RAddrE1 != 0) && (RAddrE1 == RsAddrD))
            ForwardA = 2'b01;
       else if(RegWriteE2 && (RAddrE2 != 0) && (RAddrE2 == RsAddrD))
            ForwardA = 2'b10;
       else if(RegWriteM && (RAddrM != 0) && (RAddrM == RsAddrD))
            ForwardA = 2'b11;

       if(RegWriteE1 && (RAddrE1 != 0) && (RAddrE1 == RtAddrD))
            ForwardB = 2'b01;
       else if(RegWriteE2 && (RAddrE2 != 0) && (RAddrE2 == RtAddrD))
            ForwardB = 2'b10;
       else if(RegWriteM && (RAddrM != 0) && (RAddrM == RtAddrD))
            ForwardB = 2'b11;

        if(MemWriteE2 && (RAddrM != 0) && (RAddrM == RtAddrE2))
            ForwardMem2 = 1'b1;

       /*if(RegWriteE2 && (RAddrE2 != 0) && (RAddrE2 == RsAddrE1))
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
            ForwardB = 2'b11;*/

       if(RegWriteW && RAddrW != 0)
       begin
           ForwardSrcA = (RAddrW == RsAddrD);
           ForwardSrcB = (RAddrW == RtAddrD);
       end

       if (Memfunc == `WC && RAddrW == RtAddrM)
           ForwardMem1 = 1'b1;
    end

endmodule
