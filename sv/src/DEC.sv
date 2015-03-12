//----------------------------------------
// File: DEC.sv
// Description: Decode pipeline stage
// Primary Author: Dominic Murphy
// Other Contributors: Dhanushan Raveendran
// Notes:
//----------------------------------------
module DEC(
        input                Clock       ,
                             nReset      ,
                             RegWriteIn  ,
        input        [31:0]  Instruction ,
                             RData       ,
                             InstrAddrIn ,
        input        [4:0]   RAddrIn     ,
                             RegAddr     ,
        output logic [31:0]  ImmData     ,
                             RsData      ,
                             RtData      ,
                             InstrAddrOut,
                             RegData     ,
        output logic [4:0]   RAddrOut    ,
                             RsAddr      ,
                             RtAddr      ,
        output logic         Branch      ,
                             Jump        ,
                             MemRead     ,
                             MemtoReg    ,
                             ALUOp       ,
                             MULOp       ,
                             MemWrite    ,
                             ALUSrc      ,
                             BRASrc      ,
                             RegWriteOut ,
        output logic [5:0]   ALUfunc     ,
        output logic [2:0]   Memfunc     ,
        output logic [4:0]   Shamt
);

wire [31:0] instrse;
wire [31:0] instrimm;
wire        shiftsel,
            unsgnsel,
            immsize;
wire [1:0]  regdst;
wire [4:0]  raddrinstr;

assign Shamt        = Instruction[10:6] ;
assign InstrAddrOut = InstrAddrIn       ;
assign RsAddr       = Instruction[25:21];
assign RtAddr       = Instruction[20:16];

decoder dec0 (
    .RegDst  (regdst                    ),
    .Branch  (Branch                    ),
    .Jump    (Jump                      ),
    .MemRead (MemRead                   ),
    .MemtoReg(MemtoReg                  ),
    .ALUOp   (ALUOp                     ),
    .MULOp   (MULOp                     ),
    .MemWrite(MemWrite                  ),
    .ALUSrc  (ALUSrc                    ),
    .BRASrc  (BRASrc                    ),
    .RegWrite(RegWriteOut               ),
    .ShiftSel(shiftsel                  ),
    .ImmSize (immsize                   ),
    .Unsgnsel(unsgnsel                  ),
    .Func    (ALUfunc                   ),
    .MemFunc (Memfunc                   ),
    .OpCode  (Instruction[31:26]        ),
    .FuncCode(Instruction[5:0]          ),
    .BraCode (Instruction[20:16]        )
);

registers reg0(
    .Clock   (Clock             ),
    .nReset  (nReset            ),
    .RegWrite(RegWriteIn        ),
    .RegAddr (RegAddr           ),
    .RdAddr  (RAddrIn           ),
    .RsAddr  (Instruction[25:21]),
    .RtAddr  (Instruction[20:16]),
    .RdData  (RData             ),
    .RsData  (RsData            ),
    .RtData  (RtData            ),
    .RegData (RegData           )
);

signextend se0(
    .In      (Instruction[15:0]),
    .Unsgnsel(unsgnsel         ),
    .Out     (instrse          )
);

mux #(.n(32)) mux1(
    .A  (instrse                   ),
    .B  ({Instruction[15:0], 16'd0}),
    .Y  (instrimm                  ),
    .Sel(shiftsel                  )
);

mux #(.n(32)) mux2(
    .A  (instrimm                 ),
    .B  ({6'd0, Instruction[25:0]}),
    .Y  (ImmData                  ),
    .Sel(immsize                  )
);

mux #(.n(5))mux3(             // regdst = 00, RAddrOut = rt
    .A  (Instruction[20:16]), // regdst = 01, RAddrOut = rd
    .B  (Instruction[15:11]),
    .Y  (raddrinstr        ),
    .Sel(regdst[0]         )
);

mux #(.n(5))mux4(             // regdst = 1x, RAddrOut = 31
    .A  (raddrinstr        ),
    .B  (5'd31             ), // ra = Reg 31 (return register)
    .Y  (RAddrOut          ),
    .Sel(regdst[1]         )
);

endmodule
