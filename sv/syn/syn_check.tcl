#------------------------------------------------------------------------------
# File              : syn_check.tcl
# Description       : Script will read in files and report potential issues
# Primary Author    : Dominic Murphy
# Other Contributors:
#------------------------------------------------------------------------------

source ../library_Setup

analyze -format sverilog {
../../src/alu_definition.sv
../../src/op_definition.sv
../../src/mul_definition.sv
../../src/branch_definition.sv
../../src/mem_func.sv
../../src/registers.sv
../../src/mult1.sv
../../src/ex_mult.sv
../../src/decoder.sv
../../src/branch.sv
../../src/addrcalc.sv
../../src/alu.sv
../../src/acc_control.sv
../../src/WB.sv
../../src/MEM.sv
../../src/IF.sv
../../src/HDU.sv
../../src/FU.sv
../../src/EX1.sv
../../src/EX2.sv
../../src/DEC.sv
../../src/processor.sv
}

elaborate PROCESSOR -architecture verilog -library DEFAULT

link
check_design

exit
