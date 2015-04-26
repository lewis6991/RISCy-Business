//------------------------------------------------------------------------------
// File              : registers.sv
// Description       : Program Counter
// Primary Author    : Dominic Murphy
// Other Contributors: Lewis Russell, Dhanushan Raveendran
// Notes             : - 32 registers in place.
//                     - Asynchronous read, synchronous write.
//------------------------------------------------------------------------------

`ifdef no_check
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
`else
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
`endif

logic [31:0] data[1:31]; // 31 registers of 32 bit width (respectively).

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
`ifdef no_check
    always_comb
    begin
        RsData  <= #1 (RsAddr  == 0) ? 0 : data[ RsAddr];
        RtData  <= #1 (RtAddr  == 0) ? 0 : data[ RtAddr];
    end
`else
    always_comb
    begin
        RsData  <= #1 (RsAddr  == 0) ? 0 : data[ RsAddr];
        RtData  <= #1 (RtAddr  == 0) ? 0 : data[ RtAddr];
        RegData <= #1 (RegAddr == 0) ? 0 : data[RegAddr];
    end
`endif

endmodule
