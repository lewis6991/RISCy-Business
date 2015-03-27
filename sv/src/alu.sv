//-----------------------------------------------------------------------------
// File              : alu.sv
// Description       : Arithmetic Logic Unit
// Primary Author    : Ethan Bishop
// Other Contributors: Lewis Russell
// Notes             :
//----------------------------------------------------------------------------

module alu(
    input        [31:0] A    ,
                        B    ,
    input        [ 4:0] Shamt,
    input        [ 5:0] Func ,
    output logic [31:0] Out  ,
    output logic        C    , // Carry out flag.
                        Z    , // Zero output flag.
                        O    , // Overflow flag.
                        N      // Negative output flag.
);

    assign N = Out[31]   ;
    assign Z = (Out == 0);

    always_comb
    begin
        Out = 0;
        C   = 0;
        O   = 0;

        case (Func)
            `ADD:
            begin
                {C, Out} = A + B;
                if (A[31] == B[31])
                    O = (A[31] ^ N);
            end

            `ADDU:
            begin
                {C, Out} = A + B;
                O = C;
            end

            `SUB:
            begin
                {C, Out} = A - B;
                if (A[31] == B[31])
                    O = (A[31] ^ N);
            end

            `SUBU:
            begin
                {C, Out} = A - B;
                O = C;
            end

            `SLL : Out = B <<  Shamt;
            `SLLV: Out = B <<  A    ;
            `SRA : Out = int'(B) >>> Shamt;
            `SRAV: Out = int'(B) >>> A    ;
            `SRL : Out = B >>  Shamt;
            `SRLV: Out = B >>  A    ;
            `AND : Out = A & B      ;
            `NOR : Out = ~(A | B)   ;
            `OR  : Out = A | B      ;
            `XOR : Out = A ^ B      ;

            `MOVN,
            `MOVZ: Out = A;

            `SLT:
                if (int'(A) < int'(B))
                    Out = 1;
                else
                    Out = 0;
            `SLTU:
                if (unsigned'(A) < unsigned'(B))
                    Out = 1;
                else
                    Out = 0;
        endcase
    end
endmodule
