//----------------------------------------
// File: ex_mult_tb.sv
// Description: Execute MULT testbench
// Primary Author: Ethan Bishop
// Other Contributors: Jack Barnes
// Notes: Full test coverage of MULT module
//        Random sample for each instruction
//        Uses adapted checkassert from decoder_tb
//----------------------------------------

`include "alu_definition.sv"
`include "mul_definition.sv"

module ex_mult_tb;

timeunit 10ns; timeprecision 100ps;
const int clk = 100;

logic [32:0] A    ,
             B    ;
logic [63:0] Out  ;
logic        SelB ;

ex_mult ex_mult0 (
    .SelB (SelB ),
    .A    (A    ),
    .B    (B    ),
    .Out  (Out  )
);

//Number of tests to run per instruction
parameter test_count = 32'hFFFF;

int count;

logic [63:0] out;

//Initial conditions
initial
begin

    A     = 0;
    B     = 0;
    SelB  = 0;
    
    count = 0;
    
end

//Testing procedure
initial
begin
    
    SelB  = 0;
    
    $display("Testing SelB = 0... ");
    
    for (int i = 0; i < test_count; i++)
    begin
    
        count = i + 1;
        
        A     = $urandom_range(32'hFFFFFFFF, 0);
        B     = $urandom_range(32'hFFFFFFFF, 0);
        
        out   = A;
        
        checkassert;
        
    end
    
    
    
    SelB  = 1;
    
    count = 0;
    
    $display("Testing SelB = 1... ");
    
    for (int i = 0; i < test_count; i++)
    begin
    
        count = i + 1;
        
        A     = $urandom_range(32'hFFFFFFFF, 0);
        B     = $urandom_range(32'hFFFFFFFF, 0);
        
        out   = (A * B);
        
        checkassert;
        
    end
    
    
    
    $display("All tests passed.");
    $finish;
    
end

task checkassert;
    
    #clk

    assert (Out == out)
    else
    begin
        $display("ERROR: test no. %0d",    count   );
        $display("       Output           Expected");
        $display("SelB   %b"          , SelB       );
        $display("A      %h"          , A          );
        $display("B      %h"          , B          );
        $display("Out    %h %h"       , Out, out   );
        $fatal;
    end
endtask


endmodule
