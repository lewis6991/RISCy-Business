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
    input   [5:0]   Op_Code,
                    Func_Code
);

always_comb
    begin
            case(Op_Code)
                `ALU_OP:
                    case(Func_Code)
                        `ADD:
                        
                        `ADDU:
                        
                        `SUB:
                        
                        `SUBU:
                        
                        `SLL:
                        
                        `SLLV:
                        
                        `SRA:
                        
                        `SRAV:
                        
                        `SRL:
                        
                        `SRLV:
                        
                        `AND:
                        
                        `NOP:
                        
                        `NOR:
                        
                        `OR:
                        
                        `XOR:
                        
                        `MOVN:
                        
                        `MOVZ:
                        
                        `SLT:
                        
                        `SLTU:
                        
                        `MULT:
                        
                        `MULTU:
                        
                        `MFHI:
                        
                        `MFLO:
                        
                        `MTHI:
                        
                        `MTLO:
                        
                        `JALR:
                        
                        `JR:
                        
                        default:
                    endcase
                
                `MUL_OP:
                    case(Func_Code)
                        `CLO:
                        
                        `CLZ:
                        
                        `MADD:
                        
                        `MADDU:
                        
                        `MSUB:
                        
                        `MSUBU:
                        
                        `MUL:
                        
                        default:
                    endcase
                
                `ADDI:
                
                `ADDIU:
                
                `LUI:
                
                `ANDI:
                
                `ORI:
                
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
    end

endmodule
