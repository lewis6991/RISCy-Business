//----------------------------------------
// File: muxthree_tb.sv
// Description: 3 input MUX testbench
// Primary Author: Jack Barnes
// Other Contributors:
// Notes: Selected test coverage
//----------------------------------------
module mux_tb;

timeunit 10ns; timeprecision 100ps;
const int clk = 100;
parameter n = 32;

logic [1:0] Sel;
logic [n-1:0] A, B, C;
wire  [n-1:0] Y;

mux mux0 ( 
    .Sel (Sel),
    .A   (A  ),
    .B   (B  ),
    .C   (C  ),
    .Y   (Y  ) 
);

//Initial conditions
initial
begin
    A   = 0;
    B   = 0;
    C   = 0;
    Sel = 2'b00;
end

//Testing procedure
initial
begin
    for (int i = 0 ; i < 8; i ++)
    begin
        
        A = (i / 4) * 9673;
        B = ((i / 2) % 2) * 5231;
        C = (i % 2) * 3874;

        Sel = 2'b00;
        #clk
        assert (Y == A) 
        else
            $display("ERROR: A = %d, B = %d, Sel = %b, Y = %d\n", A, B, Sel, Y);

        Sel = 2'b01;
        #clk
        assert (Y == B) 
        else
            $display("ERROR: A = %d, B = %d, Sel = %b, Y = %d\n", A, B, Sel, Y);

        Sel = 2'b10;
        #clk
        assert (Y == C) 
        else
            $display("ERROR: A = %d, B = %d, Sel = %b, Y = %d\n", A, B, Sel, Y);

        Sel = 2'b11;
        #clk
        assert (Y == A) 
        else
            $display("ERROR: A = %d, B = %d, Sel = %b, Y = %d\n", A, B, Sel, Y);
    end
    $finish;
end

endmodule
