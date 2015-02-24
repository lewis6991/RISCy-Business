//----------------------------------------
// File: signextend_tb.sv
// Description: Sign extension testbench
// Primary Author: Jack Barnes
// Other Contributors:
// Notes: Full test coverage of sign extension
//----------------------------------------
module signextend_tb;

timeunit 10ns; timeprecision 100ps;
const int clk = 100;

logic [15:0] In;
logic Unsgnsel;
wire  [31:0] Out;

signextend sgnext0 (
    .In       (In      ),
    .Unsgnsel (Unsgnsel),
    .Out      (Out     )
);

//Initial conditions
initial
begin
    Unsgnsel = 1'b0;
    In  = 0;
end

//Testing procedure
initial
begin
    In = 743;
    #clk
    assert (Out == {{16{In[15]}},In}) 
    else
        $display("ERROR: In[15] = %b, Sign extension = %b\n", In[15], Out[31:16]);

    In = -3254;
    #clk
    assert (Out == {{16{In[15]}},In}) 
    else
        $display("ERROR: In[15] = %b, Sign extension = %b\n", In[15], Out[31:16]);
    $finish;
    
    Unsgnsel = 1'b1;
    
    In = 743;
    #clk
    assert (Out == {{16{1'b0}}, In}) 
    else
        $display("ERROR: In[15] = %b, Sign extension = %b\n", In[15], Out[31:16]);

    In = -3254;
    #clk
    assert (Out == {{16{1'b0}}, In}) 
    else
        $display("ERROR: In[15] = %b, Sign extension = %b\n", In[15], Out[31:16]);
    $finish;
end

endmodule
