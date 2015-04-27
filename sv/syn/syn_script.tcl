#------------------------------------------------------------------------------
# File              : syn_script.tcl
# Description       : Synthesis script used to run synthesis
# Primary Author    : Dominic Murphy
# Other Contributors:
# Notes             : Relies on CLK_PERIOD and TYPE being defined and passed in. Fatal otherwise.
#                     SCAN can be set to "-scan" to have a scan path inserted.
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
../../src/decoder.sv
../../src/clu.sv
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

check_design > ../logs_${CLK_PERIOD}${TYPE}/synth_check_design_${CLK_PERIOD}${TYPE}.rpt

if ($SCAN==1) {set_scan_configuration -style multiplexed_flip_flop}

check_timing
create_clock Clock -name Clock -period $CLK_PERIOD
set_fix_hold Clock
uniquify

set_dont_touch_network [all_clocks]

set_dont_touch_network nReset

set_dont_use c35_CORELIB/ADD*

#set_output_delay -clock Clock [expr $CLK_PERIOD/8] [all_outputs]

if {($TYPE=="opt")   && ($SCAN==1)} {
	compile_ultra -scan -timing_high_effort_script
} elseif {($TYPE=="opt")   && ($SCAN==0)} {
	compile_ultra -timing_high_effort_script
} elseif {($TYPE=="basic") && ($SCAN==1)} {
	compile -scan
} elseif {($TYPE=="basic") && ($SCAN==0)} {
    compile -map_effort high
}

#start_gui

if ($SCAN==1) {
  set_dft_signal -type ScanClock -port Clock -view exist -timing {45 55}
  set_dft_signal -view existing_dft -port nReset -type Reset -active 0
  set_dft_configuration -fix_set enable -fix_reset enable
  set_dft_signal  -view spec -port nReset -type TestData
  set_autofix_configuration -type reset -test_data nReset
  create_test_protocol
  dft_drc
  insert_dft  
  compile_ultra -scan -incremental }

#optimize_registers

report_design > ../logs_${CLK_PERIOD}${TYPE}/synth_design_${CLK_PERIOD}${TYPE}.rpt
report_area > ../logs_${CLK_PERIOD}${TYPE}/synth_area_${CLK_PERIOD}${TYPE}.rpt
report_power > ../logs_${CLK_PERIOD}${TYPE}/synth_power_${CLK_PERIOD}${TYPE}.rpt
report_cell > ../logs_${CLK_PERIOD}${TYPE}/synth_cell_${CLK_PERIOD}${TYPE}.rpt
report_timing > ../logs_${CLK_PERIOD}${TYPE}/synth_timing_${CLK_PERIOD}${TYPE}.rpt
report_resources > ../logs_${CLK_PERIOD}${TYPE}/synth_resources_${CLK_PERIOD}${TYPE}
report_clock -skew -attributes > ../logs_${CLK_PERIOD}${TYPE}/synth_clock_${CLK_PERIOD}${TYPE}.rpt
report_qor > ../logs_${CLK_PERIOD}${TYPE}/synth_summary_${CLK_PERIOD}${TYPE}.rpt
change_names -rules verilog -hierarchy -verbose

if ($SCAN==1) {write_test_protocol -out top.spf}
write -f verilog -hierarchy -output processor_synth.v

write_sdc design.sdc
write_sdf -version 1.0 design.sdf

report_timing

exit
