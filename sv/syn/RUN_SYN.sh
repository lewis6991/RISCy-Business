#!/bin/tcsh

#------------------------------------------------------------------------------
# File              : RUN_SYN.sh
# Description       : Tcsh script to run a simple synthesis of the design
# Primary Author    : Dominic Murphy
# Other Contributors:
#------------------------------------------------------------------------------

if ($1 == clean) then
    ls ./*.pvl ./*.syn ./*.rpt ./*.mr ./*.log ./*.svf >&/dev/null
    if ($? != 0) then
        echo "Already clean!"
    else
        rm ./*.pvl ./*.syn ./*.rpt ./*.mr ./*.log ./*.svf
        echo "Cleaned!"
    endif
    exit
endif

source DC_Setup.sh

if($1 == check) then
    dc_shell -f "syn_check.tcl" | tee check_syn.log
    echo "Complete. Results written to check_syn.log"
    exit
endif

if($1 == opt) then
    dc_shell -f "syn_script_opt.tcl" | tee opt_syn.log
    echo "Complete. Results written to opt_syn.log"
    exit
endif

if($1 == basic) then
    dc_shell -f "syn_script_basic.tcl" | tee basic_syn.log
    echo "Complete. Results written to basic_syn.log"
    exit
endif

echo "Error: No/Unrecognised argument provided."
exit 1
