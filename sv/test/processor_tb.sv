//----------------------------------------
// File: processor_tb.sv
// Description: Processor testbench
// Primary Author: Jack Barnes
// Other Contributors:
// Notes: Full test coverage of MIPS instructions
//        Select sample for each instruction
//----------------------------------------
module processor_tb;

timeunit 10ns; timeprecision 100ps;
const int clk = 100;

logic Clock, nReset, Out;

processor prcsr0 (
);

//Initial conditions
initial
begin
    Clock  = 1'b0;
    nReset = 1'b0;
end

//Clock implementation
always
    #(clk/2) Clock = !Clock;

//Testing procedure
initial
begin
    //Test nReset condition
    #clk
    assert (Out == 0) 
    else
        $display("ERROR: nReset active, Out = %b\n", Out);

    ProgAddrIn = 9673;
    #clk
    assert (Out == 0) 
    else
        $display("ERROR: nReset active, Out = %b\n", Out);
    #clk
end

endmodule
