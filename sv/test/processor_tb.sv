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

logic [31:0] instrData = 0;
wire  [31:0] instrAddr    ,
             memAddr      ,
             memRData     ,
             memWData     ;
wire         memReadEn    ,
             memWriteEn   ;

processor prcsr0 (
    .Clock    (Clock     ),
    .nReset   (nReset    ),
    .InstrMem (instrData ),
    .InstrAddr(instrAddr ),
    .MemData  (memRData  ),
    .WriteData(memWData  ),
    .MemAddr  (memAddr   ),
    .MemWrite (memWriteEn),
    .MemRead  (memReadEn )
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

always @ (posedge Clock)
    case(instrAddr)
        16'h0000:  instrData <= #20 32'h3C011234;
        16'h0004:  instrData <= #20 32'h34215678;
        16'h0008:  instrData <= #20 32'h24020000;
        16'h000c:  instrData <= #20 32'h00000000;
        16'h0010:  instrData <= #20 32'h34420005;
        16'h0014:  instrData <= #20 32'h70411802;
        16'h0018:  instrData <= #20 32'h00000000;
    endcase

//Testing procedure
initial
begin
    #clk nReset = 1;
    #200*clk

    $finish;
end

endmodule
