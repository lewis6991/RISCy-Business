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
logic [ 4:0] regAddr   ;
wire  [15:0] instrAddr ,
             memAddr   ;
wire  [31:0] memRData  ,
             memWData  ,
             regData   ;
wire         memReadEn ,
             memWriteEn;

logic [31:0] registers[1:31];

task read_registers();
    foreach(registers[i])
    begin
        regAddr = i;
        @ (posedge Clock);
        #(clk/2) registers[i] = regData;
    end
endtask

PROCESSOR prcsr0 (
    .Clock    (Clock     ),
    .nReset   (nReset    ),
    .InstrMem (instrData ),
    .InstrAddr(instrAddr ),
    .MemData  (memRData  ),
    .WriteData(memWData  ),
    .MemAddr  (memAddr   ),
    .MemWrite (memWriteEn),
    .MemRead  (memReadEn ),
    .RegAddr  (regAddr   ),
    .RegData  (regData   )
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

const int reg_var1 = 32'h12345678;
const int reg_var2 = 32'h55557777;
const int reg_var3 = 32'h01234567;
const int reg_var4 = 32'h80050000;
const int reg_var5 = 32'h00000004;
const int reg_var6 = 32'h82345678;
const int reg_var7 = 32'h00000011;
const int imm1 = 16'h5500    ;
const int imm2 = 16'hFFFF    ;
const int imm3 = 16'h7654    ;
const int imm4 = 16'h5555    ;

logic [31:0] program_memory[$];
logic [31:0] register_memory[$];

logic [31:0] testcase_memory_1[$] = { `include "testcase1.sv" };
logic [31:0] testcase_memory_2[$] = { `include "testcase2.sv" };
logic [31:0] testcase_memory_3[$] = { `include "testcase3.sv" };
logic [31:0] testcase_memory_4[$] = { `include "testcase4.sv" };
logic [31:0] testcase_memory_5[$] = { `include "testcase5.sv" };

logic [31:0] testcase_registers_1[$] = {
    reg_var1       ,
    reg_var2       ,
    reg_var1 + reg_var2
};

logic [31:0] testcase_registers_2[$] = {
    reg_var1              ,
    reg_var3              ,
    reg_var1 + reg_var3   ,
    reg_var1 - reg_var3   ,
    reg_var3 + imm1       ,
    reg_var1 & reg_var3   ,
    reg_var1 & imm3       ,
    reg_var1 | reg_var3   ,
    reg_var1 ^ reg_var3   ,
    ~(reg_var1 | reg_var3),
    reg_var1 ^ imm4       ,
    reg_var1 & imm2       ,
    32'h00000011          ,
    -(reg_var1 & imm2    ),
    32'h00000011          ,
    reg_var1 + reg_var3   ,
    reg_var1 - reg_var3   ,
    reg_var3 + imm1
};

const longint reg_prd1 = reg_var1*reg_var3           ;
const longint reg_prd2 = reg_prd1 + reg_var1*reg_var3;
const longint reg_prd3 = reg_prd2 - reg_var3*reg_var3;
const longint reg_prd4 = reg_prd3 + reg_var3*reg_var3;
const longint reg_prd5 = reg_prd4 - reg_var3*reg_var3;

logic [31:0] testcase_registers_3[$] = {
    reg_var1       ,
    reg_var3       ,
    reg_prd1[31: 0],
    reg_prd1[63:32],
    reg_prd1[31: 0],
    reg_prd2[63:32],
    reg_prd2[31: 0],
    reg_prd3[63:32],
    reg_prd3[31: 0],
    reg_prd4[63:32],
    reg_prd4[31: 0],
    reg_prd5[63:32],
    reg_prd5[31: 0],
    reg_prd1[63:32],
    reg_prd1[31: 0],
    reg_var1       ,
    reg_var3
};

logic [31:0] testcase_registers_4[$] = {
    reg_var4             ,
    reg_var5             ,
    reg_var4 >>> 5       ,
    reg_var4 >>> reg_var5,
    reg_var4 <<  5       ,
    reg_var4 >>  5       ,
    reg_var4 <<  reg_var5,
    reg_var4 >>  reg_var5,
    (reg_var4 >>  reg_var5 != 0) ? reg_var4 : 32'b0,
    reg_var4 >> 5,
    1,
    1,
    32'h88000000,
    1,
    1
};

logic [31:0] testcase_registers_5[$] = {
    reg_var6,
    reg_var2,
    reg_var2,
    reg_var7,
    reg_var7 + reg_var6,
    reg_var7 + 2*reg_var6,
    reg_var7 + 3*reg_var6,
    reg_var7 + 4*reg_var6,
    reg_var7 + 5*reg_var6,
    reg_var7 + 6*reg_var6,
    reg_var7 + 7*reg_var6,
    reg_var7 + 8*reg_var6
};

int test_no = 1;

//Testing procedure
initial
begin
    void'($value$plusargs("test=%d", test_no));
    case (test_no)

        1: begin
            program_memory  = testcase_memory_1   ;
            register_memory = testcase_registers_1;
        end

        2: begin
            program_memory  = testcase_memory_2   ;
            register_memory = testcase_registers_2;
        end

        3: begin
            program_memory  = testcase_memory_3   ;
            register_memory = testcase_registers_3;
        end

        4: begin
            program_memory  = testcase_memory_4   ;
            register_memory = testcase_registers_4;
        end

        5: begin
            program_memory  = testcase_memory_5   ;
            register_memory = testcase_registers_5;
        end


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
    act_reg_val = int'(registers[reg_no]);

    assert (act_reg_val == reg_val)
    $display("INFO: \$%-2d == 32'h%x", reg_no, reg_val);
    else
    $error("ERROR: \$%0d != 32'h%H, value is 32'h%H",
    reg_no, reg_val, act_reg_val);
endfunction

task finish_test();
    $display("INFO: Checking register values...");

    read_registers();

    foreach (register_memory[i])
        check_register(i + 1, register_memory[i]);

    $display("\nINFO: Test Finished.\n");
    $finish;
endtask

endmodule
