//----------------------------------------
// File: mux_tb.sv
// Description: MUX testbench
// Primary Author: Jack Barnes
// Other Contributors:
// Notes: Selected test coverage
//----------------------------------------
module mux_tb;

timeunit 10ns; timeprecision 100ps;
const int clk = 100;
const int n = 32;

logic Sel;
logic [n:0] A, B;
wire  [n:0] Y;

mux mux0 ( 
    .Sel (Sel),
    .A   (A  ),
    .B   (B  ),
    .Y   (Y  ) 
);

//Initial conditions
initial
begin
    A   = 0;
    B   = 0;
    Sel = 1'b0;
end

//Testing procedure
initial
begin
    for (int i = 0 ; i < 4; i ++)
    begin
        A = (i / 2) * 9673;
        B = (i % 2) * 3874;

        Sel = 1'b0;
        assert (Y == A) 
        else
            $display("ERROR: A = %d, B = %d, Sel = %b, Y = %d\n", A, B, Sel, Y);
        #clk
    
        Sel = 1'b1;
        assert (Y == B) 
        else
            $display("ERROR: A = %d, B = %d, Sel = %b, Y = %d\n", A, B, Sel, Y);
        #clk
    end
    $finish
end

endmodule
