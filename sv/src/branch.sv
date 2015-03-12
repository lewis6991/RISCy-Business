//------------------------------------------------------------------------------
// File              : branch.sv
// Description       : Branch logic for execute stage
// Primary Author    : Ethan Bishop
// Other Contributors: 
// Notes             : Controls the PC for JUMP and BRANCH instructions
//------------------------------------------------------------------------------

`include "op_definition.sv"
`include "alu_definition.sv"

module branch(
    input               Enable , // Enable branch module
    input        [31:0] PCIn   , // Program counter input.
                        A      , // ALU input A
                        B      , // ALU input B
    input        [31:0] Address, // Address input
    input        [ 5:0] Func   , 
    output logic [31:0] PCout  , // Program counter
                        Ret    , // Return address
    output logic        Taken    // Branch taken
);

    always_comb
    begin
        PCout = PCIn;
        Taken = 0;
        
        if (Enable)
            case (Func)
                `J,
                `JAL:
                    begin
                        PCout = {PCIn[31:28], Address[25:0], 2'b00};
                        Taken = 1;
                    end
                
                `JR,
                `JALR:
                    begin
                        PCout = Address;
                        Taken = 1;
                    end
                    
                `BEQ:
                    if (A == B)
                        begin
                            PCout = PCIn + {Address[29:0], 2'b00};
                            Taken = 1;
                        end
                `BNE:
                    if (A != B)
                        begin
                            PCout = PCIn + {Address[29:0], 2'b00};
                            Taken = 1;
                        end
                        
                `BGEZ,
                `BGEZAL:
                    if (signed'(A) >= 0)
                        begin
                            PCout = PCIn + {Address[29:0], 2'b00};
                            Taken = 1;
                        end
                `BGTZ:
                    if (signed'(A) > 0)
                        begin
                            PCout = PCIn + {Address[29:0], 2'b00};
                            Taken = 1;
                        end
                `BLEZ:
                    if (signed'(A) <= 0)
                        begin
                            PCout = PCIn + {Address[29:0], 2'b00};
                            Taken = 1;
                        end
                        
                `BLTZ,
                `BLTZAL:
                    if (signed'(A) < 0)
                        begin
                            PCout = PCIn + {Address[29:0], 2'b00};
                            Taken = 1;
                        end
                        
            endcase
        
    end
        
    assign Ret = PCIn + 8;

endmodule
