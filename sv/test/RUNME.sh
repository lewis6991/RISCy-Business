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
        (-proc)     proc;;
        (-if)       IF;;
        (-id)       ID;;
        (-ex)       EX;;
        (-mem)      MEM;;
        (-wb)       WB;;
        (-s|--specific) specific $2;;
        (-*)        echo "Unknown argument. Try --help for information";;
        (*)         echo "No argument given. Try --help for information";;
    esac
}

usage()
{
    echo "
    -h,--help                 Displays this message
    -a,--all                  Runs all test conditions
    -if                       Runs the instruction fetch tests
    -id                       Runs the instruction decode tests
    -ex                       Runs the execute tests
    -mem                      Runs the memory tests
    -wb                       Runs the write back tests
    -s, --specific 'module' Runs a singular test on 'module'
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

proc()
{
    echo "##### Testing the entire processor"
    ncverilog  -sv  -q  -y ../src/ +incdir+../src/ +nctimescale+1ns/10ps processor_tb.sv ../src/*.sv
    echo "##### Processor done"
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

specific() #Warning - $1 in this function actually corresponds to $2 from the command line.
{
    if [ $1 -eq ""]
    then
        echo "No argument given. Try --help for information"
        exit
    fi

    echo "Testing specific module: ${1}.sv"
    ncverilog  -sv  -q  +nctimescale+1ns/10ps ${1}_tb.sv       ../src/${1}.sv
    echo "##### ${1}.sv done"
}

main $1 $2






