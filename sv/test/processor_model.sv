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
                            Stall      ,
                            JBFlush    ,
    input            [31:0] Instruction,
    output           [15:0] InstAddr   ,
    output bit       [ 4:0] cAddr      ,
    output bit [0:31][31:0] Register   ,
    output bit       [31:0] MemRData   ,
                            MemWData   ,
    output bit       [15:0] MemAddr    ,
    output bit              MemWrite   ,
                            MemRead
);

parameter br_d    = 1; // Delay for branches to occur.
parameter rbr_d   = 3; // Delay for reverser branches to occur.
parameter jp_d    = 2; // Delay for jumps to occur.
parameter reg_d   = 5; // Delay for reg writes to occur.
parameter mem_d   = 3; // Delay for memory operations to occur.
parameter block_d = 4; // Cycles for instructions to be blocked.

parameter mem_size = 65536;

logic        [63:0] acc        ;
e_op_code           opcode     ;
logic        [ 5:0] func       ;
logic        [ 4:0] rs_addr    ,
                    rt_addr    ,
                    rd_addr    ,
                    shamt      ;
logic        [15:0] imm        ,
                    offset     ,
                    pc      = 0;
logic signed [25:0] address    ;

int block_counter;

// Internal registers are signed unpacked array.
int register[0:31];

// Clocking drives are not properly supported for unpacked arrays so must
// transfer to packed array.
bit [0:31][31:0] register_packed;

// Track the address of the register that changes.
bit [4:0] caddr;

int memory[0:mem_size-1];

int topmem[0:255];

bit Stall2;

default clocking delay @ (posedge Clock);
    output pc      ;
    output Register;
    output cAddr   ;
    output MemRead ;
    output MemWrite;
    output MemAddr ;
    output MemRData;
    output MemWData;
endclocking

assign opcode  = e_op_code'(Instruction[31:26]);
assign rs_addr = Instruction[25:21];
assign rt_addr = Instruction[20:16];
assign rd_addr = Instruction[15:11];
assign shamt   = Instruction[10: 6];
assign func    = Instruction[ 5: 0];
assign imm     = Instruction[15: 0];
assign offset  = Instruction[15: 0];
assign address = Instruction[25: 0];

assign InstAddr = pc;

assign topmem  = memory[16128:16383];

`define rs register[rs_addr]
`define rt register[rt_addr]
`define rd register[rd_addr]
`define ra register[31]
`define r0 register[0]

`define mem_data memory[mem_addr]

initial while(1)
begin
    @ (posedge Clock, negedge nReset)

    if (~nReset) begin
        acc = 0;
        pc = 0;
        block_counter = 0;
        foreach(register[i])
            register[i] = 0;
    end
    else
    begin
        if (JBFlush || block_counter > 0)
        begin
            if (block_counter > 0)
                --block_counter;
            if (~Stall)
                pc <= pc + 4;
        end
        else
        begin
            if (~Stall && ~JBFlush)
            begin
                update_caddr();
                update_pc();
                update_acc();
            end
            if (~Stall2 && ~JBFlush)
            begin
                update_memory();
                update_registers();
            end

            // Move registers to packed array.
            foreach(register[i])
                register_packed[i] = register[i];

            delay.Register <= ##(reg_d) register_packed;
        end
        Stall2 = Stall;
    end
end

