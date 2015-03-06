//------------------------------------------------------------------------------
// File              : processor_model.sv
// Description       : Processor model used to automate register checking.
// Primary Author    : Lewis Russell
// Other Contributo`rs:
// Notes             :
//------------------------------------------------------------------------------
`include "op_definition.sv"
`include "alu_definition.sv"
`include "mul_definition.sv"
module processor_model(
    input               Clock      ,
    input               nReset     ,
    input        [31:0] wData      ,
                        Instruction,
    output logic [31:0] rData      ,
    output       [15:0] InstAddr   ,
    input        [ 4:0] rAddr,
    output logic [15:0] pc
);


clocking delay @ (posedge Clock);
    output pc;
endclocking

int register[0:31];

logic [63:0] acc    ;
logic [ 5:0] opcode ,
             func   ;
logic [ 4:0] rs_addr,
             rt_addr,
             rd_addr,
             shamt  ;
logic [15:0] imm    ,
             offset ;
logic [25:0] address;

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

// Register driver block
always_ff @ (posedge Clock, negedge nReset)
    if (~nReset) begin
        pc <= 0;
        foreach(register[i])
            register[i] <= 0;
    end
    else
    begin
        rData <= register[rAddr];
        pc <= pc + 4;
        case (opcode)
            `ADDI  ,
            `ADDIU : `rt <= `rs + imm ;
            `LUI   : `rt <= imm << 16;
            `ANDI  : `rt <= `rs & imm ;
            `ORI   : `rt <= `rs | imm ;
            `XORI  : `rt <= `rs ^ imm ;
            `SLTI  ,
            `SLTIU : `rt <= `rs < imm ? 32'b1 : 32'b0;
            `BEQ   : if (`rs == `rt) delay.pc <= ##2 pc + (offset << 2);
            `BGTZ  : if (`rs >  0  ) delay.pc <= ##2 pc + (offset << 2);
            `BLEZ  : if (`rs <= 0  ) delay.pc <= ##2 pc + (offset << 2);
            `BNE   : if (`rs != `rt) delay.pc <= ##2 pc + (offset << 2);
            `J     : delay.pc <= ##2 {pc[31:28], 28'b0} + address;
            `JAL   :
            begin
                delay.pc <= ##2 {pc[31:28], 28'b0} + address;
                `ra <= pc + 8;
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
                    `SLL    : `rd <= `rt <<  shamt;
                    `SLLV   : `rd <= `rt <<  `rs   ;
                    `SRA    : `rd <= `rt >>> shamt;
                    `SRAV   : `rd <= `rt >>> `rs   ;
                    `SRL    : `rd <= `rt >>  shamt;
                    `SRLV   : `rd <= `rt >>  `rs   ;
                    `JALR   :; //TODO
                    `MOVZ   : if (`rt == 0) `rd <= `rs;
                    `MOVN   : if (`rt != 0) `rd <= `rs;
                    `MFHI   : `rd <= acc[63:32];
                    `MFLO   : `rd <= acc[31: 0];
                    `MTHI   : acc[63:32] <= `rs;
                    `MTLO   : acc[31: 0] <= `rs;
                    `MULT   ,
                    `MULTU  : acc <= `rs*`rt;
                    `ADD    : `rd <= `rs + `rt;
                    `ADDU   : `rd <= `rs + `rt;
                    `SUB    : `rd <= `rs - `rt;
                    `SUBU   : `rd <= `rs - `rt;
                    `AND    : `rd <= `rs & `rt;
                    `NOR    : `rd <= ~(`rs | `rt);
                    `OR     : `rd <= `rs | `rt;
                    `XOR    : `rd <= `rs ^ `rt;
                    `SLT    : `rd <= `rs < `rt ? 32'b1 : 32'b0;
                    `SLTU   : `rd <= `rs < `rt ? 32'b1 : 32'b0;
                    `JR     : delay.pc <= ##2 `rs;
                    `JALR   :
                    begin
                        `rd <= pc + 8;
                        delay.pc <= ##2 `rs;
                    end
                    0:;//NOP
                    default:
                        assert(0)
                        else
                            $error("ERROR: This ALU instruction is not supported (func: 6'b%6b). ", func);
                endcase
            end

            `BRANCH:
            begin
                case (rt_addr)
                    `BGEZ  : if (`rs >= 0) delay.pc <= ##2 pc + (offset << 2);
                    `BGEZAL:
                    if (`rs >= 0)
                    begin
                        delay.pc <= ##2 pc + (offset << 2);
                        `ra <= pc + 8;
                    end
                    `BLTZ  : if (`rs < 0) delay.pc <= ##2 pc + (offset << 2);
                    `BLTZAL:
                    if (`rs < 0)
                    begin
                        delay.pc <= ##2 pc + (offset << 2);
                        `ra <= pc + 8;
                    end
                    default:
                        assert(0)
                        else
                            $error("ERROR: This branch instruction is not supported(variant: 5'b%5b).", rt_addr);
                endcase
            end
            `MULL  :
            begin
                case (func)
                    `MADD  ,
                    `MADDU : acc <= acc + `rs*`rt;
                    `MSUB  ,
                    `MSUBU : acc <= acc - `rs*`rt;
                    `MUL   : `rd <= `rs*`rt;
                    `CLO   : `rd <= count_leading_digit(`rs, 1);
                    `CLZ   : `rd <= count_leading_digit(`rs, 0);
                    default:
                        assert(0)
                        else
                            $error("ERROR: This MULL insturction is not supported(func: 6'b%6b).", func);
                endcase
            end
            default:
                assert(0)
                else
                    $error("ERROR: Thisop code is not supported(opcode: 6'b%6b).", opcode);
        endcase
    end

function int count_leading_digit(logic [31:0] operand, bit arg);
    int i;

    for (i = 0; i < 32; ++i)
        if (operand[31-i] != arg)
            break;

    assert (i <= 32)
        return i;
    else
        $error("Error: Function returned value greater than 32. Is model broken?");
endfunction

endmodule
