#------------------------------------------------------------------------------
# File              : vector_script.tcl
# Description       : tcl file used to perform scan test vector generation
# Primary Author    : Ethan Bishop
# Other Contributors:
#------------------------------------------------------------------------------

read_netlist ../0.35um_Technologu_HDL_Files/c35_UDP.v
read_netlist ../0.35um_Technologu_HDL_Files/c35_CORELIB.v
read_netlist processor_synth.v
run_build_model
run_drc processor_synth.spf
add_fault -all
run_atpg -auto_compression
write_patterns patterns.stil -format stil -replace -vcs
exit
