//------------------------------------------------------------------------------
// File              : registers.sv
// Description       : Program Counter
// Primary Author    : Dominic Murphy
// Other Contributors: Lewis Russell, Dhanushan Raveendran
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
                        RegAddr ,
    input        [31:0] RdData  ,
    output logic [31:0] RsData  ,
                        RtData  ,
                        RegData
);

logic [31:0] data[1:31]; // 31 registers of 32 bit width (respectively).

// Debug functionality to allow access to registers post-synthesis and post-pnr
always_comb
begin
    if (RegAddr == 0)
        RegData = 0;
    else
        RegData = data[RegAddr];
end

/*
always_ff @ (posedge Clock, negedge nReset)
    if (~nReset)
        RegData <= 32'd0;
    else if (RegAddr == 0)
        RegData <= #1 0;
    else
        RegData <= #1 data[RegAddr];
*/
// Synchronous write
always_ff @ (posedge Clock, negedge nReset)
    if (~nReset)
        /* for loop resets all registers to zero in the event of an asserted
         * nReset.*/
        for (int k = 1; k < 32; k++)
            data[k] <= 0;
    else if (RegWrite && RdAddr != 0)
        data[RdAddr] <= #1 RdData;

// Asynchronous read
always_comb
begin
    if (RsAddr == 0)
        RsData = 0;
    else
        RsData = data[RsAddr];

    if (RtAddr == 0)
        RtData = 0;
    else
        RtData = data[RtAddr];
end

endmodule
