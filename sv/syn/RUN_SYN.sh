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
        rm ./*.pvl ./*.syn ./*.rpt ./*.mr
        echo "Cleaned!"
    endif
    exit
endif

source DC_Setup.sh

if($1 == check) then
    dc_shell -f "check.tcl" > check.log
    echo "Complete. Results written to check.log"
    exit
endif
 
dc_shell -f "script.tcl"
