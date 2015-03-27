//-----------------------------------------------------------------------------
// File              : mult1.sv
// Description       : 1st Stage of a 2 stage multiplier.
// Primary Author    : Lewis Russell
// Other Contributors:
// Notes             :
//------------------------------------------------------------------------------
module mult1(
    input        [31:0] A      ,
                        B      ,
    output logic [31:0] SubOut0,
                        SubOut1,
                        SubOut2,
                        SubOut3
);

wire [15:0] a_hi, b_hi, a_lo, b_lo;

assign a_hi = A[31:16];
assign a_lo = A[15: 0];
assign b_hi = B[31:16];
assign b_lo = B[15: 0];

assign SubOut0 = a_hi * b_hi;
assign SubOut1 = a_hi * b_lo;
assign SubOut2 = a_lo * b_hi;
assign SubOut3 = a_lo * b_lo;

endmodule
