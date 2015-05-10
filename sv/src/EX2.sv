//------------------------------------------------------------------------------
// File              : EX2.sv
// Description       : Second stage of Execute stage logic
// Primary Author    : Ethan Bishop
// Other Contributors: Lewis Russell, Dhanushan Raveendran
// Notes             :
//------------------------------------------------------------------------------

module EX2(
    input       C     ,
                Z     ,
                O     ,
                N     ,
                BrRt  ,
    input [2:0] BrCode,
    output      Taken 
);

branch branch0(
    .C     (C     ),
    .Z     (Z     ),
    .O     (O     ),
    .N     (N     ),
    .BrCode(BrCode),
    .BrRt  (BrRt  ),
    .Taken (Taken )
);

endmodule
