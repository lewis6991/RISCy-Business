//----------------------------------------
// File: alu_tb.sv
// Description: ALU testbench
// Primary Author: Ethan Bishop
// Other Contributors: Jack Barnes
// Notes: Full test coverage of ALU instructions
//        Select sample for each instruction
//        Uses adapted checkassert from decoder_tb
//----------------------------------------

`include "alu_definition.sv"

module alu_tb;

timeunit 10ns; timeprecision 100ps;
const int clk = 100;

logic [31:0] A    ,
             B    ;
logic [ 4:0] Shamt;
logic [ 5:0] Func ;
logic [31:0] Out  ;
logic        En   ,
             C    ,
             Z    ,
             O    ,
             N    ;

alu alu0 (
    .A       (A    ),
    .B       (B    ),
    .Shamt   (Shamt),
    .ALUfunc (Func ),
    .Out     (Out  ),
    .En      (En   ),
    .C       (C    ),
    .Z       (Z    ),
    .O       (O    ),
    .N       (N    )
);

//Number of tests to run per instruction
parameter test_count = 32'hFFFF;

int count;

string test;

logic [31:0] out;
logic        carry,
             zero,
             neg,
             over,
             en;

//Initial conditions
initial
begin
    A     = 0;
    B     = 0;
    Shamt = 0;
    Func  = 0;
    
    count = 0;
end

//Testing procedure
initial
begin
    
    $display("Testing ADD... ");
    
    for (int i = 0; i < test_count; i++)
    begin
    
        count = i + 1;
        
        test  = "ADD";
        Func  = `ADD;
        A     = $urandom_range(32'hFFFFFFFF, 0);
        B     = $urandom_range(32'hFFFFFFFF, 0);
        
        {carry, out} = (A + B);
        neg   = out[31];
        zero  = (out == 0);
        over  = (A[31] == B[31]) & (A[31] ^ neg);
        en    = 1;
        
        checkassert;
    end
    
    
    
    $display("Testing ADDU... ");
    
    for (int i = 0; i < test_count; i++)
    begin
    
        count = i + 1;
        
        test  = "ADDU";
        Func  = `ADDU;
        A     = $urandom_range(32'hFFFFFFFF, 0);
        B     = $urandom_range(32'hFFFFFFFF, 0);
        
        {carry, out} = (A + B);
        neg   = out[31];
        zero  = (out == 0);
        over  = carry;
        en    = 1;
        
        checkassert;
    end
    
    
    
    $display("Testing SUB... ");
    
    for (int i = 0; i < test_count; i++)
    begin
    
        count = i + 1;
        
        test  = "SUB";
        Func  = `SUB;
        A     = $urandom_range(32'hFFFFFFFF, 0);
        B     = $urandom_range(32'hFFFFFFFF, 0);
        
        {carry, out} = (A - B);
        neg   = out[31];
        zero  = (out == 0);
        over  = (A[31] == B[31]) && (A[31] ^ neg);
        en    = 1;
        
        checkassert;
    end
    
    
    
    $display("Testing SUBU... ");
    
    for (int i = 0; i < test_count; i++)
    begin
    
        count = i + 1;
        
        test  = "SUBU";
        Func  = `SUBU;
        A     = $urandom_range(32'hFFFFFFFF, 0);
        B     = $urandom_range(32'hFFFFFFFF, 0);
        
        {carry, out} = (A - B);
        neg   = out[31];
        zero  = (out == 0);
        over  = carry;
        en    = 1;
        
        checkassert;
    end
    
    
    
    over  = 0;
    carry = 0;
    
    
        
    $display("Testing SLL... ");
    
    for (int i = 0; i < test_count; i++)
    begin
    
        count = i + 1;
        
        test  = "SLL";
        Func  = `SLL;
        Shamt = $urandom_range(5'h1F, 0);
        B     = $urandom_range(32'hFFFFFFFF, 0);
        
        out   = (B << Shamt);
        neg   = out[31];
        zero  = (out == 0);
        en    = 1;
        
        checkassert;
    end
    
    
    
    $display("Testing SLLV... ");
    
    for (int i = 0; i < test_count; i++)
    begin
    
        count = i + 1;
        
        test  = "SLLV";
        Func  = `SLLV;
        A     = $urandom_range(32'hFFFFFFFF, 0);
        B     = $urandom_range(32'hFFFFFFFF, 0);
        
        out   = (B << A);
        neg   = out[31];
        zero  = (out == 0);
        en    = 1;
        
        checkassert;
    end
    
    
    
    $display("Testing SRA... ");
    
    for (int i = 0; i < test_count; i++)
    begin
    
        count = i + 1;
        
        test  = "SRA";
        Func  = `SRA;
        Shamt = $urandom_range(5'h1F, 0);
        B     = $urandom_range(32'hFFFFFFFF, 0);
        
        out   = (int'(B) >>> int'(Shamt));
        neg   = out[31];
        zero  = (out == 0);
        en    = 1;
        
        checkassert;
    end
    
    
    
    $display("Testing SRAV... ");
    
    for (int i = 0; i < test_count; i++)
    begin
    
        count = i + 1;
        
        test  = "SRAV";
        Func  = `SRAV;
        A     = $urandom_range(32'hFFFFFFFF, 0);
        B     = $urandom_range(32'hFFFFFFFF, 0);
        
        out   = (int'(B) >>> int'(A));
        neg   = out[31];
        zero  = (out == 0);
        en    = 1;
        
        checkassert;
    end
    
    
    
    $display("Testing SRL... ");
    
    for (int i = 0; i < test_count; i++)
    begin
    
        count = i + 1;
        
        test  = "SRL";
        Func  = `SRL;
        Shamt = $urandom_range(5'h1F, 0);
        B     = $urandom_range(32'hFFFFFFFF, 0);
        
        out   = (B >> Shamt);
        neg   = out[31];
        zero  = (out == 0);
        en    = 1;
        
        checkassert;
    end
    
    
    
    $display("Testing SRLV... ");
    
    for (int i = 0; i < test_count; i++)
    begin
    
        count = i + 1;
        
        test  = "SRLV";
        Func  = `SRLV;
        A     = $urandom_range(32'hFFFFFFFF, 0);
        B     = $urandom_range(32'hFFFFFFFF, 0);
        
        out   = (B >> A);
        neg   = out[31];
        zero  = (out == 0);
        en    = 1;
        
        checkassert;
    end
    
    
    
    $display("Testing AND... ");
    
    for (int i = 0; i < test_count; i++)
    begin
    
        count = i + 1;
        
        test  = "AND";
        Func  = `AND;
        A     = $urandom_range(32'hFFFFFFFF, 0);
        B     = $urandom_range(32'h1FFFFFFF, 0);
        
        out   = (A & B);
        neg   = out[31];
        zero  = (out == 0);
        en    = 1;
        
        checkassert;
    end
    
    
    
    $display("Testing NOR... ");
    
    for (int i = 0; i < test_count; i++)
    begin
    
        count = i + 1;
        
        test  = "NOR";
        Func  = `NOR;
        A     = $urandom_range(32'hFFFFFFFF, 0);
        B     = $urandom_range(32'hFFFFFFFF, 0);
        
        out   = ~(A | B);
        neg   = out[31];
        zero  = (out == 0);
        en    = 1;
        
        checkassert;
    end
    
    
    
    $display("Testing OR... ");
    
    for (int i = 0; i < test_count; i++)
    begin
    
        count = i + 1;
        
        test  = "OR";
        Func  = `OR;
        A     = $urandom_range(32'hFFFFFFFF, 0);
        B     = $urandom_range(32'h1FFFFFFF, 0);
        
        out   = (A | B);
        neg   = out[31];
        zero  = (out == 0);
        en    = 1;
        
        checkassert;
    end
    
    
    
    $display("Testing XOR... ");
    
    for (int i = 0; i < test_count; i++)
    begin
    
        count = i + 1;
        
        test  = "XOR";
        Func  = `XOR;
        A     = $urandom_range(32'hFFFFFFFF, 0);
        B     = $urandom_range(32'hFFFFFFFF, 0);
        
        out   = (A ^ B);
        neg   = out[31];
        zero  = (out == 0);
        en    = 1;
        
        checkassert;
    end
    
    
    
    $display("Testing MOVN... ");
    
    for (int i = 0; i < test_count; i++)
    begin
    
        count = i + 1;
        
        test  = "MOVN";
        Func  = `MOVN;
        A     = $urandom_range(32'hFFFFFFFF, 0);
        B     = $urandom_range(32'hFFFFFFFF, 0);
        
        out   = A;
        neg   = out[31];
        zero  = (out == 0);
        en    = (B != 0);
        
        checkassert;
    end
    
    
    
    $display("Testing MOVZ... ");
    
    for (int i = 0; i < test_count; i++)
    begin
    
        count = i + 1;
        
        test  = "MOVZ";
        Func  = `MOVZ;
        A     = $urandom_range(32'hFFFFFFFF, 0);
        B     = $urandom_range(32'hFFFFFFFF, 0);
        
        out   = A;
        neg   = out[31];
        zero  = (out == 0);
        en    = (B == 0);
        
        checkassert;
    end
    
    
    
    $display("Testing SLT... ");
    
    for (int i = 0; i < test_count; i++)
    begin
    
        count = i + 1;
        
        test  = "SLT";
        Func  = `SLT;
        A     = $urandom_range(32'hFFFFFFFF, 0);
        B     = $urandom_range(32'hFFFFFFFF, 0);
        
        out   = (int'(A) < int'(B));
        neg   = out[31];
        zero  = (out == 0);
        en    = 1;
        
        checkassert;
    end
    
    
    
    $display("Testing SLTU... ");
    
    for (int i = 0; i < test_count; i++)
    begin
    
        count = i + 1;
        
        test  = "SLTU";
        Func  = `SLTU;
        A     = $urandom_range(32'hFFFFFFFF, 0);
        B     = $urandom_range(32'hFFFFFFFF, 0);
        
        out   = (unsigned'(A) < unsigned'(B));
        neg   = out[31];
        zero  = (out == 0);
        en    = 1;
        
        checkassert;
    end
    
    
    
    $display("Testing CLZ... ");
    
    for (int i = 0; i < test_count; i++)
    begin
    
        count = i + 1;
        
        test  = "CLZ";
        Func  = `ALU_CLZ;
        A     = $urandom_range(32'hFFFFFFFF, 0);

        out   = 0;        
        for (int j = 31; j >= 0; j--)
            if (~A[j])
                out++;
            else
                break;
        
        neg   = out[31];
        zero  = (out == 0);
        en    = 1;
        
        checkassert;
    end
    
    
    
    $display("Testing CLO... ");
    
    for (int i = 0; i < test_count; i++)
    begin
    
        count = i + 1;
        
        test  = "CLO";
        Func  = `ALU_CLO;
        A     = $urandom_range(32'hFFFFFFFF, 0);
        
        out   = 0;
        for (int j = 31; j >= 0; j--)
            if (A[j])
                out++;
            else
                break;
        
        neg   = out[31];
        zero  = (out == 0);
        en    = 1;
        
        checkassert;
    end
    
    
    
    $display("All tests passed.");
    
end


task checkassert;
    
    #clk

    assert ({out, en, carry, zero, over, neg} == {Out, En, C, Z, O, N})
    else
    begin
        $display("ERROR: %s test no. %0d", test, count);
        $display("      Output   Expected"       );
        $display("A     %h"          , A         );
        $display("B     %h"          , B         );
        $display("Shamt %h"          , Shamt     );
        $display("Out   %h %h"       , Out, out  );
        $display("En    %b        %b", En , en   );
        $display("C     %b        %b", C  , carry);
        $display("Z     %b        %b", Z  , zero );
        $display("O     %b        %b", O  , over );
        $display("N     %b        %b", N  , neg  );
        $fatal;
    end
endtask


endmodule
