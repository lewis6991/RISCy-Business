//----------------------------------------
// File: mul_definition.sv
// Description: MUL instruction codes
// Primary Author: Dhanushan Raveendran
// Other Contributors: Ethan Bishop
// Notes: 
//----------------------------------------

`define     MADD    6'b000000
`define     MADDU   6'b000001
`define     MSUB    6'b000100
`define     MSUBU   6'b000101
`define     MUL     6'b000010

`define     CLO     6'b100001
`define     CLZ     6'b100000


`define     M_MFHI  6'b010000
`define     M_MFLO  6'b010010
`define     M_MTHI  6'b010001
`define     M_MTLO  6'b010011

`define     M_MULT  6'b011000
`define     M_MULTU 6'b011001
