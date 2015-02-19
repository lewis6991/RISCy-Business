//----------------------------------------
// File: acc_control_tb.sv
// Description: ACC control testbench
// Primary Author: Ethan Bishop
// Other Contributors: Jack Barnes
// Notes: Full test coverage of accumulator
//        Random sample for each instruction
//        Uses adapted checkassert from decoder_tb
//----------------------------------------

`include "alu_definition.sv"
`include "mul_definition.sv"

module acc_control_tb;

timeunit 10ns; timeprecision 100ps;
const int clk = 100;

logic [ 5:0] Func  ;
logic [63:0] In    ;
logic [31:0] Out   ;
logic        Clock ,
             nReset,
             ACCEn ,
             C     ,
             Z     ,
             O     ,
             N     ;

acc_control acc_control0 (
    .Clock   (Clock  ),
    .nReset  (nReset ),
    .ACCEn   (ACCEn  ),
    .MULfunc (Func   ),
    .In      (In     ),
    .Out     (Out    ),
    .C       (C      ),
    .Z       (Z      ),
    .O       (O      ),
    .N       (N      )
);

//Number of tests to run per instruction
parameter test_count = 32'hFFFF;

int count;

string test;

logic [63:0] init,
             result,
             expected;
logic [31:0] out;

//Initial conditions
initial
begin

    Clock = 0;
    In    = 0;
    Func  = 0;
    
    count = 0;
    
end

always
    #(clk/2) Clock = ~Clock;

