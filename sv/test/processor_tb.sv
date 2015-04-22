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
`include "classes/instruction.sv"

module processor_tb;

// These functions are provided by complib.so
import "DPI-C" function void set_compile_script(string arg);
import "DPI-C" function void compile_test(string arg);
import "DPI-C" function int  get_instruction_count();
import "DPI-C" function int  get_instruction(int index);

int       clk_p      = 100 ;
logic     Clock      = 1'b0,
          nReset     = 1'b0;
int       cycles     = 0   ,
          test_no    = 1   ,
          inst_count = 0   ;
string    sdf_file         ;

logic [31:0] instrData = 0;
logic [ 4:0] regAddr = 0;
wire  [15:0] rtlPC      ,
             modelPC    ,
             memAddr    ,
             memAddrM   ;
wire  [31:0] memRData   ,
             memWData   ,
             memRDataM  ,
             memWDataM  ,
             regData    ;
wire         memReadEn  ,
             memWriteEn ,
             memReadEnM ,
             memWriteEnM,
             memWriteL  ,
             memWriteR  ,
             nStall     ;


bit signed [0:31][31:0] register;
wire [4:0] cAddr;

event reg_check_start;
event reg_check_end  ;

processor_model pmodel0(
    .Clock      (Clock      ),
    .nReset     (nReset     ),
    .Instruction(instrData  ),
    .InstAddr   (modelPC    ),
    .Register   (register   ),
    .cAddr      (cAddr      ),
    .MemRData   (memRDataM  ),
    .MemWData   (memWDataM  ),
    .MemAddr    (memAddrM   ),
    .MemWrite   (memWriteEnM),
    .MemRead    (memReadEnM ),
    .Stall      (~nStall    )
);

PROCESSOR prcsr0 (
    .Clock    (Clock     ),
    .nReset   (nReset    ),
    .InstrMem (instrData ),
    .InstrAddr(rtlPC     ),
    .MemData  (memRData  ),
    .WriteData(memWData  ),
    .MemAddr  (memAddr   ),
    .MemWrite (memWriteEn),
    .MemRead  (memReadEn ),
    .WriteL   (memWriteL ),
    .WriteR   (memWriteR ),
    .RegAddr  (regAddr   ),
    .RegData  (regData   ),
    .nStall   (nStall    )
);

memory memory0 (
    .Clock    (Clock     ),
    .nReset   (nReset    ),
    .Address  (memAddr   ),
    .ReadEn   (memReadEn ),
    .ReadData (memRData  ),
    .WriteEn  (memWriteEn),
    .WriteL   (memWriteL ),
    .WriteR   (memWriteR ),
    .WriteData(memWData  )
);
//-------------------------------------------------------------------------------
// Properties ------------------------------------------------------------------
//-------------------------------------------------------------------------------
property p_reg0_data;
    @ (posedge Clock)
    register[0] == 0;
endproperty

property p_pc_value;
    @ (posedge Clock)
    if (nReset)
        rtlPC == modelPC;
endproperty
//-------------------------------------------------------------------------------
// Assertions -------------------------------------------------------------------
//-------------------------------------------------------------------------------
REG0_ASSERT: assert property (p_reg0_data)
else
    $error("ERROR: Reg $0 contains a non-zero value(%8h).", register[0]);

PC_ASSERT: assert property (p_pc_value)
else
    $error("ERROR: program counter mismatch. rtlPC = %d, modelPC = %d.",
        rtlPC, modelPC);
//-------------------------------------------------------------------------------

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
    @(posedge Clock)

    REG_DATA_ASSERT: assert (regData == reg_val)
        $display("INFO: Register check (actual: %8h == model: %8h).",
            regData, reg_val);
    else
        $error("ERROR: Register mismatch $%2d (actual: %8h != model: %8h).",
            regAddr, regData, reg_val);

    -> reg_check_end;
endtask

//Testing procedure
initial
begin
    `ifdef SDF_FILE
        `define STRINGIFY(x) `"x`"
        $sdf_annotate(`STRINGIFY(`SDF_FILE), prcsr0,,,"MAXIMUM");
    `endif

    void'($value$plusargs("test=%d", test_no));
    void'($value$plusargs("clk_p=%d", clk_p));

    // De-assert reset after non-integer amount of clock cycles.
    #(5.2*clk_p) nReset = 1;

    if ($test$plusargs("random"))
    begin
        $display("\nINFO: Starting Random Test...\n");
        run_random();
    end
    else
    begin
        // This is function is only needed to specify where the compile script
        // resides. Implementing this function allows us to rename and move the
        // script if we ever need.
        set_compile_script("../sw/compile2int");

        // Compile the test file so we can fetch instructions.
        compile_test($sformatf("../sw/testcase%0d", test_no));

        // Get the amount of instructions in the testcase so we can set a finish
        // point.
        inst_count = get_instruction_count();

        $display("\nINFO: Testcase %0d selected.", test_no);
        $display("\nINFO: Starting Test...\n");

        run_testcase();
    end
end

task run_random();
    Instruction new_inst;

    repeat(1000)
    begin
        @ (posedge Clock)
        #20
        new_inst = new();
        void'(new_inst.randomize());
        instrData = new_inst.getInstruction();
    end
    finish_test();
endtask

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
task run_testcase();
    while(1)
    begin
        @ (posedge Clock)
        if(rtlPC[15:2] < inst_count)
            instrData <= #50 get_instruction(rtlPC[15:2]);
        else if(rtlPC[15:2] >= inst_count + 10)
            finish_test();
        else
            instrData <= #50 0;
    end
endtask

task finish_test();
    $display("\nINFO: Test Finished.\n");
    $finish;
endtask

//initial begin
//    $dumpfile("top.vcd");
//    $dumpvars;
//end

endmodule
