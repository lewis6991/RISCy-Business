//------------------------------------------------------------------------------
// File              : processor_model.sv
// Description       : Processor model used to automate register checking and
//                     program counter tracking.
// Primary Author    : Lewis Russell
// Other Contributors:
// Notes             :
//------------------------------------------------------------------------------
`include "op_definition.sv"
`include "alu_definition.sv"
`include "mul_definition.sv"
`include "branch_definition.sv"
program processor_model(
    input                   Clock      ,
                            nReset     ,
    input            [31:0] Instruction,
    output           [15:0] InstAddr   ,
    output bit       [ 4:0] cAddr      ,
    output bit [0:31][31:0] Register
);

parameter br_d  = 2; // Delay for branches to occur.
parameter reg_d = 4; // Delay for reg writes to occur.

logic [63:0] acc        ;
logic [ 5:0] opcode     ,
             func       ;
logic [ 4:0] rs_addr    ,
             rt_addr    ,
             rd_addr    ,
             shamt      ;
logic [15:0] imm        ,
             offset     ;
logic [31:0] pc      = 0;
logic [25:0] address    ;

// Internal registers are signed unpacked array.
int register[0:31];

// Clocking drives are not properly supported for unpacked arrays so must
// transfer to packed array.
bit [0:31][31:0] register_packed;

// Track the address of the register that changes.
bit [4:0] caddr;

default clocking delay @ (posedge Clock);
    output pc      ;
    output Register;
    output cAddr   ;
endclocking

assign opcode  = Instruction[31:26];
assign rs_addr = Instruction[25:21];
assign rt_addr = Instruction[20:16];
assign rd_addr = Instruction[15:11];
assign shamt   = Instruction[10: 6];
assign func    = Instruction[ 5: 0];
assign imm     = Instruction[15: 0];
assign offset  = Instruction[15: 0];
assign address = Instruction[25: 0];

assign InstAddr = pc;

`define rs register[rs_addr]
`define rt register[rt_addr]
`define rd register[rd_addr]
`define ra register[31]

