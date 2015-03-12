#------------------------------------------------------------------------------
# File              : syn_script.tcl
# Description       : Synthesis script used to run synthesis
# Primary Author    : Dominic Murphy
# Other Contributors:
# Notes             : Relies on CLK_PERIOD and TYPE being defined and passed in. Fatal otherwise.
#                     SCAN can be set to "-scan" to have a scan path inserted.
#------------------------------------------------------------------------------

source ../library_Setup

#analyze -format sverilog {../../src/processor.sv}

analyze -format sverilog {
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

if ("$SCAN"=="-scan") {set_scan_configuration -style multiplexed_flip_flop}

check_timing
create_clock Clock -name Clock -period $CLK_PERIOD
set_fix_hold Clock

if ("$SCAN"=="-scan") {
set_dft_signal -type ScanClock -port Clock -view exist -timing {45 55}
set_dft_signal -view existing_dft -port nReset -type Reset -active 0
set_dft_configuration -fix_set enable fix_reset enable
set_df_signal view spec -port nReset -type TestData
set_autofix_configuration -type reet -test_data nReset
create_test_protocol 
insert_dft }

if ("$TYPE"=="opt") {compile_ultra ${SCAN}}
if ("$TYPE"=="basic") {compile ${SCAN}}

report_area > ../logs/synth_area_${TYPE}_${CLK_PERIOD}ns.rpt
report_power > ../logs/synth_power_${TYPE}_${CLK_PERIOD}ns.rpt
report_timing > ../logs/synth_timing_${TYPE}_${CLK_PERIOD}ns.rpt
report_qor > ../logs/synth_summary_${TYPE}_${CLK_PERIOD}ns.rpt
change_names -rules verilog -hierarchy -verbose

if ("$SCAN"=="-scan") {write_test_protocol -out top.spf}
write -f verilog -hierarchy -output "../processor_synth.v"

write_sdc design.sdc
write_sdf design.sdf

exit
