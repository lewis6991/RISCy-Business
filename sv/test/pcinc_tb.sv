//----------------------------------------
// File: pcinc_tb.sv
// Description: PC increment testbench
// Primary Author: Jack Barnes
// Other Contributors:
// Notes: Selected test coverage: 
//          Reset condition
//          A small sample of potential input values
//----------------------------------------
module pcinc_tb;

timeunit 10ns; timeprecision 100ps;
const int clk = 100;

logic [31:0] In;
wire  [31:0] Out;

pcinc pcinc0 (
    .In  (In ),
    .Out (Out)
);

//Initial conditions
initial
begin
    In = 0;
end

//Testing procedure
initial
begin
    #clk
    In = 1;
    //Test a select sample
    for (int i = 0 ; i < 31; i++)
    begin
        #clk
        assert (Out == (In + 4)) 
        else
            $display("ERROR: In = %d, Out = %d\n       In + 4 != Out\n", In, Out);
        In = {In[30:0],1'b0};
    end
    $finish;
end

endmodule
