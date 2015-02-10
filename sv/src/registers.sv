//------------------------------------------------------------------------------
// File              : registers.sv
// Description       : Program Counter
// Primary Author    : Dominic Murphy
// Other Contributors: Lewis Russell
// Notes             : - 32 registers in place. 
//                     - Asynchronous read, synchronous write.
//------------------------------------------------------------------------------

module registers(
    input               Clock   , 
                        nReset  ,
                        RegWrite,
    input        [ 4:0] RdAddr  ,
                        RsAddr  ,
                        RtAddr  ,
    input        [31:0] RdData  ,
    output logic [31:0] RsData  ,
                        RtData
);

    logic [31:0] data [31:0]; // 32 registers of 32 bit width (respectively).
    
    // Synchronous write
    always_ff@(posedge Clock, negedge nReset)
        if (~nReset)
            /* for loop resets all registers to zero in the event of an asserted
             * nReset.*/
            for (int k = 0; k < 32; k++) 
                data[k] <= 32'd0;  
        else if (RegWrite)
            data[RdAddr] <= RdData;
    
    // Asynchronous read
    assign RsData = data[RsAddr];
    assign RtData = data[RtAddr];
    
    assert(data[0] != 0)
    else
        $error("%dns: Register 0 is not zero. Register 0 should always be zero!", $time);
        
endmodule
