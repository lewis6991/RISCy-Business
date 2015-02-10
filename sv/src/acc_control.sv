//------------------------------------------------------------------------------
// File              : acc_control.sv
// Description       : Accumulator controller for execute stage
// Primary Author    : Ethan Bishop
// Other Contributors: Lewis Russell
// Notes             :
//------------------------------------------------------------------------------

module acc_control(
    input               Clock ,
                        nReset,
                        AddSub,
                        SelA  ,
                        SelB  ,
                        LoSel ,
                        HiSel ,
                        ACCSel,
    input        [63:0] In    ,
    output logic [31:0] Out   ,
    output logic        Z     , // Zero flag.
                        O     , // Overflow flag.
                        N       // Negative flag.
);

endmodule
