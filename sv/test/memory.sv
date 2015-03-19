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
                                   WriteL   ,
                                   WriteR   ,
                                   ReadEn   ,
    input        [AddressSize-1:0] Address  ,
    input        [   WordSize-1:0] WriteData,
    output logic [   WordSize-1:0] ReadData
);

    //assert #0 (AddressSize < 32)
    //else
    //    $fatal("FATAL: Address size has to be less than 32.");

    logic [7:0] memory[0:1 << AddressSize - 1];

    // Write block
    always @ (posedge Clock, negedge nReset)
        if (~nReset)
            for (int i = 0; i < (1 << AddressSize); ++i)
                memory[i] <= #20 0;
        else if(WriteEn)
            begin
                if(WriteL)
                    begin
                       memory[Address + 3] <= #20 WriteData[31:24];
                       memory[Address + 2] <= #20 WriteData[23:16]; 
                    end
                else if(WriteR)
                    begin
                       memory[Address + 1] <= #20 WriteData[15: 8];
                       memory[Address    ] <= #20 WriteData[ 7: 0]; 
                    end
                else
                    begin
                        memory[Address + 3] <= #20 WriteData[31:24];
                        memory[Address + 2] <= #20 WriteData[23:16];
                        memory[Address + 1] <= #20 WriteData[15: 8];
                        memory[Address    ] <= #20 WriteData[ 7: 0];
                    end
            end

    // Read block
    always @ (posedge Clock, negedge nReset)
        if (~nReset)
            ReadData <= #20 0;
        else if(ReadEn)
                ReadData <= #20 {memory[Address + 3], memory[Address + 2], memory[Address + 1], memory[Address]};
        else
            ReadData <= #20 0;

endmodule
