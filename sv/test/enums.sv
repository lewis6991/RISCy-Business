//------------------------------------------------------------------------------
// File              : enums.sv
// Description       : Enums for instructions.
// Primary Author    : Lewis Russell
// Other Contributers:
// Notes             :
//------------------------------------------------------------------------------

typedef enum bit[5:0] {
    ADDI = 6'b001000, ADDIU  = 6'b001001, LUI  = 6'b001111, ANDI  = 6'b001100,
    ORI  = 6'b001101, XORI   = 6'b001110, SLTI = 6'b001010, SLTIU = 6'b001011,
    BEQ  = 6'b000100, BGTZ   = 6'b000111, BLEZ = 6'b000110, BNE   = 6'b000101,
    J    = 6'b000010, JAL    = 6'b000011, LB   = 6'b100000, LBU   = 6'b100100,
    LH   = 6'b100001, LHU    = 6'b100101, LW   = 6'b100011, LWL   = 6'b100010,
    LWR  = 6'b100110, SB     = 6'b101000, SH   = 6'b101001, SW    = 6'b101011,
    SWL  = 6'b101010, SWR    = 6'b101110, LL   = 6'b110000, SC    = 6'b111000,
    ALU  = 6'b000000, BRANCH = 6'b000001, MULL = 6'b011100
} e_op_code;

typedef enum bit[5:0] {
    ADD  = 6'b100000, ADDU = 6'b100001, SUB  = 6'b100010, SUBU  = 6'b100011,
    SLL  = 6'b000000, SLLV = 6'b000100, SRA  = 6'b000011, SRAV  = 6'b000111,
    SRL  = 6'b000010, SRLV = 6'b000110, AND  = 6'b100100, NOR   = 6'b100111,
    OR   = 6'b100101, XOR  = 6'b100110, MOVN = 6'b001011, MOVZ  = 6'b001010,
    SLT  = 6'b101010, SLTU = 6'b101011, MULT = 6'b011000, MULTU = 6'b011001,
    MFHI = 6'b010000, MFLO = 6'b010010, MTHI = 6'b010001, MTLO  = 6'b010011,
    JALR = 6'b001001, JR   = 6'b001000
} e_alu_func;

typedef enum bit[5:0] {
    MADD = 6'b000000, MADDU = 6'b000001, CLO = 6'b100001, CLZ = 6'b100000,
    MSUB = 6'b000100, MSUBU = 6'b000101, MUL = 6'b000010
} e_mul_func;

typedef enum bit[4:0] {
    BGEZ = 5'b00001, BGEZAL = 5'b10001, BLTZ = 5'b00000, BLTZAL = 5'b10000
} e_branch_func;
