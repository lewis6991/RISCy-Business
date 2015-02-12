//------------------------------------------------------------------------------
// File              : processor_tb.sv
// Description       : Processor testbench
// Primary Author    : Jack Barnes
// Other Contributors: Lewis Russell
// Notes             : Full test coverage of MIPS instructions
//                     Select sample for each instruction
//------------------------------------------------------------------------------
module processor_tb;

timeunit 10ns; timeprecision 100ps;
parameter clk = 100;

logic Clock  = 1'b0,
      nReset = 1'b0;

logic [31:0] instData = 0;
wire  [31:0] instAddr  ,
             memAddr   ,
             memRData  ,
             memWData  ;
wire         memReadEn ,
             memWriteEn;

processor prcsr0 (
    .Clock (Clock ),
    .nReset(nReset)
);

memory memory0 (
    .Clock    (Clock    ),
    .nReset   (nReset   ),
    .Address  (memAddr  ),
    .ReadEn   (memReadEn),
    .ReadData (memRData ),
    .WriteEn  (mWriteEn ),
    .WriteData(memWData )
);

//Clock implementation
always
    #(clk/2) Clock = ~Clock;

//Testing procedure
initial
begin
    //Test nReset condition
    #clk

    #clk
end

endmodule
