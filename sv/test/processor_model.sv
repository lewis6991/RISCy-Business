//------------------------------------------------------------------------------
// File              : processor_model.sv
// Description       : Processor model used to automate register checking.
// Primary Author    : Lewis Russell
// Other Contributo`rs:
// Notes             :
//------------------------------------------------------------------------------
`include "op_definition.sv"
module processor_model(
    input               Clock      ,
    input               nReset     ,
    input        [31:0] wData      ,
                        Instruction,
    output logic [31:0] rData      ,
    input        [ 4:0] rAddr      ,
);

int register[0:31];

logic [63:0] acc    ;
logic [15:0] pc     ;
logic [ 5:0] opcode ,
             func   ;
logic [ 4:0] rs_addr,
             rt_addr,
             rd_addr,
             shamt  ;
logic [15:0] imm    ;
logic [25:0] address;

assign opcode  = instruction[31:26];
assign rs_addr = instruction[25:21];
assign rt_addr = instruction[20:16];
assign rd_addr = instruction[15:11];
assign shamt   = instruction[10: 6];
assign func    = instruction[ 5: 0];
assign imm     = instruction[15: 0];
assign address = instruction[25: 0];

`define rs register[rs_addr]
`define rt register[rt_addr]
`define rd register[rd_addr]
`define ra register[31]

// Register driver block
always_ff @ (posedge Clock, negedge nReset)
    if (~nReset) begin
    end
    else
    begin
        pc <= #20 pc + 1;
        case (opcode)
            `ADDI  ,
            `ADDIU : `rt <= #20 `rs + imm ;
            `LUI   : `rt <= #20 imm << 16;
            `ANDI  : `rt <= #20 `rs & imm ;
            `ORI   : `rt <= #20 `rs | imm ;
            `XORI  : `rt <= #20 `rs ^ imm ;
            `SLTI  ,
            `SLTIU : `rt <= #20 `rs < imm ? 32'b1 : 32'b0;
            `BLTZAL:; //TODO
            `JAL   :
            begin
                pc <= #20 {pc[31:28] 28'b0} + address;
                `ra <= #20 pc + 8;
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
                    `SLL    : `rd <= #20 `rt <<  shamt;
                    `SLLV   : `rd <= #20 `rt <<  `rs   ;
                    `SRA    : `rd <= #20 `rt >>> shamt;
                    `SRAV   : `rd <= #20 `rt >>> `rs   ;
                    `SRL    : `rd <= #20 `rt >>  shamt;
                    `SRLV   : `rd <= #20 `rt >>  `rs   ;
                    `JALR   :; //TODO
                    `MOVZ   : if (`rt == 0) `rd <= #20 `rs;
                    `MOVN   : if (`rt != 0) `rd <= #20 `rs;
                    `MFHI   : `rd <= #20 acc[31:16];
                    `MFLO   : `rd <= #20 acc[15: 0];
                    `MTHI   : acc[31:16] <= #20 `rs;
                    `MTLO   : acc[15: 0] <= #20 `rs;
                    `MULT   ,
                    `MULTU  : acc <= #20 `rs*`rt;
                    `ADD    : `rd <= #20 `rs + `rt;
                    `ADDU   : `rd <= #20 `rs + `rt;
                    `SUB    : `rd <= #20 `rs - `rt;
                    `SUBU   : `rd <= #20 `rs - `rt;
                    `AND    : `rd <= #20 `rs & `rt;
                    `NOR    : `rd <= #20 ~(`rs | `rt);
                    `OR     : `rd <= #20 `rs | `rt;
                    `XOR    : `rd <= #20 `rs ^ `rt;
                    `SLT    : `rd <= #20 `rs < `rt ? 32'b1 : 32'b0;
                    `SLTU   : `rd <= #20 `rs < `rt ? 32'b1 : 32'b0;
                    `JR     : pc <= #20 'rs;
                    `JALR   :
                    begin
                        `rd <= #20 pc + 8; pc <= #20 i`rs;
                    end
                    default:;
                endcase
            end

            `BRANCH:
            `MULL  :
            begin
                case (func)
                    `MADD   ,
                    `MADDU  : acc <= #20 acc + `rs*`rt;
                    `MSUB   ,
                    `MSUBU  : acc <= #20 acc - `rs*`rt;
                    `MUL    : `rd <= #20 `rs*`rt;
                    `CLO    : `rd <= #20 count_leading_digit(`rs, 1);
                    `CLZ    : `rd <= #20 count_leading_digit(`rs, 0);
                    default:;
                endcase
            end
            default:;
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
