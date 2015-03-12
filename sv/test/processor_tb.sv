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

timeunit 1ns; timeprecision 10ps;

// These functions are provided by complib.so
import "DPI-C" function void set_compile_script(string arg);
import "DPI-C" function void compile_asm(string arg);
import "DPI-C" function int  get_instruction_count();
import "DPI-C" function int  get_instruction(int index);

int       clk_p      = 100 ;
logic     Clock      = 1'b0,
          nReset     = 1'b0;
int       cycles     = 0   ,
          test_no    = 1   ,
          inst_count = 0   ;

logic [31:0] instrData ;
logic [ 4:0] regAddr   ;
wire  [15:0] rtlPC ,
             modelPC,
             memAddr   ;
wire  [31:0] memRData  ,
             memWData  ,
             regData   ,
             regDataM  ;
wire         memReadEn ,
             memWriteEn;

bit signed [0:31][31:0] register;
wire [4:0] cAddr;

event reg_check_start;
event reg_check_end  ;

processor_model pmodel0(
    .Clock      (Clock     ),
    .nReset     (nReset    ),
    .Instruction(instrData ),
    .InstAddr   (modelPC),
    .Register   (register  ),
    .cAddr      (cAddr     )
);

PROCESSOR prcsr0 (
    .Clock    (Clock     ),
    .nReset   (nReset    ),
    .InstrMem (instrData ),
    .InstrAddr(rtlPC ),
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

property reg0_data;
    @ (posedge Clock)
    register[0] == 0;
endproperty

REG0_DATA_ASSERT: assert property (reg0_data)
else
    $error("ERROR: Reg $0 contains a non-zero value(%8h).", register[0]);

// Always block to verify every register change.
always @ (register)
begin
    -> reg_check_start;

    regAddr = cAddr;

    fork
        check_register(regAddr, register[regAddr]);
    join_none
end

task automatic check_register(int reg_addr, int reg_val);
    $display("DEBUG1: addr = %d", reg_addr);
    #(2*clk_p)
    $display("DEBUG2: addr = %d", reg_addr);

    REG_DATA_ASSERT: assert (regData == reg_val)
        $display("INFO: Register check (%8h != %8h).", regData, reg_val);
    else
        $error("ERROR: Register mismatch (%8h != %8h).", regData, reg_val);

    -> reg_check_end;
endtask

//Testing procedure
initial
begin
    void'($value$plusargs("test=%d", test_no));
    void'($value$plusargs("clk_p=%d", clk_p));

    // This is function is only needed to specify where the compile script
    // resides. Implementing this function allows us to rename and move the
    // script if we ever need.
    set_compile_script("../sw/compile2int");

    // Compile the asm file so we can fetch instructions.
    compile_asm($sformatf("../sw/testcase%0d", test_no));

    // Get the amount of instructions in the testcase so we can set a finish
    // point.
    inst_count = get_instruction_count();

    $display("\nINFO: Testcase %0d selected.", test_no);
    $display("\nINFO: Starting Test...\n");

    // De-assert reset after non-integer amount of clock cycles.
    #(5.2*clk_p) nReset = 1;
end

//Clock implementation
always begin
    #(clk_p/2) Clock = ~Clock;

    // Timeout mechanism.
    ++cycles;
    TIMEOUT_CTRL: assert (cycles < 10000)
    else
        $fatal(1, "FATAL: Timeout");
end

// Control test depending on program counter.
always @ (posedge Clock)
begin
    PC_ASSERT: assert (rtlPC == modelPC)
    else
        $error("ERROR: program counter mismatch. rtlPC = %d, modelPC = %d", rtlPC, modelPC);

    if(rtlPC[15:2] < inst_count)
        instrData <= #20 get_instruction(rtlPC[15:2]);
    else if(rtlPC[15:2] == inst_count + 10)
        finish_test();
    else
        instrData <= #20 0;
end

task finish_test();
    $display("\nINFO: Test Finished.\n");
    $finish;
endtask

endmodule
