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
    output logic [15:0] SubOut0,
                        SubOut1,
                        SubOut2,
                        SubOut3,
                        SubOut4,
                        SubOut5,
                        SubOut6,
                        SubOut7,
                        SubOut8,
                        SubOut9,
                        SubOut10,
                        SubOut11,
                        SubOut12,
                        SubOut13,
                        SubOut14,
                        SubOut15
);

wire [7:0] a_hihi, b_hihi, a_hilo, b_hilo, a_lohi, b_lohi, a_lolo, b_lolo;

assign a_hihi = A[31:24];
assign a_hilo = A[23:16];
assign a_lohi = A[15: 8];
assign a_lolo = A[ 7: 0];
assign b_hihi = B[31:24];
assign b_hilo = B[23:16];
assign b_lohi = B[15: 8];
assign b_lolo = B[ 7: 0];

assign SubOut0  = a_hihi * b_hihi;
assign SubOut1  = a_hihi * b_hilo;
assign SubOut2  = a_hihi * b_lohi;
assign SubOut3  = a_hihi * b_lolo;

assign SubOut4  = a_hilo * b_hihi;
assign SubOut5  = a_hilo * b_hilo;
assign SubOut6  = a_hilo * b_lohi;
assign SubOut7  = a_hilo * b_lolo; 

assign SubOut8  = a_lohi * b_hihi;
assign SubOut9  = a_lohi * b_hilo;
assign SubOut10 = a_lohi * b_lohi;
assign SubOut11 = a_lohi * b_lolo;

assign SubOut12 = a_lolo * b_hihi;
assign SubOut13 = a_lolo * b_hilo;
assign SubOut14 = a_lolo * b_lohi;
assign SubOut15 = a_lolo * b_lolo;

endmodule
