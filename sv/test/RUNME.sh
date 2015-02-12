#!/bin/bash

#----------------------------------------
# File: RUNME.sh
# Description: Bash script for automated testing
# Primary Author: Jack Barnes
# Other Contributors: Dominic Murphy
# Notes: 
#----------------------------------------

main()
{
    case $1 in
        (-h|--help) usage;;
        (-a|--all)  all;;
        (-if)       IF;;
        (-id)       ID;;
        (-ex)       EX;;
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
    echo "##### Testing all stages"
    IF
    DE
    EX
    MEM
    WB
}

IF()
{
    echo "##### Testing the IF stage"
    
    MODULES=(mux pcinc pc IF)

    for i in ${MODULES[@]};
    do
        echo "##### Testing ${i}.sv"
        ncverilog  -sv  -q  +nctimescale+1ns/10ps ${i}_tb.sv       ../src/${i}.sv
        echo "##### ${i}.sv done"
    done
}

ID()
{
    echo "##### Testing the ID stage"    

    MODULES=(registers nleftshift signextend)

    for i in ${MODULES[@]};
    do
        echo "Testing ${i}.sv"
        ncverilog  -sv  -q  +nctimescale+1ns/10ps ${i}_tb.sv       ../src/${i}.sv
        echo "##### ${i}.sv done"
    done
}

EX()
{
    echo "##### Testing the EX stage"

    MODULES=(mux alu)

    for i in ${MODULES[@]};
    do
        echo "Testing ${i}.sv"
        ncverilog  -sv  -q  +nctimescale+1ns/10ps ${i}_tb.sv       ../src/${i}.sv
        echo "##### ${i}.sv done"
    done
}

MEM()
{
    echo "##### Testing the MEM stage"
    echo "Not implemented yet"
}

WB()
{
    echo "##### Testing the WB stage"

    MODULES=(mux)

    for i in ${MODULES[@]};
    do
        echo "Testing ${i}.sv"
        ncverilog  -sv  -q  +nctimescale+1ns/10ps ${i}_tb.sv       ../src/${i}.sv
        echo "##### ${i}.sv done"
    done
}

main $1
