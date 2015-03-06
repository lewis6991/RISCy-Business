#------------------------------------------------------------------------------
# File              : pnr_script.tcl
# Description       : tcl file used to perform a Place & Route
# Primary Author    : Dominic Murphy
# Other Contributors:
#------------------------------------------------------------------------------

setReleaseMultiCpuLicense 0
setMultiCpuUsage -numThreads max -numHosts 0 -superThreadsNumThreads max -superThreadsNumHosts 0
setDistributeHost -local
loadConfig ../design.conf 0
commitConfig
fit
setDrawView fplan
getIoFlowFlag
setFPlanRowSpacingAndType 7.8 2
setIoFlowFlag 0
floorPlan -site standard -r 1 0.7 50.4 50.7 50.0 50.0
uiSetTool select
getIoFlowFlag
fit
addRing -spacing_bottom 2 -width_left 2 -width_bottom 2 -width_top 2 -spacing_top 2 -layer_bottom MET1 -stacked_via_top_layer MET4 -width_right 2 -around core -jog_distance 0.7 -offset_bottom 0.7 -layer_top MET1 -threshold 0.7 -offset_left 0.7 -spacing_right 2 -spacing_left 2 -offset_right 0.7 -offset_top 0.7 -layer_right MET2 -nets {gnd! vdd! } -stacked_via_bottom_layer MET1 -layer_left MET2
sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { 1 4 } -blockPinTarget { nearestRingStripe nearestTarget } -padPinPortConnect { allPort oneGeom } -checkAlignedSecondaryPin 1 -blockPin useLef -allowJogging 1 -crossoverViaBottomLayer 1 -allowLayerChange 1 -targetViaTopLayer 4 -crossoverViaTopLayer 4 -targetViaBottomLayer 1 -nets { gnd! vdd! }
placeDesign -prePlaceOpt
checkPlace processor.checkPlace
setDrawView place
optDesign -preCTS
addCTSCellList {BUF2 INV2}
clockDesign -genSpecOnly Clock.ctstch
clockDesign -specFile Clock.ctstch -outDir clock_report -fixedInstBeforeCTS
setNanoRouteMode -quiet -routeWithTimingDriven true
setNanoRouteMode -quiet -routeTdrEffort 8
setNanoRouteMode -quiet -routeTopRoutingLayer default
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven true
setNanoRouteMode -quiet -routeWithSiDriven false
routeDesign -globalDetail
optDesign -postRoute
getFillerMode -quiet
findCoreFillerCells
addFiller -cell FILL1 FILL2 FILL5 FILL10 FILL25 -prefix FILLER -markFixed
verifyConnectivity -type all -error 1000 -warning 50
verifyGeometry
streamOut processorlayout.gds -mapFile streamOut.map -libName DesignLib -stripes 1 -units 1000 -mode ALL
saveNetlist "../processor_net.v"
isExtractRCModeSignoff
isExtractRCModeSignoff
rcOut -spf processor.spf
delayCal -sdf processor.sdf
exit
