//----------------------------------------
// File: definitions.sv
// Description: Definitions used between modules.
// Primary Author: Ethan Bishop
// Other Contributors: 
//----------------------------------------


//----------------------------------------
// ALU Function Definitions
//
// For R-type instructions (rd = rt {OP} rs):
//     A = rt, B = rs, Out = rd, PC = PC (where needed),
//     ALU Func = func
//
// For I-type instructions (rt = rs {OP} Imm):
//     A = rs, B = Imm, Out = rt, PC = PC (where needed),
//     ALU Func = b100000 + (OpCode & b000111)
//
// For MULT instructions (OpCode == b011100):
//     A = rt, B = rs, Out = rd,
//     ALU Func = b110000 + (func & b000111)
//
// For J-type instructions (J and JAL):
//     A = Address, Out = ra (for JAL)
//     ALU Func = b001000 + (OpCode & b000001)
//----------------------------------------

`define SLL     6'b000000   /* Out = A << B */
`define SRL     6'b000010   /* Out = A >> B */
`define SRA     6'b000011   /* Out = A >>> B (arithmetic) */
`define LUI     6'b000111   /* Out = B << 16 */

`define JR      6'b001000   /* PC = A */
`define JALR    6'b001001   /* Out = PC + 8, PC = A */

`define MOVZ    6'b001010   /* if A == 0 then Out = B */
`define MOVN    6'b001011   /* if A != 0 then Out = B */

`define MFHI    6'b010000   /* Out = HI(ACC) */
`define MFLO    6'b010001   /* Out = LO(ACC) */
`define MTHI    6'b010010   /* HI(ACC) = A */
`define MTLO    6'b010011   /* LO(ACC) = A */

`define MULT    6'b011000   /* ACC = B * A */
`define MULTU   6'b011001   /* ACC = B * A */

`define ADD     6'b100000   /* Out = B + A */
`define ADDU    6'b100001   /* Out = B + A */
`define SUB     6'b100010   /* Out = B - A */
`define SUBU    6'b100011   /* Out = B - A */

`define AND     6'b100100   /* Out = B & A */
`define OR      6'b100101   /* Out = B | A */
`define XOR     6'b100110   /* Out = B ^ A */
`define NOR     6'b100111   /* Out = ~(B | A) */
    
`define SLT     6'b101010   /* if B < A then Out = 1 else Out = 0 */
`define SLTU    6'b101011   /* if B < A then Out = 1 else Out = 0 */

`define MADD    6'b110000   /* ACC += B * A */
`define MADDU   6'b110001   /* ACC += B * A */
`define MUL     6'b110010   /* Out  = B * A */
`define MSUB    6'b110100   /* ACC -= B * A */
`define MSUBU   6'b110101   /* ACC -= B * A */


