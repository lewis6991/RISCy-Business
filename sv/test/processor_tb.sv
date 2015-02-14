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

logic [31:0] instrData    ;
wire  [15:0] instrAddr    ,
             memAddr      ;
wire  [31:0] memRData     ,
             memWData     ;
wire         memReadEn    ,
             memWriteEn   ;

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

//Testing procedure
initial
begin
    $display("\nINFO: Starting Test...\n");
    // De-assert reset after non-integer amount of clock cycles.
    #(5.5*clk) nReset = 1;
end

// Control test depending on program counter.
always @ (posedge Clock)
    case(instrAddr)
        16'h0000: instrData <= #20 32'h3C011234; // LUI $1 'h1234
        16'h0004: instrData <= #20 32'h00000000; // NOP
        16'h0008: instrData <= #20 32'h00000000; // NOP
        16'h000C: instrData <= #20 32'h00000000; // NOP
        16'h0010: instrData <= #20 32'h00000000; // NOP
        16'h0014: instrData <= #20 32'h34215678; // ORI $1 'h5678
        16'h0018: instrData <= #20 32'h00000000; // NOP
        16'h001C: instrData <= #20 32'h00000000; // NOP
        16'h0020: instrData <= #20 32'h00000000; // NOP
        16'h0024: instrData <= #20 32'h00000000; // NOP
        16'h0028: instrData <= #20 32'h3C025555; // LUI $2 'h5555
        16'h002C: instrData <= #20 32'h00000000; // NOP
        16'h0030: instrData <= #20 32'h00000000; // NOP
        16'h0034: instrData <= #20 32'h00000000; // NOP
        16'h0038: instrData <= #20 32'h00000000; // NOP
        16'h003C: instrData <= #20 32'h34427777; // ORI $2 'h7777
        16'h0040: instrData <= #20 32'h00000000; // NOP
        16'h0044: instrData <= #20 32'h00000000; // NOP
        16'h0048: instrData <= #20 32'h00000000; // NOP
        16'h004C: instrData <= #20 32'h00000000; // NOP
        16'h0050: instrData <= #20 32'h00411820; // ADD $3 $1 $2
        16'h0054: instrData <= #20 32'h00000000; // NOP
        16'h0058: finish_test();
        default : instrData <= #20 32'h00000000; // NOP by default
    endcase

function void check_register(int reg_no, int reg_val);
    int act_reg_val;
    // Assignment needs to go on seperate line to work.
    act_reg_val = int'(prcsr0.de0.reg0.data[reg_no]);

    assert (act_reg_val == reg_val)
        $display("INFO: \$%0d == 32'h%H", reg_no, reg_val);
    else
        $error("ERROR: \$%0d != 32'h%H, value is 32'h%H",
            reg_no, reg_val, act_reg_val);
endfunction

function void finish_test();
    $display("INFO: Checking register values...");
    check_register(1, 32'h12345678);
    check_register(2, 32'h55557777);
    check_register(3, 32'h12345678 + 32'h55557777);
    $display("\nINFO: Test Finished.\n");
    $finish;
endfunction

endmodule