//Testing procedure
initial
begin

    nReset = 0;
    
    #clk
    
    nReset = 1;
    ACCEn  = 1;
    
    $display("Testing MADD... ");
    
    for (int i = 0; i < test_count; i++)
    begin
    
        count    = i + 1;
        
        init     = {
            $urandom_range(32'hFFFFFFFF, 0),
            $urandom_range(32'hFFFFFFFF, 0)
        };
        loadinit;
        
        test     = "MADD";
        Func     = `MADD;
        In       = {
            $urandom_range(32'hFFFFFFFF, 0),
            $urandom_range(32'hFFFFFFFF, 0)
        };
        
        expected = (init + In);
        
        checkop;
        
    end
    
    
    
    count = 0;
    
    $display("Testing MADDU... ");
    
    for (int i = 0; i < test_count; i++)
    begin
    
        count    = i + 1;
        
        init     = {
            $urandom_range(32'hFFFFFFFF, 0),
            $urandom_range(32'hFFFFFFFF, 0)
        };
        loadinit;
        
        test     = "MADDU";
        Func     = `MADDU;
        In       = {
            $urandom_range(32'hFFFFFFFF, 0),
            $urandom_range(32'hFFFFFFFF, 0)
        };
        
        expected = (init + In);
        
        checkop;
        
    end
    
    
    
    count = 0;
    
    $display("Testing MSUB... ");
    
    for (int i = 0; i < test_count; i++)
    begin
    
        count    = i + 1;
        
        init     = {
            $urandom_range(32'hFFFFFFFF, 0),
            $urandom_range(32'hFFFFFFFF, 0)
        };
        loadinit;
        
        test     = "MSUB";
        Func     = `MSUB;
        In       = {
            $urandom_range(32'hFFFFFFFF, 0),
            $urandom_range(32'hFFFFFFFF, 0)
        };
        
        expected = (init - In);
        
        checkop;
        
    end
    
    
    
    count = 0;
    
    $display("Testing MSUBU... ");
    
    for (int i = 0; i < test_count; i++)
    begin
    
        count = i + 1;
        
        init     = {
            $urandom_range(32'hFFFFFFFF, 0),
            $urandom_range(32'hFFFFFFFF, 0)
        };
        loadinit;
        
        test     = "MSUBU";
        Func     = `MSUBU;
        In       = {
            $urandom_range(32'hFFFFFFFF, 0),
            $urandom_range(32'hFFFFFFFF, 0)
        };
        
        expected = (init - In);
        
        checkop;
        
    end
    
    
    
    count = 0;
    
    $display("Testing MFHI... ");
    
    for (int i = 0; i < test_count; i++)
    begin
    
        count    = i + 1;
        
        init     = {
            $urandom_range(32'hFFFFFFFF, 0),
            $urandom_range(32'hFFFFFFFF, 0)
        };
        loadinit;
        
        test     = "MFHI";
        Func     = `MFHI;
        In       = {
            $urandom_range(32'hFFFFFFFF, 0),
            $urandom_range(32'hFFFFFFFF, 0)
        };
        
        out      = init[63:32];
        
        checkassert;
        
    end
    
    
    
    count = 0;
    
    $display("Testing MFLO... ");
    
    for (int i = 0; i < test_count; i++)
    begin
    
        count    = i + 1;
        
        init     = {
            $urandom_range(32'hFFFFFFFF, 0),
            $urandom_range(32'hFFFFFFFF, 0)
        };
        loadinit;
        
        test     = "MFLO";
        Func     = `MFLO;
        In       = {
            $urandom_range(32'hFFFFFFFF, 0),
            $urandom_range(32'hFFFFFFFF, 0)
        };
        
        out      = init[31:0];
        
        checkassert;
    end
    
    
    
    count = 0;
    
    $display("Testing MTHI... ");
    
    for (int i = 0; i < test_count; i++)
    begin
    
        count    = i + 1;
        
        init     = {
            $urandom_range(32'hFFFFFFFF, 0),
            $urandom_range(32'hFFFFFFFF, 0)
        };
        loadinit;
        
        test     = "MTHI";
        Func     = `MTHI;
        In       = {
            $urandom_range(32'hFFFFFFFF, 0),
            $urandom_range(32'hFFFFFFFF, 0)
        };
        
        expected = {In[31:0], init[31:0]};
        
        checkop;
    end
    
    
    
    count = 0;
    
    $display("Testing MTLO... ");
    
    for (int i = 0; i < test_count; i++)
    begin
    
        count    = i + 1;
        
        init     = {
            $urandom_range(32'hFFFFFFFF, 0),
            $urandom_range(32'hFFFFFFFF, 0)
        };
        loadinit;
        
        test     = "MTLO";
        Func     = `MTLO;
        In       = {
            $urandom_range(32'hFFFFFFFF, 0),
            $urandom_range(32'hFFFFFFFF, 0)
        };
        
        expected = {init[63:32], In[31:0]};
        
        checkop;
    end
    
    
    
    count = 0;
    
    $display("Testing MULT... ");
    
    for (int i = 0; i < test_count; i++)
    begin
    
        count    = i + 1;
        
        init     = {
            $urandom_range(32'hFFFFFFFF, 0),
            $urandom_range(32'hFFFFFFFF, 0)
        };
        loadinit;
        
        test     = "MULT";
        Func     = `MULT;
        In       = {
            $urandom_range(32'hFFFFFFFF, 0),
            $urandom_range(32'hFFFFFFFF, 0)
        };
        
        expected = In;
        
        checkop;
        
    end
    
    
    
    count = 0;
    
    $display("Testing MULTU... ");
    
    for (int i = 0; i < test_count; i++)
    begin
    
        count    = i + 1;
        
        init     = {
            $urandom_range(32'hFFFFFFFF, 0),
            $urandom_range(32'hFFFFFFFF, 0)
        };
        loadinit;
        
        test     = "MULTU";
        Func     = `MULTU;
        In       = {
            $urandom_range(32'hFFFFFFFF, 0),
            $urandom_range(32'hFFFFFFFF, 0)
        };
        
        expected = In;
        
        checkop;
    end
    
    
    
    count = 0;
    
    $display("Testing ACCEn = 0... ");
    
    for (int i = 0; i < test_count; i++)
    begin
    
        count    = i + 1;
        
        init     = {
            $urandom_range(32'hFFFFFFFF, 0),
            $urandom_range(32'hFFFFFFFF, 0)
        };
        loadinit;
        
        test     = "MULT";
        Func     = `MULT;
        In       = {
            $urandom_range(32'hFFFFFFFF, 0),
            $urandom_range(32'hFFFFFFFF, 0)
        };
        
        expected = init;
        
        ACCEn = 0;
        checkop;
    end
    
    
    
    $display("All tests passed.");
    $finish;
    
end

task loadinit;

    ACCEn = 1;
    Func  = `MULT;
    In    = init;
    #clk;

endtask

task loadresult;

    ACCEn = 1;
    Func  = `MFHI;
    #clk result[63:32] = Out;
    
    Func  = `MFLO;
    #clk result[31: 0] = Out;

endtask

task checkassert;
    
    #clk

    assert (Out == out)
    else
    begin
        $display("ERROR: %s test no. %0d",    test, count);
        $display("       Output           Expected"       );
        $display("ACCEn  %b"                  , ACCEn     );
        $display("init   %h"                  , init      );
        $display("In     %h"                  , In        );
        $display("Out    %h         %h"       , Out, out  );
        $fatal;
    end
endtask

task checkop;
    
    #clk
    
    loadresult;

    assert (result == expected)
    else
    begin
        $display("ERROR: %s test no. %0d",      test  , count   );
        $display("       Output           Expected"             );
        $display("ACCEn  %b"                  , ACCEn           );
        $display("init   %h"                  , init      );
        $display("In     %h"                  , In              );
        $display("Result %h %h"               , result, expected);
        $fatal;
    end
endtask


endmodule
