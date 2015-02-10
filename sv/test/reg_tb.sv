//----------------------------------------
// File: reg_tb.sv
// Description: Register testbench
// Primary Author: Jack Barnes
// Other Contributors:
// Notes: Full test coverage
//----------------------------------------
module reg_tb;

timeunit 10ns; timeprecision 100ps;
const int clk = 100;

logic Clock, nReset;
logic [4:0] RdAddr, RsAddr, RtAddr;
logic [31:0] RdData;
wire  [31:0] RsData, RtData;

reg reg0 (
    .Clock  (Clock ), 
    .nReset (nReset),
    .RdAddr (RdAddr),
    .RsAddr (RsAddr),
    .RtAddr (RtAddr),
    .RdData (RdData),
    .RsData (RsData),
    .RtData (RtData)
);

//Initial conditions
initial
begin
    Clock  = 1'b0;
    nReset = 1'b0;
    RdAddr = 0;
    RsAddr = 0;
    RtAddr = 0;
    RdData = 0;
end

//Clock implementation
always
    #(clk/2) Clock = !Clock;

//Testing procedure
initial
begin
    //Test nReset condition
    RdData = 9673;
    for (int i = 0 ; i < 32; i++)
    begin
        RdAddr = i;
        for (int j = 0 ; j < 32; j++)
        begin
            RsAddr = j;
            RtAddr = j;
            assert (RsData[j] == 0) 
            else
                $error("ERROR: nReset active, RsAddr = %b, RsData = %b\n", RsAddr, RsData);
            assert (RtData[j] == 0) 
            else
                $error("ERROR: nReset active, RtAddr = %b,  RtData = %b\n", RtAddr, RtData);
            #clk
        end
    end

    nReset = 1;
    //Test PC implementation
    for (int i = 0 ; i < 32; i++)
    begin
        RdData = i * 32;
        RdAddr = i;
        RsAddr = i;
        RtAddr = i;
        assert (RsData[i] == RdData[i) 
        else
            $error("ERROR: RsAddr = %b, RsData = %b, RdData = %b\n", RsAddr, RsData, RdData);
        assert (RtData[i] == RdData[i) 
        else
            $error("ERROR: RtAddr = %b, RtData = %b, RdData = %b\n", RtAddr, RtData, RdData);
        #clk
    end
    $finish
end

endmodule
