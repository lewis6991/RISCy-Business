//----------------------------------------
// File: alu.sv
// Description: Arithmetic Logic Unit
// Primary Author: Ethan Bishop
// Other Contributors: Lewis Russell
//----------------------------------------

module alu(
    input        [31:0] A,
    input        [31:0] B,
    input        [4:0]  Shamt,
    input        [5:0]  ALUfunc,
    output logic [31:0] Out,
    output logic        En, C, Z, O, N
);

always_comb:
begin

    Out = 0;
    En = 1;
    C = 0;
    O = 0;
    N = Out[31];
    Z = (Out == 0);
    
    case (Func)
        ADD:
            begin
                {C, Out} = A + B;
                if (A[31] == B[31])
                    O = (A[31] ^ N);
            end
        ADDU:
            begin
                {C, Out} = A + B;
                O = C;
            end
        SUB:
            begin
                {C, Out} = A - B;
                if (A[31] == B[31])
                    O = (A[31] ^ N);
            end
        SUBU:
            begin
                {C, Out} = A - B;
                O = C;
            end
            
        SLL:
            Out = B << Shamt;
        SLLV:
            Out = B << A;
        SRA:
            Out = B >>> Shamt;
        SRAV:
            Out = B >>> A;
        SRL:
            Out = B >> Shamt;
        SRLV:
            Out = B >> A;

        AND:
            Out = A & B;
        NOR:
            Out = ~(A | B);
        OR:
            Out = A | B;
        XOR:
            Out = A ^ B;

        MOVN:
            begin
                Out = A;
                En = (B != 0);
            end
        MOVZ:
            begin
                Out = A;
                En = (B == 0);
            end
        
        SLT:
            if ((int)A < (int)B)
                Out = 1;
            else
                Out = 0;
        SLTU:
            if ((unsigned int)A < (unsigned int)B)
                Out = 1;
            else
                Out = 0;

        // TODO: Jump not in ALU
        JALR:
        JR:
        
        //TODO: CLZ and CLO
        ALU_CLZ:
        ALU_CLO:
        
    endcase
    
end

endmodule
