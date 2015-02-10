//----------------------------------------
// File: EX.sv
// Description: Execute stage logic
// Primary Author: Ethan Bishop
// Other Contributors: 
//----------------------------------------

module EX(
    input               Clock, nReset,
    input        [31:0] A,
    input        [31:0] B,
    input        [4:0]  Shamt,
    input        [5:0]  Func,
    input               ALUOp, MULOp, ShiftSel,
                        Jump, Branch, PCin,
                        RegWriteIn, MemReadIn, MemtoRegIn,
    output logic [31:0] Out,
    output logic        C, Z, O, N,
                        RegWriteOut, MemReadOut, MemtoRegOut,
                        PCout
);

logic [5:0]  ALUfunc;

logic [31:0] ALUout;
logic [63:0] MULout;
logic [31:0] ACCout;

logic ALUO, ALUZ, ALUN, ALUC;
logic ACCO, ACCZ, ACCN;

alu alu0 (
    .A       (A      ),
    .B       (B      ),
    .Shamt   (Shamt  ),
    .ALUfunc (ALUfunc),
    .Out     (ALUout ),
    .En      (LoadReg),
    .C       (ALUC   ),
    .Z       (ALUZ   ),
    .O       (ALUO   ),
    .N       (ALUN   )
);


assign MemReadOut  = MemReadIn;
assign MemtoRegOut = MemtoRegIn;

// TODO: These will eventually do something
assign RegWriteOut = RegWriteIn;
assign PCout       = PCin;


always_comb
    begin
        
        Out     = 0;
        
        ALUfunc = 0;
        MULfunc = 0;
        ACCfunc = 0;
        
        C       = 0;
        Z       = 0;
        O       = 0;
        N       = 0;
        
        if (ALUOp)
            case (Func)
            // TODO: Non-ALU instructions with ALU opcode
                MULT:
                MULTU:
                MFHI:
                MFLO:
                MTHI:
                MTLO:
                
                JALR:
                JR:
                
                default:
                    begin
                        ALUfunc = Func;
                        Out = ALUout;
                        C = ALUC;
                        Z = ALUZ;
                        O = ALUO;
                        N = ALUN;
                    end
            endcase
        
        if (MULOp)
            case (Func)
            // TODO: Non-MUL instructions with MUL opcode
                CLZ:
                CLO:
                
                default:
                    begin
                        // TODO: MUL instructions
                        Z = ACCZ;
                        O = ACCO;
                        N = ACCN;
                    end
            endcase

    end

endmodule

