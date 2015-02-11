#!/bin/bash

#----------------------------------------
# File: RUNME.sh
# Description: Bash script for automated testing
# Primary Author: Jack
# Other Contributors: Dominic
# Notes: 
#----------------------------------------

main()
{
    case $1 in
        (-h|--help) usage;;
        (-a|--all)  all;;
        (-if)       IF;;
        (-id)       ID;;
        (-exe)      EX;;
        (-mem)      MEM;;
        (-wb)       WB;;
        (-*)        echo "Unknown argument. Try --help for information";;
        (*)         echo "No argument given. Try --help for information";;
    esac
}

usage()
{
    echo "
    -h,--help     Displays this message
    -a,--all      Runs all test conditions
    -if           Runs the instruction fetch tests
    -id           Runs the instruction decode tests
    -ex           Runs the execute tests
    -mem          Runs the memory tests
    -wb           Runs the write back tests
    "
    exit 1
}

all()
{
    fet
    dec
    exe
    mem
    wrb
}

IF()
{
    ncverilog  -sv  -q  +nctimescale+1ns/10ps mux_tb.sv       ../src/mux.sv
    ncverilog  -sv  -q  +nctimescale+1ns/10ps pcinc_tb.sv     ../src/pcinc.sv
    ncverilog  -sv  -q  +nctimescale+1ns/10ps pc_tb.sv        ../src/pc.sv
    ncverilog  -sv  -q  +nctimescale+1ns/10ps stages/IF_tb.sv ../src/IF.sv
}

ID()
{
    ncverilog  -sv  -q  +nctimescale+1ns/10ps registers_tb.sv  ../src/registers.sv
    ncverilog  -sv  -q  +nctimescale+1ns/10ps nleftshift_tb.sv ../src/nleftshift.sv
    ncverilog  -sv  -q  +nctimescale+1ns/10ps signextend_tb.sv ../src/signextend.sv
}

EX()
{
    ncverilog  -sv  -q  +nctimescale+1ns/10ps mux_tb.sv       ../src/mux.sv
    ncverilog  -sv  -q  +nctimescale+1ns/10ps alu_tb.sv       ../src/alu.sv
}

MEM()
{
    echo "Not implemented yet"
}

WB()
{
    ncverilog  -sv  -q  +nctimescale+1ns/10ps mux_tb.sv       ../src/mux.sv
}

main $1
