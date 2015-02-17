//------------------------------------------------------------------------------
// File              : processor_tb.sv
// Description       : Processor testbench
// Primary Author    : Lewis Russell
// Other Contributors: Jack Barnes
// Notes             : Full test coverage of MIPS instructions
//                     Select sample for each instruction
//------------------------------------------------------------------------------

`include "memory.sv"

module processor_tb;

timeunit 10ns; timeprecision 100ps;
parameter clk = 100;

logic Clock  = 1'b0,
      nReset = 1'b0;

logic [31:0] instrData ;
wire  [15:0] instrAddr ,
             memAddr   ;
wire  [31:0] memRData  ,
             memWData  ;
wire         memReadEn ,
             memWriteEn;

PROCESSOR prcsr0 (
    .Clock    (Clock     ),
    .nReset   (nReset    ),
    .InstrMem (instrData ),
    .InstrAddr(instrAddr ),
    .MemData  (memRData  ),
    .WriteData(memWData  ),
    .MemAddr  (memAddr   ),
    .MemWrite (memWriteEn),
    .MemRead  (memReadEn )
);

memory memory0 (
    .Clock    (Clock     ),
    .nReset   (nReset    ),
    .Address  (memAddr   ),
    .ReadEn   (memReadEn ),
    .ReadData (memRData  ),
    .WriteEn  (memWriteEn),
    .WriteData(memWData  )
);

//Clock implementation
always
    #(clk/2) Clock = ~Clock;

logic [31:0] program_memory[$];

logic [31:0] testcase_memory_1[$] = {
    32'h3C011234, // LUI $1 'h1234
    32'h34215678, // ORI $1 'h5678
    32'h3C025555, // LUI $2 'h5555
    32'h34427777, // ORI $2 'h7777
    32'h00411820, // ADD $3 $1 $2
    32'h00000000  // NOP
};

logic [31:0] testcase_memory_2[$] = {
    32'h3C011234, // li     $1,      0x12340000
    32'h34215678, // ori    $1,  $1, 0x5678
    32'h3C020123, // li     $2,      0x01230000
    32'h34424567, // ori    $2,  $2, 0x4567
    32'h00221820, // add    $3,  $1, $2
    32'h00222022, // sub    $4,  $1, $2
    32'h20455500, // addi   $5,  $2, 0x5500
    32'h00223024, // and    $6,  $1, $2
    32'h30277654, // andi   $7,  $1, 0x7654
    32'h00224025, // or     $8,  $1, $2
    32'h00224826, // xor    $9,  $1, $2
    32'h00225027, // nor   $10,  $1, $2
    32'h382B5555, // xori  $11,  $1, 0x5555
    32'h302CFFFF, // andi  $12,  $1, 0xFFFF
    32'h718D6820, // clz   $13, $12
    32'h000C7022, // sub   $14,  $0, $12
    32'h71CF7821, // clo   $15, $14
    32'h00228021, // addu  $16,  $1, $2
    32'h00228823, // subu  $17,  $1, $2
    32'h24525500, // addiu $18,  $2, 0x5500
    32'h00000000  // nop
};

logic [31:0] testcase_memory_3[$] = {
    32'h3C011234, // li    $1,     0x12340000
    32'h34215678, // ori   $1, $1, 0x5678
    32'h3C020123, // li    $2,     0x01230000
    32'h34424567, // ori   $2, $2, 0x4567
    32'h70221802, // mul   $3, $1, $2
    32'h00200011, // mthi  $1
    32'h00200013, // mtlo  $1
    32'h00220018, // mult  $1, $2
    32'h00002010, // mfhi  $4
    32'h00002812, // mflo  $5
    32'h70220000, // madd  $1, $2
    32'h00003010, // mfhi  $6
    32'h00003812, // mflo  $7
    32'h70420004, // msub  $2, $2
    32'h00004010, // mfhi  $8
    32'h00004812, // mflo  $9
    32'h70420001, // maddu $2, $2
    32'h00005010, // mfhi  $10
    32'h00005812, // mflo  $11
    32'h70420005, // msubu $2, $2
    32'h00006010, // mfhi  $12
    32'h00006812, // mflo  $13
    32'h00220019, // multu $1, $2
    32'h00007010, // mfhi  $14
    32'h00007812, // mflo  $15
    32'h00200011, // mthi  $1
    32'h00400013, // mtlo  $2
    32'h00008010, // mfhi  $16
    32'h00008812, // mflo  $17
    32'h00000000  // nop
};

int test_no = 1;

//Testing procedure
initial
begin
    void'($value$plusargs("test=%d", test_no));
    case (test_no)
        1      : program_memory = testcase_memory_1;
        2      : program_memory = testcase_memory_2;
        3      : program_memory = testcase_memory_3;
        default:
            assert (0)
            else
                $fatal(1, "FATAL: Testcase %0d does not exist.", test_no);
    endcase
    $display("\nINFO: Testcase %0d selected.", test_no);
    $display("\nINFO: Starting Test...\n");
    // De-assert reset after non-integer amount of clock cycles.
    #(5.5*clk) nReset = 1;
end


// Control test depending on program counter.
always @ (posedge Clock)
    if(instrAddr/4 < program_memory.size())
        instrData <= #20 program_memory[instrAddr/4];
    else if(instrAddr/4 == program_memory.size())
        finish_test();
    else
        instrData <= #20 0;

function void check_register(int reg_no, int reg_val);
    int act_reg_val;
    // Assignment needs to go on seperate line to work.
    act_reg_val = int'(prcsr0.de0.reg0.data[reg_no]);

    assert (act_reg_val == reg_val)
    $display("INFO: \$%-2d == 32'h%x", reg_no, reg_val);
    else
    $error("ERROR: \$%0d != 32'h%H, value is 32'h%H",
    reg_no, reg_val, act_reg_val);
endfunction

function void finish_test();
    static int var1 = 32'h12345678;
    $display("INFO: Checking register values...");
    case (test_no)
        1: begin
            static int var2 = 32'h55557777;
            check_register(1, var1       );
            check_register(2, var2       );
            check_register(3, var1 + var2);
        end

        2: begin
            static int var2 = 32'h01234567;
            static int imm1 = 16'h5500    ;
            static int imm2 = 16'hFFFF    ;
            static int imm3 = 16'h7654    ;
            static int imm4 = 16'h5555    ;
            check_register( 1, var1          );
            check_register( 2, var2          );
            check_register( 3, var1 + var2   );
            check_register( 4, var1 - var2   );
            check_register( 5, var2 + imm1   );
            check_register( 6, var1 & var2   );
            check_register( 7, var1 & imm3   );
            check_register( 8, var1 | var2   );
            check_register( 9, var1 ^ var2   );
            check_register(10, ~(var1 | var2));
            check_register(11, var1 ^ imm4   );
            check_register(12, var1 & imm2   );
            check_register(13, 32'h00000011  );
            check_register(14, -(var1 & imm2));
            check_register(15, 32'h00000011  );
            check_register(16, var1 + var2   );
            check_register(17, var1 - var2   );
            check_register(18, var2 + imm1   );
        end

        3: begin
            static int var2 = 32'h01234567;
            static longint prd1 = var1*var2;
            static longint prd2 = prd1 + var1*var2;
            static longint prd3 = prd2 - var2*var2;
            static longint prd4 = prd3 + var2*var2;
            static longint prd5 = prd4 - var2*var2;
            check_register(1 , var1       );
            check_register(2 , var2       );
            check_register(3 , prd1[31: 0]);
            check_register(4 , prd1[63:32]);
            check_register(5 , prd1[31: 0]);
            check_register(6 , prd2[63:32]);
            check_register(7 , prd2[31: 0]);
            check_register(8 , prd3[63:32]);
            check_register(9 , prd3[31: 0]);
            check_register(10, prd4[63:32]);
            check_register(11, prd4[31: 0]);
            check_register(12, prd5[63:32]);
            check_register(13, prd5[31: 0]);
            check_register(14, prd1[31: 0]);
            check_register(15, prd1[63:32]);
            check_register(16, var1       );
            check_register(17, var2       );
        end

        default:
            assert(0)
            else
                $warning("WARNING: Checking has not been implemented for testcase %0d", test_no);
    endcase
    $display("\nINFO: Test Finished.\n");
    $finish;
endfunction

endmodule
