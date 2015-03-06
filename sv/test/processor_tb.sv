//------------------------------------------------------------------------------
// File              : processor_tb.sv
// Description       : Processor testbench
// Primary Author    : Lewis Russell
// Other Contributors: Jack Barnes
// Notes             : Full test coverage of MIPS instructions
//                     Select sample for each instruction
//------------------------------------------------------------------------------

`include "memory.sv"
`include "processor_model.sv"

module processor_tb;

timeunit 10ns; timeprecision 100ps;

// These functions are provided by complib.so
import "DPI-C" function void set_compile_script(string arg);
import "DPI-C" function void compile_asm(string arg);
import "DPI-C" function int  get_instruction_count();
import "DPI-C" function int  get_instruction(int index);

parameter clk        = 100 ;
logic     Clock      = 1'b0,
          nReset     = 1'b0;
int       cycles     = 0   ;
int       test_no    = 1   ,
          inst_count = 0   ;

logic [31:0] instrData ;
logic [ 4:0] regAddr   ;
wire  [15:0] instrAddr ,
             instrAddrM,
             memAddr   ;
wire  [31:0] memRData  ,
             memWData  ,
             regData   ,
             regDataM  ;
wire         memReadEn ,
             memWriteEn;

logic [31:0] registers[1:31];
logic [31:0] model_registers[1:31];

processor_model pmodel0(
    .Clock      (Clock     ),
    .nReset     (nReset    ),
    .Instruction(instrData ),
    .rData      (regDataM  ),
    .rAddr      (regAddr   ),
    .InstAddr   (instrAddrM)
);

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

//Testing procedure
initial
begin
    void'($value$plusargs("test=%d", test_no));

    // This is function is only needed to specify where the compile script
    // resides. Implementing this function allows us to rename and move the
    // script if we ever need.
    set_compile_script("../sw/compile2int");

    // Compile the asm file so we can fetch instructions using
    // get_instruction().
    compile_asm($sformatf("../sw/testcase%0d", test_no));

    // Get the amount of instructions in the testcase so we can set a finish
    // point.
    inst_count = get_instruction_count();

    $display("\nINFO: Testcase %0d selected.", test_no);
    $display("\nINFO: Starting Test...\n");
    // De-assert reset after non-integer amount of clock cycles.
    #(5.5*clk) nReset = 1;
end

//Clock implementation
always begin
    #(clk/2) Clock = ~Clock;

    // Timeout mechanism.
    ++cycles;
    assert (cycles < 10000)
    else
        $fatal(1, "FATAL: Timeout");
end

// Control test depending on program counter.
always @ (posedge Clock)
begin
    PC_ASSERT: assert (instrAddr == instrAddrM)
    else
        $error("ERROR: program counter mismatch.");

    if(instrAddr[15:2] < inst_count)
        instrData <= #20 get_instruction(instrAddr[15:2]);
    else if(instrAddr[15:2] == inst_count)
        finish_test();
    else
        instrData <= #20 0;
end

task read_registers();
    foreach(registers[i])
    begin
        regAddr = i;
        @ (posedge Clock);
        #20 registers[i] = regData;
        model_registers[i] = regDataM;
    end
endtask

function check_register(int reg_no, int reg_val);
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

    // Fetch all the register values for checking.
    read_registers();

    foreach (model_registers[i])
        check_register(i, model_registers[i]);

    $display("\nINFO: Test Finished.\n");
    $finish;
endtask

endmodule
