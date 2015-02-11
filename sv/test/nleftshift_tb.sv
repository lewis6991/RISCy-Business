//----------------------------------------
// File: nleftshift_tb.sv
// Description: Left shift testbench
// Primary Author: Jack Barnes
// Other Contributors:
// Notes: Full test coverage
//----------------------------------------
module nleftshift_tb;

timeunit 10ns; timeprecision 100ps;
const int clk = 100;
parameter n = 2;

logic [31:0] In;
wire  [31:0] Out;

nleftshift lshft0 ( 
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
    In = 1;
    //Test a select sample
    for (int i = 0 ; i < 32; i++)
    begin
        #clk
        assert (Out == {In[31-n:0],{n{1'b0}}}) 
        else
            $display("ERROR: In = %b, Out = %b\n       In >> %b != Out\n", In, Out, n);
        In = {In[30:0],1'b0};
    end
    $finish;
end

endmodule
