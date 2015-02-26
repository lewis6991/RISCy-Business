#!/bin/tcsh

#------------------------------------------------------------------------------
# File              : RUN_PNR.sh
# Description       : Tcsh script to run a Place & Route
# Primary Author    : Dominic Murphy
# Other Contributors:
#------------------------------------------------------------------------------

if ($1 == clean) then
    ls encounter* clock_report timingReports >&/dev/null
    if ($? != 0) then
        echo "Already clean!"
    else
        rm ./*.pvl ./*.syn ./*.rpt ./*.mr ./*.log ./*.svf
        echo "Cleaned!"
    endif
    exit
endif

source SOC_Setup.sh

velocity -init pnr_script.tcl | tee pnr.log
echo "Complete. Results written to pnr.log"
exit
