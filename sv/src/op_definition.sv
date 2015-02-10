//----------------------------------------
// File: op_definition.sv
// Description: Operational instruction codes
// Primary Author: Dhanushan
// Other Contributors: 
// Notes: 
//----------------------------------------

`define	    ADDI		6'b001000
`define		ADDIU		6'b001001
`define		LUI			6'b001111

`define		ANDI		6'b001100
`define		ORI			6'b001101
`define		XORI		6'b001110

`define		SLTI		6'b001010
`define		SLTIU		6'b001011

`define		BEQ			6'b000100
`define		BGTZ		6'b000111
`define		BLEZ		6'b000110
`define		BNE			6'b000101
`define		J			6'b000010
`define		JAL			6'b000011

`define		LB			6'b100000
`define		LBU			6'b100100
`define		LH			6'b100001
`define		LHU			6'b100101
`define		LW			6'b100011
`define		LWL			6'b100010
`define		LWR			6'b100110
`define		SB			6'b101000
`define		SH			6'b101001
`define		SW			6'b101011
`define		SWL			6'b101010
`define		SWR			6'b101110

`define		LL			6'b110000
`define		SC			6'b111000

`define		ALU_OP		6'b000000
`define		MUL_OP		6'b011100