initial while(1)
begin
    @ (posedge Clock, negedge nReset)
    if (~nReset) begin
        acc = 0;
        pc = 0;
        foreach(register[i])
            register[i] = 0;
    end
    else
    begin
        pc <= pc + 4;

        if (opcode inside {
                `ADDI, `ADDIU, `LUI , `ANDI ,
                `ORI , `XORI , `SLTI, `SLTIU})
            caddr = rt_addr;
        else if (opcode == `JAL)
            caddr = 31;
        else if (opcode inside {`ALU, `MULL})
            caddr = rd_addr;
        else if (opcode == `BRANCH && func inside {`BGEZAL, `BLTZAL})
            caddr = 31;

        case (opcode)
            `ADDI  ,
            `ADDIU : `rt = `rs + imm ;
            `LUI   : `rt = imm << 16;
            `ANDI  : `rt = `rs & imm ;
            `ORI   : `rt = `rs | imm ;
            `XORI  : `rt = `rs ^ imm ;
            `SLTI  ,
            `SLTIU : `rt = `rs < imm ? 32'b1 : 32'b0;
            `BEQ   : if (`rs == `rt) delay.pc <= ##(br_d) pc + (offset << 2);
            `BGTZ  : if (`rs >  0  ) delay.pc <= ##(br_d) pc + (offset << 2);
            `BLEZ  : if (`rs <= 0  ) delay.pc <= ##(br_d) pc + (offset << 2);
            `BNE   : if (`rs != `rt) delay.pc <= ##(br_d) pc + (offset << 2);
            `J     : delay.pc <= ##(br_d) {pc[31:28], 28'b0} + address;
            `JAL   :
            begin
                delay.pc <= ##(br_d) {pc[31:28], 28'b0} + address;
                `ra =  pc + 8;
            end
            `LB    :; //TODO
            `LBU   :; //TODO
            `LH    :; //TODO
            `LHU   :; //TODO
            `LW    :; //TODO
            `LWL   :; //TODO
            `LWR   :; //TODO
            `SB    :; //TODO
            `SH    :; //TODO
            `SW    :; //TODO
            `SWL   :; //TODO
            `SWR   :; //TODO
            `LL    :; //TODO
            `SC    :; //TODO
            `ALU   :
            begin
                case (func)
                    `SLL    : `rd = `rt <<  shamt;
                    `SLLV   : `rd = `rt <<  `rs  ;
                    `SRA    : `rd = `rt >>> shamt;
                    `SRAV   : `rd = `rt >>> `rs  ;
                    `SRL    : `rd = `rt >>  shamt;
                    `SRLV   : `rd = `rt >>  `rs  ;
                    `JALR   :; //TODO
                    `MOVZ   : if (`rt == 0) `rd =  `rs;
                    `MOVN   : if (`rt != 0) `rd =  `rs;
                    `MFHI   : `rd = acc[63:32];
                    `MFLO   : `rd = acc[31: 0];
                    `MTHI   : acc[63:32] = `rs;
                    `MTLO   : acc[31: 0] = `rs;
                    `MULT   ,
                    `MULTU  : acc = `rs*`rt;
                    `ADD    : `rd = `rs + `rt;
                    `ADDU   : `rd = `rs + `rt;
                    `SUB    : `rd = `rs - `rt;
                    `SUBU   : `rd = `rs - `rt;
                    `AND    : `rd = `rs & `rt;
                    `NOR    : `rd = ~(`rs | `rt);
                    `OR     : `rd = `rs | `rt;
                    `XOR    : `rd = `rs ^ `rt;
                    `SLT    : `rd = `rs < `rt ? 32'b1 : 32'b0;
                    `SLTU   : `rd = `rs < `rt ? 32'b1 : 32'b0;
                    `JR     : delay.pc <= ##(br_d) `rs;
                    `JALR   :
                    begin
                        `rd =  pc + 8;
                        delay.pc <= ##(br_d) `rs;
                    end
                    0:;//NOP
                    default:
                        ALU_INST_ERROR: assert(0)
                        else
                            $error("ERROR: This ALU instruction is not supported (func: 6'b%6b). ", func);
                endcase
            end

            `BRANCH:
            begin
                case (rt_addr)
                    `BGEZ  : if (`rs >= 0) delay.pc <= ##(br_d) pc + (offset << 2);
                    `BGEZAL:
                    if (`rs >= 0)
                    begin
                        delay.pc <= ##(br_d) pc + (offset << 2);
                        `ra =  pc + 8;
                    end
                    `BLTZ  : if (`rs < 0) delay.pc <= ##(br_d) pc + (offset << 2);
                    `BLTZAL:
                    if (`rs < 0)
                    begin
                        delay.pc <= ##(br_d) pc + (offset << 2);
                        `ra =  pc + 8;
                    end
                    default:
                        BRANCH_INST_ERROR: assert(0)
                        else
                            $error("ERROR: This branch instruction is not supported(variant: 5'b%5b).", rt_addr);
                endcase
            end
            `MULL  :
            begin
                case (func)
                    `MADD  ,
                    `MADDU : acc = acc + `rs*`rt;
                    `MSUB  ,
                    `MSUBU : acc = acc - `rs*`rt;
                    `MUL   : `rd = `rs*`rt;
                    `CLO   : `rd = count_leading_digit(`rs, 1);
                    `CLZ   : `rd = count_leading_digit(`rs, 0);
                    default:
                        MULL_INST_ERROR: assert(0)
                        else
                            $error("ERROR: This MULL instruction is not supported(func: 6'b%6b).", func);
                endcase
            end
            default:
                OP_INST_ERROR: assert(0)
                else
                    $error("ERROR: This opcode is not supported(opcode: 6'b%6b).", opcode);
        endcase
    end

    foreach(register[i])
        register_packed[i] = register[i];

    delay.cAddr    <= ##(reg_d) caddr          ;
    delay.Register <= ##(reg_d) register_packed;
end

function int count_leading_digit(logic [31:0] operand, bit arg);
    int i;

    for (i = 0; i < 32; ++i)
        if (operand[31-i] != arg)
            break;

    COUNT_LEADING_DIGIT_ASSERT : assert (i <= 32)
        return i;
    else
        $error("Error: Function returned value greater than 32. Is model broken?");
endfunction

endprogram
