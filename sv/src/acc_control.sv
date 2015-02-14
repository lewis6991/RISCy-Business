//------------------------------------------------------------------------------
// File              : acc_control.sv
// Description       : Accumulator controller for execute stage
// Primary Author    : Ethan Bishop
// Other Contributors: Lewis Russell
// Notes             : Takes in function code and performs the MULL
//                     operation associated.
//------------------------------------------------------------------------------

`include "alu_definition.sv"
`include "mul_definition.sv"

module acc_control(
    input               Clock  ,
                        nReset ,
                        ACCEn  ,
    input        [ 5:0] MULfunc,
    input        [63:0] In     ,
    output logic [31:0] Out    ,
    output logic        C      , // Carry flag.
                        Z      , // Zero flag.
                        O      , // Overflow flag.
                        N        // Negative flag.
);

    logic [63:0] ACCin;
    logic [63:0] ACCout;

    always_ff@(posedge Clock, negedge nReset)
        if (~nReset)
            ACCout <= 64'd0;
        else
            ACCout <= #20 ACCin;

    always_comb
    begin

        Out   = 0;
        ACCin = ACCout;
        Z     = (ACCin == 0);
        O     = 0;
        N     = ACCin[63];
        C     = 0;

        if (ACCEn)
            case (MULfunc)
                `MADD:
                begin
                    {C, ACCin} = ACCout + In;
                    if (ACCout[63] == In[63])
                        O = (ACCout[63] ^ N);
                end
                `MADDU:
                begin
                    {C, ACCin} = ACCout + In;
                    O = C;
                end
                `MSUB:
                begin
                    {C, ACCin} = ACCout - In;
                    if (ACCout[63] == In[63])
                        O = (ACCout[63] ^ N);
                end
                `MSUBU:
                begin
                    {C, ACCin} = ACCout - In;
                    O = C;
                end

                `MFHI:  Out = ACCout[63:32];
                `MFLO:  Out = ACCout[31:0];
                `MTHI:  ACCin[63:32] = In;
                `MTLO:  ACCin[31:0] = In;

                // TODO: Do I need to anything else for these?
                `MULT:  ACCin = In;
                `MULTU: ACCin = In;

            endcase

    end

endmodule
