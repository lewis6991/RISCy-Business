//-----------------------------------------------------------------------------------------------
// File              : HDU.sv
// Description       : Hazard Detection Unit to stall the processor during unavoidable hazards
// Primary Author    : Dhanushan Raveendran
// Other Contributors: 
// Notes             :
//-----------------------------------------------------------------------------------------------

module HDU(
input              MemReadE,
                   Clock   ,
input        [4:0] RtAddrE ,
                   RsAddrD ,
			       RtAddrD ,
output logic       Stall   			
);

always_ff @(posedge Clock)
    begin
        if(MemReadE && (RtAddrE == RsAddrD || RtAddrE == RtAddrD))
            Stall <= 1'b0;
	end

endmodule