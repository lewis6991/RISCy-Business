//----------------------------------------
// File: reg.sv
// Description: Program Counter
// Primary Author: Dominic
// Other Contributors: N/A
// Notes: - 32 registers in place. 
//        - Asynchronous read, synchronous write
//----------------------------------------
module reg(
        input               Clock, 
                            nReset,
        input        [4:0]  RdAddr,
                            RsAddr,
                            RtAddr,
        input        [31:0] RdData,
        output logic [31:0] RsData,
                            RtData
);

logic [31:0] data [31:0]; // 32 registers of 32 bit width (respectively).

// Synchronous write
always_ff@(posedge Clock, negedge nReset)
    if(~nReset)
        for(int k=0; k<32;k++) // for loop resets all registers to zero in the 
            data[k] <= 32'd0;  // event of an asserted nReset.
    else //if(WRITE)
        data[RdAddr] <= RdData;

// Asynchronous read
assign RsData = data[RsAddr];
assign RtData = data[RtAddr];

assert(RdAddr != 5'd0)
else
    $fatal("%dns: Register 0 was written to. Register 0 is always zero!", $time);
        
endmodule