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
    dc_shell -f "syn_check.tcl" > check.log
    echo "Complete. Results written to check.log"
    exit
endif

if($1 == opt) then
    dc_shell -f "syn_script_opt.tcl" > opt.log
    echo "Complete. Results written to opt.log"
    exit
endif

if($1 == basic) then
    dc_shell -f "syn_script_basic.tcl" > basic.log
    echo "Complete. Results written to basic.log"
    exit
endif

echo "Error: No/Unrecognised argument provided."
exit 1
