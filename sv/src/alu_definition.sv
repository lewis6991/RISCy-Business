//----------------------------------------
// File: alu_definition.sv
// Description: ALU instruction codes
// Primary Author: Dhanushan
// Other Contributors: 
// Notes: 
//----------------------------------------

`define		ADD		6'b100000
`define		ADDU	6'b100001
`define		SUB		6'b100010
`define		SUBU	6'b100011

`define		SLL		6'b000000
`define		SLLV	6'b000100
`define		SRA		6'b000011
`define		SRAV	6'b000111
`define		SRL		6'b000010
`define		SRLV	6'b000110

`define		AND		6'b100100	
`define		NOP		6'b000000
`define		NOR		6'b100111
`define		OR		6'b100101
`define		XOR		6'b100110

`define		MOVN	6'b001011
`define		MOVZ	6'b001010
`define		SLT		6'b101010
`define		SLTU	6'b101011

`define		MULT	6'b011000
`define		MULTU	6'b011001

`define		MFHI	6'b010000
`define		MFLO	6'b010010
`define		MTHI	6'b010001
`define		MTLO	6'b010011

`define		JALR	6'b001001
`define		JR		6'b001000