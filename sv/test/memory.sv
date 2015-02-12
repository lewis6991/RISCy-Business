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
    parameter AddressSize = 32,
    parameter WordSize    = 32
)
(
    input                          Clock    ,
                                   nReset   ,
                                   WriteEn  , // Write Enable/Read Enable
    input        [AddressSize-1:0] Address  ,
    input        [   WordSize-1:0] WriteData,
    output logic [   WordSize-1:0] Data
);

    logic [WordSize-1:0] memory[0:1 << AddressSize];

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
            Data <= #20 0;
        else if(~WriteEn)
            Data <= #20 memory[Address];

endmodule
