//----------------------------------------
// File: reg_t.sv
// Description: Register testbench
// Primary Author: Jack Barnes
// Other Contributors:
// Notes: Full test coverage
//----------------------------------------
module reg_t;

const int clk = 100;

logic Clock, nReset;
logic [4:0] RdAddr, RsAddr, RtAddr;
logic [31:0] RdData;
wire  [31:0] RsData, RtData;

reg rgs0 (
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
    Clock  = 0;
    nReset = 0;
    In     = 0;
end

//Clock implementation
always
    #(clk/2) Clock = !Clock;

//Testing procedure
initial
begin
end

endmodule
