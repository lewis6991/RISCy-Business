#!/bin/bash

args=("$@")
echo ${#args[@]}

fet = 0
dec = 0
exe = 0
mem = 0
wrb = 0

main()
{
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
    ncverilog  -sv  -q  mux_t.sv    ../src/mux.sv
    ncverilog  -sv  -q  stages/if/pc_alu_t.sv ../src/stages/if/pc_alu.sv
    ncverilog  -sv  -q  stages/if/pc_t.sv     ../src/stages/if/pc.sv
    ncverilog  -sv  -q  stages/if_t.sv        ../src/stages/if.sv
}

dec()
{
}

exe()
{
}

mem()
{
}

wrb()
{
}
