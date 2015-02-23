#------------------------------------------------------------------------------
# File              : syn_script.tcl
# Description       : Synthesis script
# Primary Author    : Dominic Murphy
# Other Contributors:
#------------------------------------------------------------------------------

source library_Setup

#analyze -format sverilog {../src/processor.sv}

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

check_timing
create_clock i_clk -name i_clk -period 10
set_max_area 0
ungroup -all -flatten
compile -map_effort high -incremental_mapping
report_area > synth_area.rpt
report_power > synth_power.rpt
report_timing > synth_timing.rpt
report_qor > synth_summary.rpt
change_names -rules verilog -hierarchy -verbose

write -f verilog -hierarchy -output "processor_synth.v"

write_sdc design.sdc
write_sdf design.sdf

exit
