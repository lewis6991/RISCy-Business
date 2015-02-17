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
        (-h|--help)     usage;;
        (-a|--all)      all;;
        (-proc)         proc "$2" "$3";;
        (-if)           IF;;
        (-id)           ID;;
        (-ex)           EX;;
        (-mem)          MEM;;
        (-wb)           WB;;
        (-s|--specific) specific "$2" "$3";;
        (-gui)          proc "$1";;
        (-*)            echo "Unknown argument. Try --help for information";;
        (*)             proc;;
    esac
}

usage()
{
    echo "
    -h,--help         Displays this message
    -a,--all          Runs all test conditions
    -proc (-gui)      Runs the top level processor test
    -if               Runs the instruction fetch tests
    -id               Runs the instruction decode tests
    -ex               Runs the execute tests
    -mem              Runs the memory tests
    -wb               Runs the write back tests
    -s,--specific <module> (-gui)
                      Runs a singular test on 'module'
    -gui              Runs the top level processor test (With GUI)
     NO ARGUMENT      Runs the top level processor test (Without GUI)

    NOTE: Options in <> are required
          Options in () are optional

    -plusargs=\"\"      Include plusargs to any command to set arguments
                      within the testbench itself. Full list below.
                      Arguments can be chained by including a single
                      comma between them. Left blank if not set
    \"+START=10000\"   
    \"+FINISH=10000\"
    \"+FINISH=10000\"
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
    if [ "$1" = "-gui" ]
    then
        echo "Include GUI"
        allvars=${2//"-plusargs="/}
        ncverilog +ncaccess+r -sv -q +gui +incdir+../src/ $allvars +nctimescale+1ns/10ps processor_tb.sv ../src/*.sv
    else
        echo "Default"
        allvars=${1//"-plusargs="/}
        ncverilog +ncaccess+r -sv -q +incdir+../src/ $allvars +nctimescale+1ns/10ps processor_tb.sv ../src/*.sv
    fi
    echo "##### Processor done"
}

IF()
{
    echo "##### Testing the IF stage"
    
    MODULES=(mux pcinc pc IF)

    for i in ${MODULES[@]};
    do
        echo "##### Testing ${i}.sv"
        ncverilog -sv -q +nctimescale+1ns/10ps ${i}_tb.sv ../src/${i}.sv
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
        ncverilog -sv -q +nctimescale+1ns/10ps ${i}_tb.sv ../src/${i}.sv
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
        ncverilog -sv -q +nctimescale+1ns/10ps ${i}_tb.sv ../src/${i}.sv
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
        ncverilog -sv -q +nctimescale+1ns/10ps ${i}_tb.sv ../src/${i}.sv
        echo "##### ${i}.sv done"
    done
}

#Note: $1 in this function actually corresponds to $2 from the command line.
specific() 
{
    if [ "$1" = "" ]
    then
        echo "No argument given. Try --help for information"
        exit
    fi

    echo "Testing specific module: ${1}.sv"
    if [ "$2" = "-gui" ]
    then
        echo "Include GUI"
        ncverilog +ncaccess+r -sv -q +gui +nctimescale+1ns/10ps ${1}_tb.sv ../src/${1}.sv
    else
        echo "Default"
        ncverilog -sv -q +nctimescale+1ns/10ps ${1}_tb.sv ../src/${1}.sv
    fi

    echo "##### ${1}.sv done"
}

main "$@"






