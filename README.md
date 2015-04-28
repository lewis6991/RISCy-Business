# RISCy-Business
MIPS32 Processor Implementation written in SystemVerilog.

Specification:
  * Pipelined with 5 stages.
  * Branch prediction.
  * Data forwarding.
  * All MIPS32 instructions with exception of interrupts and division instructions.
  * 200MHz (potentially).

Testbench specification:
  * Randomly constrained.
  * Stimulus generated from cross-compiler.
  * Inclusion of SystemVerilog assertions.

