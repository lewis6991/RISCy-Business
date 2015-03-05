#------------------------------------------------------------------------------
# File              : syn_script.tcl
# Description       : Synthesis script used to run automated synthesis (from higher script)
# Primary Author    : Dominic Murphy
# Other Contributors:
# Notes             : Relies on CLK_PERIOD and TYPE being defined and passed in. Fatal otherwise.
#------------------------------------------------------------------------------

source ../library_Setup

#analyze -format sverilog {../../src/processor.sv}

analyze -library WORK -format sverilog {
../../src/signextend.sv
../../src/registers.sv 
../../src/processor.sv 
../../src/pcinc.sv 
../../src/pc.sv 
../../src/op_definition.sv 
../../src/nleftshift.sv
../../src/muxthree.sv  
../../src/mux.sv
../../src/mult.sv 
../../src/mul_definition.sv 
../../src/ex_mult.sv 
../../src/ex_control.sv 
../../src/decoder.sv
../../src/branch.sv
../../src/alu_definition.sv 
../../src/alu.sv 
../../src/acc_control.sv 
../../src/WB.sv 
../../src/PIPE.sv 
../../src/MEM.sv 
../../src/IF.sv
../../src/HDU.sv
../../src/FU.sv 
../../src/EX.sv 
../../src/DEC.sv
}

elaborate PROCESSOR -architecture verilog -library DEFAULT

check_timing
create_clock Clock -name Clock -period $CLK_PERIOD
set_fix_hold Clock

if ("$TYPE"=="OPT") {compile_ultra}
if ("$TYPE"=="BASIC") {compile}

report_area > synth_area_${TYPE}_${CLK_PERIOD}ns.rpt
report_power > synth_power_${TYPE}_${CLK_PERIOD}ns.rpt
report_timing > synth_timing_${TYPE}_${CLK_PERIOD}ns.rpt
report_qor > synth_summary_${TYPE}_${CLK_PERIOD}ns.rpt
change_names -rules verilog -hierarchy -verbose

write -f verilog -hierarchy -output "../processor_synth.v"

write_sdc design.sdc
write_sdf design.sdf

exit
