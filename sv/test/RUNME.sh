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
    echo "This is Jack's shitty testing script. Use with caution, it probably won't work."
    case $1 in
        (-h|--help) usage;;
        (-a|--all)  all;;
        (-if)       fet;;
        (-id)       dec;;
        (-exe)      exe;;
        (-mem)      mem;;
        (-wb)       wrb;;
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
    -exe          Runs the execute tests
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

fet()
{
    ncverilog  -sv  -q  +nctimescale+1ns/10ps mux_tb.sv       ../src/mux.sv
    ncverilog  -sv  -q  +nctimescale+1ns/10ps pcinc_tb.sv     ../src/pcinc.sv
    ncverilog  -sv  -q  +nctimescale+1ns/10ps pc_tb.sv        ../src/pc.sv
    ncverilog  -sv  -q  +nctimescale+1ns/10ps stages/IF_tb.sv ../src/IF.sv
}

dec()
{
    ncverilog  -sv  -q  +nctimescale+1ns/10ps reg_tb.sv        ../src/reg.sv
    ncverilog  -sv  -q  +nctimescale+1ns/10ps nleftshift_tb.sv ../src/nleftshift.sv
    ncverilog  -sv  -q  +nctimescale+1ns/10ps signextend_tb.sv ../src/signextend.sv
}

exe()
{
    ncverilog  -sv  -q  +nctimescale+1ns/10ps mux_tb.sv       ../src/mux.sv
    ncverilog  -sv  -q  +nctimescale+1ns/10ps alu_tb.sv       ../src/alu.sv
}

mem()
{
    echo "Not implemented yet"
}

wrb()
{
    ncverilog  -sv  -q  +nctimescale+1ns/10ps mux_tb.sv       ../src/mux.sv
}

main $1
