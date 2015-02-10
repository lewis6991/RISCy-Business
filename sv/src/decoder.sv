//------------------------------------------------------------------------------
// File              : decoder.sv
// Description       : Control Unit for the processor
// Primary Author    : Dhanushan Raveendran
// Other Contributors: Lewis Russell
// Notes             : 
//------------------------------------------------------------------------------

`include "op_definition.sv"
`include "alu_definition.sv"
`include "mul_definition.sv"

module decoder(
    output logic       RegDst  ,
                       Branch  ,
                       MemRead ,
                       MemtoReg,
                       ALUOp   ,
                       MULOp   ,
                       Memwrite,
                       ALUSrc  ,
                       RegWrite,
                       ShiftSel,
    output logic [5:0] Func    ,
    input        [5:0] OpCode  ,
                       FuncCode
);

    always_comb
    begin
        RegDst   = 1'b0     ;
        Branch   = 1'b0     ;
        MemRead  = 1'b0     ;
        MemtoReg = 1'b0     ;
        ALUOp    = 1'b0     ;
        Memwrite = 1'b0     ;
        ALUSrc   = 1'b0     ;
        RegWrite = 1'b0     ;
        ImmSel   = 1'b0     ;
        MULOp    = 1'b0     ;
        Func     = 6'b000000;
    
        case(Op_Code)
            `ALU_OP:
                case(Func_Code)
                    `ADD:
                    begin
                        Func     = `ADD;
                        ALUOp    = 1'b1;
                        RegWrite = 1'b1;
                    end
    
                    `ADDU:
                    begin
                        Func     = `ADDU;
                        ALUOp    = 1'b1 ;
                        RegWrite = 1'b1 ;
                    end
    
                    `SUB:
                    begin
                        Func     = `SUB;
                        ALUOp    = 1'b1;
                        RegWrite = 1'b1;
                    end
    
                    `SUBU:
                    begin
                        Func     = `SUBU;
                        ALUOp    = 1'b1 ;
                        RegWrite = 1'b1 ;
                    end
    
                    `SLL:
                    begin
                        Func     = `SLL;
                        ALUOp    = 1'b1;
                        RegWrite = 1'b1;
                    end
    
                    `SLLV:
                    begin
                        Func     = `SLLV;
                        ALUOp    = 1'b1 ;
                        RegWrite = 1'b1 ;
                    end
    
                    `SRA:
                    begin
                        Func     = `SRA;
                        ALUOp    = 1'b1;
                        RegWrite = 1'b1;
                    end
    
                    `SRAV:
                    begin
                        Func     = `SRAV;
                        ALUOp    = 1'b1 ;
                        RegWrite = 1'b1 ;
                    end
    
                    `SRL:
                    begin
                        Func     = `SRL;
                        ALUOp    = 1'b1;
                        RegWrite = 1'b1;
                    end
    
                    `SRLV:
                    begin
                        Func = `SRLV;
                        ALUOp = 1'b1;
                        RegWrite = 1'b1;
                    end
    
                    `AND:
                    begin
                        Func     = `AND;
                        ALUOp    = 1'b1;
                        RegWrite = 1'b1;
                    end
    
                    `NOR:
                    begin
                        Func     = `NOR;
                        ALUOp    = 1'b1;
                        RegWrite = 1'b1;
                    end
    
                    `OR:
                    begin
                        Func     = `OR ;
                        ALUOp    = 1'b1;
                        RegWrite = 1'b1;
                    end
    
                    `XOR:
                    begin
                        Func     = `XOR;
                        ALUOp    = 1'b1;
                        RegWrite = 1'b1;
                    end
    
                    `MOVN:
                    begin
                        Func     = `MOVN;
                        ALUOp    = 1'b1 ;
                        RegWrite = 1'b1 ;
                    end
    
                    `MOVZ:
                    begin
                        Func     = `MOVZ;
                        ALUOp    = 1'b1 ;
                        RegWrite = 1'b1 ;
                    end
    
                    `SLT:
                    begin
                        Func     = `SLT;
                        ALUOp    = 1'b1;
                        RegWrite = 1'b1;
                    end
    
                    `SLTU:
                    begin
                        Func     = `SLTU;
                        ALUOp    = 1'b1 ;
                        RegWrite = 1'b1 ;
                    end
    
                    `MULT:
                    begin
                        Func  = `MULT;
                        ALUOp = 1'b1 ;
                    end
    
                    `MULTU:
                    begin
                        Func  = `MULTU;
                        ALUOp = 1'b1  ;
                    end
    
                    `MFHI:
                    begin
                        Func  = `MFHI;
                        ALUOp = 1'b1 ;
                    end
    
                    `MFLO:
                    begin
                        Func  = `MFLO;
                        ALUOp = 1'b1 ;
                    end
    
                    `MTHI:
                    begin
                        Func  = `MTHI;
                        ALUOp = 1'b1 ;
                    end
    
                    `MTLO:
                    begin
                        Func  = `MTLO;
                        ALUOp = 1'b1 ;
                    end
    
                    `JALR:
                    begin
                        Func     = `JALR;
                        ALUOp    = 1'b1 ;
                        ALUSrc   = 1'b1 ;
                        RegWrite = 1'b1 ; 
                    end
    
                    `JR:
                    begin
                        Func     = `JR ;
                        ALUOp    = 1'b1;
                        ALUSrc   = 1'b1;
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
                        Func  = `MADD;
                        MULOp = 1'b1 ;
                    end
    
                    `MADDU:
                    begin
                        Func  = `MADD;
                        MULOp = 1'b1 ;
                    end
    
                    `MSUB:
                    begin
                        Func  = `MADD;
                        MULOp = 1'b1 ;
                    end
    
                    `MSUBU:
                    begin
                        Func  = `MADD;
                        MULOp = 1'b1 ;
                    end
    
                    `MUL:
                    begin
                        Func     = `MADD;
                        MULOp    = 1'b1 ;
                        RegWrite = 1'b1 ;
                    end
    
                    default:
                endcase
    
            `ADDI:
            begin
                Func     = `ADDI;
                ALUOp    = 1'b1 ;
                ALUSrc   = 1'b1 ;
                RegWrite = 1'b1 ;
            end
    
            `ADDIU:
            begin
                Func     = `ADDIU;
                ALUOp    = 1'b1  ;
                ALUSrc   = 1'b1  ; 
                RegWrite = 1'b1  ;
            end
    
            `LUI:
            begin
                Func     = `ADD;
                ALUOp    = 1'b1;
                ALUSrc   = 1'b1;
                ShiftSel = 1'b1;
                RegWrite = 1'b1;
            end
    
            `ANDI:
            begin
                Func     = `ANDI;
                ALUOp    = 1'b1 ;
                ALUSrc   = 1'b1 ;
                RegWrite = 1'b1 ;
            end
    
            `ORI:
            begin
                Func     = `OR ;
                ALUOp    = 1'b1;
                ALUSrc   = 1'b1;
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
