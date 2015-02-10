//----------------------------------------
// File: pc_tb.sv
// Description: PC testbench
// Primary Author: Jack Barnes
// Other Contributors:
// Notes: Selected test coverage: 
//          Reset condition
//          A small sample of potential input values
//----------------------------------------
module pc_tb;

timeunit 10ns; timeprecision 100ps;
const int clk = 100;

logic Clock, nReset;
logic [31:0] ProgAddrIn;
wire  [31:0] ProgAddrOut;

pc pc0 (
    .ProgAddrIn  (ProgAddrIn ),
    .Clock       (Clock      ),
    .nReset      (nReset     ),
    .ProgAddrOut (ProgAddrOut)
);

//Initial conditions
initial
begin
    ProgAddrIn = 0;
    Clock      = 1'b0;
    nReset     = 1'b0;
end

//Clock implementation
always
    #(clk/2) Clock = !Clock;

//Testing procedure
initial
begin
    //Test nReset condition
    #clk
    assert (ProgAddrOut == 0) 
    else
        $display("ERROR: nReset active, ProgAddrOut = %d\n", ProgAddrOut);

    ProgAddrIn = 9673;
    #clk
    assert (ProgAddrOut == 0) 
    else
        $display("ERROR: nReset active, ProgAddrOut = %d\n", ProgAddrOut);
    #clk

    nReset = 1'b1;
    ProgAddrIn = 1;
    //Test PC implementation
    for (int i = 0 ; i < 31; i++)
    begin
        #clk
        assert (ProgAddrOut == ProgAddrIn) 
        else
            $display("ERROR: ProgAddrIn = %d, ProgAddrOut = %d\n", ProgAddrIn, ProgAddrOut);
        ProgAddrIn = {ProgAddrIn[30:0],1'b0};
    end
    $finish
end

endmodule
