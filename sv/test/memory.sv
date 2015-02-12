//------------------------------------------------------------------------------
// File              : memory.sv
// Description       : Memory model with synchronous Read/Write.
// Primary Author    : Lewis Russell
// Other Contributers:
// Notes             : Inspired from:
//                      www.asic-world.com/examples/systemveirlog/ram_sp_sr_sw.html
//                      www.doulos.com/knowhow/verilog_designers_guide/models/simple_ram_model
//------------------------------------------------------------------------------
module memory #(
    parameter AddressSize = 16,
    parameter WordSize    = 32
)
(
    input                          Clock    ,
                                   nReset   ,
                                   WriteEn  ,
                                   ReadEn   ,
    input        [AddressSize-1:0] Address  ,
    input        [   WordSize-1:0] WriteData,
    output logic [   WordSize-1:0] ReadData
);

    //assert #0 (AddressSize < 32)
    //else
    //    $fatal("FATAL: Address size has to be less than 32.");

    logic [WordSize-1:0] memory[0:1 << AddressSize - 1];

    // Write block
    always @ (posedge Clock, negedge nReset)
        if (~nReset)
            for (int i = 0; i < (1 << AddressSize); ++i)
                memory[i] <= #20 0;
        else if(WriteEn)
            memory[Address] <= #20 WriteData;

    // Read block
    always @ (posedge Clock, negedge nReset)
        if (~nReset)
            ReadData <= #20 0;
        else if(ReadEn)
            ReadData <= #20 memory[Address];
        else
            ReadData <= #20 0;

endmodule
