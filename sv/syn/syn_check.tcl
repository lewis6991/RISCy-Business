#------------------------------------------------------------------------------
# File              : syn_check.tcl
# Description       : Script will read in files and report potential issues
# Primary Author    : Dominic Murphy
# Other Contributors:
#------------------------------------------------------------------------------

source library_Setup

analyze -library WORK -format sverilog {
../src/signextend.sv
../src/registers.sv 
../src/processor.sv 
../src/pcinc.sv 
../src/pc.sv 
../src/op_definition.sv 
../src/nleftshift.sv 
../src/mux.sv 
../src/mult.sv 
../src/mul_definition.sv 
../src/ex_mult.sv 
../src/ex_control.sv 
../src/decoder.sv
../src/alu_definition.sv 
../src/alu.sv 
../src/acc_control.sv 
../src/WB.sv 
../src/PIPE.sv 
../src/MEM.sv 
../src/IF.sv 
../src/EX.sv 
../src/DEC.sv
}

elaborate PROCESSOR -architecture verilog -library DEFAULT

check_design

exit