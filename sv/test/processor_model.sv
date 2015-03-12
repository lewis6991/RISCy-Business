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
        update_caddr();
        update_acc();
        update_pc();
        update_registers();
        update_memory();
    end
end

task update_caddr();
    if (opcode inside {
            `ADDI, `ADDIU, `LUI , `ANDI , `ORI , `XORI , `SLTI, `SLTIU})
        delay.cAddr <= ##(reg_d) rt_addr;
    else if (opcode == `JAL)
        delay.cAddr <= ##(reg_d) 31;
    else if (opcode inside {`ALU, `MULL})
        delay.cAddr <= ##(reg_d) rd_addr;
    else if (opcode == `BRANCH && func inside {`BGEZAL, `BLTZAL})
        delay.cAddr <= ##(reg_d) 31;
endtask

task update_registers();
    case (opcode)
        `ADDI  ,
        `ADDIU : `rt = `rs + imm;
        `LUI   : `rt = imm << 16;
        `ANDI  : `rt = `rs & imm;
        `ORI   : `rt = `rs | imm;
        `XORI  : `rt = `rs ^ imm;
        `SLTI  ,
        `SLTIU : `rt = `rs < imm ? 32'b1 : 32'b0;
        `JAL   : `ra =  pc + 8;
        `LB    :; //TODO
        `LBU   :; //TODO
        `LH    :; //TODO
        `LHU   :; //TODO
        `LW    :; //TODO
        `LWL   :; //TODO
        `LWR   :; //TODO
        `LL    :; //TODO
        `SC    :; //TODO
        `ALU   :
        case (func)
            `SLL    : `rd = `rt <<  shamt;
            `SLLV   : `rd = `rt <<  `rs  ;
            `SRA    : `rd = `rt >>> shamt;
            `SRAV   : `rd = `rt >>> `rs  ;
            `SRL    : `rd = `rt >>  shamt;
            `SRLV   : `rd = `rt >>  `rs  ;
            `JALR   : `rd =  pc + 8;
            `MOVZ   : if (`rt == 0) `rd =  `rs;
            `MOVN   : if (`rt != 0) `rd =  `rs;
            `MFHI   : `rd = acc[63:32];
            `MFLO   : `rd = acc[31: 0];
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
            `JALR   : `rd = pc + 8;
            0:;//NOP
        endcase
        `BRANCH:
        case (rt_addr)
            `BGEZAL: if (`rs >= 0) `ra = pc + 8;
            `BLTZAL: if (`rs <  0) `ra = pc + 8;
        endcase
        `MULL  :
        case (func)
            `MUL: `rd = `rs*`rt;
            `CLO: `rd = count_leading_digit(`rs, 1);
            `CLZ: `rd = count_leading_digit(`rs, 0);
        endcase
    endcase

    // Move registers to packed array.
    foreach(register[i])
        register_packed[i] = register[i];

    delay.Register <= ##(reg_d) register_packed;
endtask

task update_memory();
    case (opcode)
        `SB    :; //TODO
        `SH    :; //TODO
        `SW    :; //TODO
        `SWL   :; //TODO
        `SWR   :; //TODO
    endcase
endtask

task update_acc();
    case (opcode)
        `ALU   :
        case (func)
            `MTHI : acc[63:32] = `rs;
            `MTLO : acc[31: 0] = `rs;
            `MULT ,
            `MULTU: acc = `rs*`rt;
        endcase
        `MULL  :
        case (func)
            `MADD, `MADDU : acc = acc + `rs*`rt;
            `MSUB, `MSUBU : acc = acc - `rs*`rt;
        endcase
    endcase
endtask

task update_pc();
    pc <= pc + 4;

    case (opcode)
        `BEQ   : if (`rs == `rt) delay.pc <= ##(br_d) pc + (offset << 2);
        `BGTZ  : if (`rs >  0  ) delay.pc <= ##(br_d) pc + (offset << 2);
        `BLEZ  : if (`rs <= 0  ) delay.pc <= ##(br_d) pc + (offset << 2);
        `BNE   : if (`rs != `rt) delay.pc <= ##(br_d) pc + (offset << 2);
        `J, `JAL: delay.pc <= ##(br_d) {pc[31:28], 28'b0} + (address << 2);
        `ALU   :
        case (func)
            `JR, `JALR: delay.pc <= ##(br_d) `rs;
        endcase
        `BRANCH:
        case (rt_addr)
            `BGEZ, `BGEZAL: if (`rs >= 0) delay.pc <= ##(br_d) pc + (offset << 2);
            `BLTZ, `BLTZAL: if (`rs <  0) delay.pc <= ##(br_d) pc + (offset << 2);
        endcase
    endcase
endtask

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
