//------------------------------------------------------------------------------
// File              : WB.sv
// Description       : Write Back pipeline stage
// Primary Author    : Dominic Murphy
// Other Contributors: Lewis Russell
// Notes             : - A very basic stage. Simple a mux, along with some
//                       control wires.
//                     - Warning: Names have no meaning yet, hence have been
//                       arbitrarily chosen.
//------------------------------------------------------------------------------

`include "mem_func.sv"

module WB(
    input               MemtoReg,
    input        [31:0] ALUData ,
                        RtData  ,
                        MemData ,
    input  logic [ 2:0] Memfunc ,
    output logic [31:0] WBData
);

    logic [31:0] MemDataOut;

    always_comb
        case(Memfunc)
            `BS    : MemDataOut = {{24{MemData[ 7]}},MemData[ 7:0]};
            `BU    : MemDataOut = {       {24{1'b0}},MemData[ 7:0]};
            `HS    : MemDataOut = {{16{MemData[15]}},MemData[15:0]};
            `HU    : MemDataOut = {       {16{1'b0}},MemData[15:0]};
            `WD    : MemDataOut = MemData                          ;
            `WL    : MemDataOut = {    MemData[31:16],RtData[15:0]};
            `WR    : MemDataOut = {    RtData[31:16],MemData[15:0]};
            default: MemDataOut = MemData                          ;
        endcase

    mux mux4(
        .Sel(MemtoReg  ),
        .A  (ALUData   ),
        .B  (MemDataOut),
        .Y  (WBData    )
    );

endmodule
