//----------------------------------------
// File: ACCControl.sv
// Description: Accumulator controller for execute stage
// Primary Author: Ethan Bishop
// Other Contributors: 
//----------------------------------------

module ACCControl(
    input        [63:0] In,
    input               AddSub, SelA, SelB, LoSel, HiSel, ACCSel,
                        Clock, nReset,
    output logic [31:0] Out,
    output logic        Z, O, N
);

endmodule