task automatic update_caddr();
    bit [4:0] new_caddr    ;
    bit       update    = 1;

    if (opcode == `BRANCH && func inside {`BGEZAL, `BLTZAL})
        new_caddr = 31;
    else
        case(opcode)
            ADDI, ADDIU, LUI , ANDI  ,
            ORI , XORI , LB  , LBU   ,
            LH  , LHU  , LW  , LWL   ,
            LWR , LL, SC, SLTI, SLTIU: new_caddr = rt_addr;
            JAL                      : new_caddr = 31     ;
            ALU , MULL               : new_caddr = rd_addr;
            default                  : update    = 0      ;
        endcase

    if (update)
        delay.cAddr <= ##(reg_d) new_caddr;
endtask

task update_registers();
    case (opcode)
        ADDI : `rt = `rs + signed'(imm);
        ADDIU: `rt = `rs + signed'(imm);
        LUI  : `rt = imm << 16;
        ANDI : `rt = `rs & imm;
        ORI  : `rt = `rs | imm;
        XORI : `rt = `rs ^ imm;
        SLTI : `rt = `rs < signed'(imm) ? 32'b1 : 32'b0;
        SLTIU: `rt = `rs < imm ? 32'b1 : 32'b0;
        JAL  : `ra =  pc + 8;
        ALU  :
        case (func)
            `SLL : `rd = `rt <<  shamt;
            `SLLV: `rd = `rt <<  `rs  ;
            `SRA : `rd = `rt >>> shamt;
            `SRAV: `rd = `rt >>> `rs  ;
            `SRL : `rd = `rt >>  shamt;
            `SRLV: `rd = `rt >>  `rs  ;
            `JALR: `rd =  pc + 8;
            `MOVZ: if (`rt == 0) `rd = `rs;
            `MOVN: if (`rt != 0) `rd = `rs;
            `MFHI: `rd = acc[63:32];
            `MFLO: `rd = acc[31: 0];
            `ADD ,
            `ADDU: `rd = `rs + `rt;
            `SUB ,
            `SUBU: `rd = `rs - `rt;
            `AND : `rd = `rs & `rt;
            `NOR : `rd = ~(`rs | `rt);
            `OR  : `rd = `rs | `rt;
            `XOR : `rd = `rs ^ `rt;
            `SLTU: `rd = unsigned'(`rs) < unsigned'(`rt) ? 32'b1 : 32'b0;
            `SLT : `rd = `rs < `rt ? 32'b1 : 32'b0;
            `JALR: `rd = pc + 8;
            0:;//NOP
        endcase
        BRANCH:
        case (rt_addr)
            `BGEZAL: if (`rs >= 0) `ra = pc + 8;
            `BLTZAL: if (`rs <  0) `ra = pc + 8;
        endcase
        MULL  :
        case (func)
            `MUL: `rd = `rs*`rt;
            `CLO: `rd = count_leading_digit(`rs, 1);
            `CLZ: `rd = count_leading_digit(`rs, 0);
        endcase
    endcase

    `r0 = 0;
endtask

task automatic update_memory();
    bit read  = 1;
    bit write = 1;

    bit[13:0] mem_addr = (`rs + offset) >> 2;


    // Memory write block
    case (opcode)
        SB     : `mem_data        = signed'(`rt[7:0]) ;
        SH     : `mem_data        = signed'(`rt[15:0]);
        SW     : `mem_data        = `rt               ;
        SWL    : `mem_data[31:16] = `rt[31:16]        ;
        SWR    : `mem_data[15: 0] = `rt[15: 0]        ;
        default: write = 0                            ;
    endcase

    // Memory read block
    case (opcode)
        LB     : `rt = signed'(`mem_data[7:0])      ;
        LBU    : `rt = `mem_data[7:0]               ;
        LH     : `rt = signed'(`mem_data[15:0])     ;
        LHU    : `rt = `mem_data[15:0]              ;
        LL , LW: `rt = `mem_data                    ;
        LWL    : `rt = {`mem_data[31:16], `rt[15:0]};
        LWR    : `rt = {`rt[31:16], `mem_data[15:0]};
        SC     : `rt = (`mem_data == `rt) ? 1 : 0   ;
        default: read = 0                           ;
    endcase

    //MEM_ADDR_ASSERT: assert (!write && !read || mem_addr < mem_size)
    //else
    //    $error("ERROR: Address %d is out of range. Maximum address is %d.",
    //        mem_addr, mem_size);

    // These assignments prevent an internal error in ncverilog.
    MemRead  = MemRead ;
    MemWrite = MemWrite;
    MemAddr  = MemAddr ;
    MemRData = MemRData;
    MemWData = MemWData;

    // Clocking drives
    delay.MemRead  <= ##(mem_d  ) read                 ;
    delay.MemWrite <= ##(mem_d  ) write                ;
    delay.MemAddr  <= ##(mem_d  ) `rs + offset         ;
    delay.MemRData <= ##(mem_d+1) read  ? `mem_data : 0;
    delay.MemWData <= ##(mem_d  ) write ? `mem_data : 0;
endtask

task update_acc();
    case (opcode)
        ALU   :
        case (func)
            `MTHI : acc[63:32] = `rs;
            `MTLO : acc[31: 0] = `rs;
            `MULT ,
            `MULTU: acc = `rs*`rt   ;
        endcase
        MULL  :
        case (func)
            `MADD, `MADDU : acc = acc + `rs*`rt;
            `MSUB, `MSUBU : acc = acc - `rs*`rt;
        endcase
    endcase
endtask

task update_pc();
    pc <= pc + 4;

    // Branch prediction
    case (opcode)
        BEQ , BGTZ, BLEZ, BNE : delay.pc <= ##(br_d) pc + (offset << 2);
        BRANCH:
        case (rt_addr)
            `BGEZ, `BGEZAL, `BLTZ, `BLTZAL: delay.pc <= ##(br_d) pc + (offset << 2);
        endcase
    endcase

    // Reverse on incorrect branch
    case (opcode)
        BEQ   : if (~(`rs == `rt)) begin
            delay.pc <= ##(rbr_d) pc;
            block_counter = block_d;
        end
        BGTZ  : if (~(`rs >  0  )) begin
            delay.pc <= ##(rbr_d) pc;
            block_counter = block_d;
        end
        BLEZ  : if (~(`rs <= 0  )) begin
            delay.pc <= ##(rbr_d) pc;
            block_counter = block_d;
        end
        BNE   : if (~(`rs != `rt)) begin
            delay.pc <= ##(rbr_d) pc;
            block_counter = block_d;
        end
        J, JAL: delay.pc <= ##(jp_d) (address << 2);
        ALU   :
        case (func)
            `JR, `JALR: delay.pc <= ##(jp_d) `rs;
        endcase
        BRANCH:
        case (rt_addr)
            `BGEZ, `BGEZAL: if (~(`rs >= 0)) begin
                delay.pc <= ##(rbr_d) pc;
                block_counter = block_d;
            end
            `BLTZ, `BLTZAL: if (~(`rs <  0)) begin
                delay.pc <= ##(rbr_d) pc;
                block_counter = block_d;
            end
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
