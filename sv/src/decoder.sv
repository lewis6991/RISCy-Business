//----------------------------------------
// File: decoder.sv
// Description: Control Unit for the processor
// Primary Author: Dhanushan Raveendran
// Other Contributors: 
// Notes: 
//----------------------------------------

`include "op_definition.sv"
`include "alu_definition"
`include "mul_definition"

module decoder(
	output	logic			RegDst,
							Branch,
							MemRead,
							MemtoReg,
							ALUOp,
							MULOp,
							Memwrite,
							ALUSrc,
							RegWrite,
							ShiftSel,
	output	logic	[4:0]	Shift,
	output	logic	[5:0]	ALUfunc,
    input   		[5:0]   Op_Code,
							Func_Code,
	input	logic	[4:0]	Shamt
);

always_comb
    begin
		RegDst = 1'b0;
		Branch = 1'b0;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		ALUOp = 1'b0;
		Memwrite = 1'b0;
		ALUSrc = 1'b0;
		RegWrite = 1'b0;
		ImmSel = 1'b0;
		MULOp = 1'b0;
		ALUfunc = 6'b000000;
		Shift = 5'b00000;
		
		case(Op_Code)
			`ALU_OP:
				case(Func_Code)
					`ADD:
						begin
							ALUfunc = `ADD;
							ALUOp = 1'b1;
							RegWrite = 1'b1;
						end
					
					`ADDU:
						begin
							ALUfunc = `ADDU;
							ALUOp = 1'b1;
							RegWrite = 1'b1;
						end
					
					`SUB:
						begin
							ALUfunc = `SUB;
							ALUOp = 1'b1;
							RegWrite = 1'b1;
						end
					
					`SUBU:
						begin
							ALUfunc = `SUBU;
							ALUOp = 1'b1;
							RegWrite = 1'b1;
						end
					
					`SLL:
						begin
							ALUfunc = `SLL;
							ALUOp = 1'b1;
							RegWrite = 1'b1;
							Shift = Shamt;
						end
					
					`SLLV:
						begin
							ALUfunc = `SLLV;
							ALUOp = 1'b1;
							RegWrite = 1'b1;
						end
					
					`SRA:
						begin
							ALUfunc = `SRA;
							ALUOp = 1'b1;
							RegWrite = 1'b1;
							Shift = Shamt;
						end
					
					`SRAV:
						begin
							ALUfunc = `SRAV;
							ALUOp = 1'b1;
							RegWrite = 1'b1;
						end
					
					`SRL:
						begin
							ALUfunc = `SRL;
							ALUOp = 1'b1;
							RegWrite = 1'b1;
							Shift = Shamt;
						end
					
					`SRLV:
						begin
							ALUfunc = `SRLV;
							ALUOp = 1'b1;
							RegWrite = 1'b1;
						end
					
					`AND:
						begin
							ALUfunc = `AND;
							ALUOp = 1'b1;
							RegWrite = 1'b1;
						end
					
					`NOR:
						begin
							ALUfunc = `NOR;
							ALUOp = 1'b1;
							RegWrite = 1'b1;
						end
					
					`OR:
						begin
							ALUfunc = `OR;
							ALUOp = 1'b1;
							RegWrite = 1'b1;
						end
					
					`XOR:
						begin
							ALUfunc = `XOR;
							ALUOp = 1'b1;
							RegWrite = 1'b1;
						end
					
					`MOVN:
						begin
							ALUfunc = `MOVN;
							ALUOp = 1'b1;
							RegWrite = 1'b1;
						end
					
					`MOVZ:
						begin
							ALUfunc = `MOVZ;
							ALUOp = 1'b1;
							RegWrite = 1'b1;
						end
					
					`SLT:
						begin
							ALUfunc = `SLT;
							ALUOp = 1'b1;
							RegWrite = 1'b1;
						end
					
					`SLTU:
						begin
							ALUfunc = `SLTU;
							ALUOp = 1'b1;
							RegWrite = 1'b1;
						end
					
					`MULT:
						begin
							ALUfunc = `MULT;
							ALUOp = 1'b1;
						end
					
					`MULTU:
						begin
							ALUfunc = `MULTU;
							ALUOp = 1'b1;
						end
					
					`MFHI:
						begin
							ALUfunc = `MFHI;
							ALUOp = 1'b1;
						end
					
					`MFLO:
						begin
							ALUfunc = `MFLO;
							ALUOp = 1'b1;
						end
					
					`MTHI:
						begin
							ALUfunc = `MTHI;
							ALUOp = 1'b1;
						end
					
					`MTLO:
						begin
							ALUfunc = `MTLO;
							ALUOp = 1'b1;
						end
					
					`JALR:
						begin
							ALUfunc = `JALR;
							ALUOp = 1'b1;
							ALUSrc = 1'b1;
							RegWrite = 1'b1;
						end
					
					`JR:
						begin
							ALUfunc = `JR;
							ALUOp = 1'b1;
							ALUSrc = 1'b1;
							RegWrite = 1'b1;
						end
					
					default:
				endcase
			
			`MUL_OP:
				case(Func_Code)
					`CLO:
					
					`CLZ:
					
					`MADD:
						begin
							ALUfunc = `MADD;
							MULOp = 1'b1;
							RegWrite = 1'b1;
						end
					
					`MADDU:
					
					`MSUB:
					
					`MSUBU:
					
					`MUL:
					
					default:
				endcase
			
			`ADDI:
			
			`ADDIU:
			
			`LUI:
				begin
					ALUfunc = `ADD;
					ALUOp = 1'b1;
					ALUSrc = 1'b1;
					ShiftSel = 1'b1;
					RegWrite = 1'b1;
				end
			
			`ANDI:
			
			`ORI:
				begin
					ALUfunc = `OR;
					ALUOp = 1'b1;
					ALUSrc = 1'b1;
					RegWrite = 1'b1;
				end
			
			`XORI:
			
			`SLTI:
			
			`SLTIU:
			
			`BEQ:
			
			`BGTZ:
			
			`BLEZ:
			
			`BNE:
			
			`J:
			
			`JAL:
			
			`LB:
			
			`LBU:
			
			`LH:
			
			`LHU:
			
			`LW:
			
			`LWL:
			
			`LWR:
			
			`SB:
			
			`SH:
			
			`SW:
			
			`SWL:
			
			`SWR:
			
			`LL:
			
			`SC:
			
			default:
		endcase
    end

endmodule
