// Verilog simulation library for all c35 CORELIB voltages
// $Id: c35_CORELIB.v,v 3.70 2005/10/01 13:12:19 bka
// Owner: austriamicrosystems AG HIT-Kit: Digital

`celldefine
`timescale 1ns / 1ps

// Description : 1 bit HALF_ADDER

module ADD21_3B (A,B,CO,S);

output CO,S;
input A,B;

xor (S,B,A);
and (CO,B,A);

`ifdef functional
`else
specify
 (A => CO) = (1,1);
 (B => CO) = (1,1);
 (A => S ) = (1,1);
 (B => S ) = (1,1);
endspecify
`endif

endmodule
`endcelldefine


`celldefine
`timescale 1ns / 1ps

// Description : 1 bit HALF_ADDER

module ADD22_3B (A,B,CO,S);

output CO,S;
input A,B;

xor (S,B,A);
and (CO,B,A);

`ifdef functional
`else
specify
 (A => S ) = (1,1);
 (B => S ) = (1,1);
 (A => CO) = (1,1);
 (B => CO) = (1,1);
endspecify
`endif

endmodule
`endcelldefine


`celldefine
`timescale 1ns / 1ps

// Description : 1 bit FULL_ADDER

module ADD31_3B (A,B,CI,CO,S);

output CO,S;
input A,B,CI;

U_ADDR2_S (S,A,B,CI);
U_ADDR2_C (CO,A,B,CI);

`ifdef functional
`else
specify
 (A => S ) = (1,1);
 (B => S ) = (1,1);
 (CI => S ) = (1,1);
 (A => CO) = (1,1);
 (B => CO) = (1,1);
 (CI => CO) = (1,1); 
endspecify
`endif

endmodule
`endcelldefine


`celldefine
`timescale 1ns / 1ps

// Description : 1 bit FULL_ADDER

module ADD32_3B (A,B,CI,CO,S);

output CO,S;
input A,B,CI;

U_ADDR2_S (S,A,B,CI);
U_ADDR2_C (CO,A,B,CI);

`ifdef functional
`else
specify
 (A => S ) = (1,1);
 (B => S ) = (1,1);
 (CI => S ) = (1,1);
 (A => CO) = (1,1);
 (B => CO) = (1,1);
 (CI => CO) = (1,1); 
endspecify
`endif

endmodule
`endcelldefine


`celldefine
`timescale 1ns / 1ps

// Description : 2 wide 2-1 AND-OR-INVERT

module AOI210_3B (A,B,C,Q);

output Q;
input A,B,C;

and (g_1_out,A,B);
nor (Q,g_1_out,C);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine


`celldefine
`timescale 1ns / 1ps

// Description : 2 wide 2-1 AND-OR-INVERT

module AOI211_3B (A,B,C,Q);

output Q;
input A,B,C;

and (g_1_out,A,B);
nor (Q,g_1_out,C);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine


`celldefine
`timescale 1ns / 1ps

// Description : 3 wide 1-1-2 AND-OR-INVERT

module AOI2110_3B (A,B,C,D,Q);

output Q;
input A,B,C,D;

and (g_3_out,B,A);
nor (Q,D,C,g_3_out);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
 (D => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine


`celldefine
`timescale 1ns / 1ps

// Description : 3 wide 1-1-2 AND-OR-INVERT

module AOI2111_3B (A,B,C,D,Q);

output Q;
input A,B,C,D;

and (g_3_out,B,A);
nor (Q,D,C,g_3_out);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
 (D => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine


`celldefine
`timescale 1ns / 1ps

// Description : 3 wide 1-1-2 AND-OR-INVERT

module AOI2112_3B (A,B,C,D,Q);

output Q;
input A,B,C,D;

and (g_3_out,B,A);
nor (Q,D,C,g_3_out);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
 (D => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine


`celldefine
`timescale 1ns / 1ps

// Description : 2 wide 2-1 AND-OR-INVERT

module AOI212_3B (A,B,C,Q);

output Q;
input A,B,C;

and (g_1_out,A,B);
nor (Q,g_1_out,C);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine


`celldefine
`timescale 1ns / 1ps

// Description : 2 wide 2-2 AND-OR-INVERT

module AOI220_3B (A,B,C,D,Q);

output Q;
input A,B,C,D;

and (g_1_out,B,A);
and (g_2_out,D,C);
nor (Q,g_1_out,g_2_out);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (D => Q) = (1,1);
 (C => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine


`celldefine
`timescale 1ns / 1ps

// Description : 2 wide 2-2 AND-OR-INVERT

module AOI221_3B (A,B,C,D,Q);

output Q;
input A,B,C,D;

and (g_1_out,B,A);
and (g_2_out,D,C);
nor (Q,g_1_out,g_2_out);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (D => Q) = (1,1);
 (C => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine


`celldefine
`timescale 1ns / 1ps

// Description : 2 wide 2-2 AND-OR-INVERT

module AOI222_3B (A,B,C,D,Q);

output Q;
input A,B,C,D;

and (g_1_out,B,A);
and (g_2_out,D,C);
nor (Q,g_1_out,g_2_out);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (D => Q) = (1,1);
 (C => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine


`celldefine
`timescale 1ns / 1ps

// Description : 2 wide 3-1 AND-OR-INVERT

module AOI310_3B (A,B,C,D,Q);

output Q;
input A,B,C,D;

and (g_1_out,B,A,C);
nor (Q,g_1_out,D);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
 (D => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine


`celldefine
`timescale 1ns / 1ps

// Description : 2 wide 3-1 AND-OR-INVERT

module AOI311_3B (A,B,C,D,Q);

output Q;
input A,B,C,D;

and (g_1_out,B,A,C);
nor (Q,g_1_out,D);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
 (D => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine


`celldefine
`timescale 1ns / 1ps

// Description : 2 wide 3-1 AND-OR-INVERT

module AOI312_3B (A,B,C,D,Q);

output Q;
input A,B,C,D;

and (g_1_out,B,A,C);
nor (Q,g_1_out,D);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
 (D => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine


`celldefine
`timescale 1ns / 1ps

// Description : BUFFER

module BUF12_3B (A,Q);

output Q;
input A;

buf (Q,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine


`celldefine
`timescale 1ns / 1ps

// Description : BUFFER

module BUF15_3B (A,Q);

output Q;
input A;

buf (Q,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine


`celldefine
`timescale 1ns / 1ps

// Description : BUFFER

module BUF2_3B (A,Q);

output Q;
input A;

buf (Q,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : BUFFER

module BUF4_3B (A,Q);

output Q;
input A;

buf (Q,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : BUFFER

module BUF6_3B (A,Q);

output Q;
input A;

buf (Q,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : BUFFER

module BUF8_3B (A,Q);

output Q;
input A;

buf (Q,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : TRISTATE BUFFER with active high enable

module BUFE10_3B (A,E,Q);

output Q;
input A,E;

bufif1 (Q,A,E);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (E => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : TRISTATE BUFFER with active high enable

module BUFE12_3B (A,E,Q);

output Q;
input A,E;

bufif1 (Q,A,E);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (E => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : TRISTATE BUFFER with active high enable

module BUFE15_3B (A,E,Q);

output Q;
input A,E;

bufif1 (Q,A,E);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (E => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : TRISTATE BUFFER with active high enable

module BUFE2_3B (A,E,Q);

output Q;
input A,E;

bufif1 (Q,A,E);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (E => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : TRISTATE BUFFER with active high enable

module BUFE4_3B (A,E,Q);

output Q;
input A,E;

bufif1 (Q,A,E);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (E => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : TRISTATE BUFFER with active high enable

module BUFE6_3B (A,E,Q);

output Q;
input A,E;

bufif1 (Q,A,E);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (E => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : TRISTATE BUFFER with active high enable

module BUFE8_3B (A,E,Q);

output Q;
input A,E;

bufif1 (Q,A,E);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (E => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : TRISTATE BUFFER with active low enable

module BUFT10_3B (A,EN,Q);

output Q;
input A,EN;

bufif0 (Q,A,EN);

`ifdef functional
`else
specify
 (EN => Q) = (1,1);
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : TRISTATE BUFFER with active low enable

module BUFT12_3B (A,EN,Q);

output Q;
input A,EN;

bufif0 (Q,A,EN);

`ifdef functional
`else
specify
 (EN => Q) = (1,1);
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : TRISTATE BUFFER with active low enable

module BUFT15_3B (A,EN,Q);

output Q;
input A,EN;

bufif0 (Q,A,EN);

`ifdef functional
`else
specify
 (EN => Q) = (1,1);
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : TRISTATE BUFFER with active low enable

module BUFT2_3B (A,EN,Q);

output Q;
input A,EN;

bufif0 (Q,A,EN);

`ifdef functional
`else
specify
 (EN => Q) = (1,1);
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : TRISTATE BUFFER with active low enable

module BUFT4_3B (A,EN,Q);

output Q;
input A,EN;

bufif0 (Q,A,EN);

`ifdef functional
`else
specify
 (EN => Q) = (1,1);
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : TRISTATE BUFFER with active low enable

module BUFT6_3B (A,EN,Q);

output Q;
input A,EN;

bufif0 (Q,A,EN);

`ifdef functional
`else
specify
 (EN => Q) = (1,1);
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : TRISTATE BUFFER with active low enable

module BUFT8_3B (A,EN,Q);

output Q;
input A,EN;

bufif0 (Q,A,EN);

`ifdef functional
`else
specify
 (EN => Q) = (1,1);
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : BUFFER

module CLKBU12_3B (A,Q);

output Q;
input A;

buf (Q,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : BUFFER

module CLKBU15_3B (A,Q);

output Q;
input A;

buf (Q,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : BUFFER

module CLKBU2_3B (A,Q);

output Q;
input A;

buf (Q,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : BUFFER

module CLKBU4_3B (A,Q);

output Q;
input A;

buf (Q,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : BUFFER

module CLKBU6_3B (A,Q);

output Q;
input A;

buf (Q,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : BUFFER

module CLKBU8_3B (A,Q);

output Q;
input A;

buf (Q,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : INVERTER

module CLKIN0_3B (A,Q);

output Q;
input A;

not (Q,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : INVERTER

module CLKIN1_3B (A,Q);

output Q;
input A;

not (Q,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : INVERTER

module CLKIN10_3B (A,Q);

output Q;
input A;

not (Q,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : INVERTER

module CLKIN12_3B (A,Q);

output Q;
input A;

not (Q,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : INVERTER

module CLKIN15_3B (A,Q);

output Q;
input A;

not (Q,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : INVERTER

module CLKIN2_3B (A,Q);

output Q;
input A;

not (Q,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : INVERTER

module CLKIN3_3B (A,Q);

output Q;
input A;

not (Q,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : INVERTER

module CLKIN4_3B (A,Q);

output Q;
input A;

not (Q,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : INVERTER

module CLKIN6_3B (A,Q);

output Q;
input A;

not (Q,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : INVERTER

module CLKIN8_3B (A,Q);

output Q;
input A;

not (Q,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : DFF with rising edge clock,q and qb outputs

module DF1_3B (C,D,Q,QN);

output Q,QN;
input C,D;

`ifdef functional
U_FD_P_NO (buf_Q,D,C,1'b1);
`else
reg notifier;
U_FD_P_NO (buf_Q,D,C,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 $setup(posedge D, posedge C, 0, notifier);
 $setup(negedge D, posedge C, 0, notifier);
 $hold(posedge C, negedge D, 0, notifier);
 $hold(posedge C, posedge D, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : DFF with rising edge clock,q and qb outputs

module DF3_3B (C,D,Q,QN);

output Q,QN;
input C,D;

`ifdef functional
U_FD_P_NO (buf_Q,D,C,1'b1);
`else
reg notifier;
U_FD_P_NO (buf_Q,D,C,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 $setup(posedge D, posedge C, 0, notifier);
 $setup(negedge D, posedge C, 0, notifier);
 $hold(posedge C, negedge D, 0, notifier);
 $hold(posedge C, posedge D, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : DFF with rising edge clock,low clear,q and qb outputs

module DFC1_3B (C,D,Q,QN,RN);

output Q,QN;
input C,D,RN;

`ifdef functional
U_FD_P_RB_NO (buf_Q,D,C,RN,1'b1);
`else
reg notifier;
U_FD_P_RB_NO (buf_Q,D,C,RN,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 $setup(posedge D, posedge C, 0, notifier);
 $setup(negedge D, posedge C, 0, notifier);
 $recovery(posedge RN, posedge C, 0, notifier);
 $hold(posedge C, negedge D, 0, notifier);
 $hold(posedge C, posedge D, 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : DFF with rising edge clock,low clear,q and qb outputs

module DFC3_3B (C,D,Q,QN,RN);

output Q,QN;
input C,D,RN;

`ifdef functional
U_FD_P_RB_NO (buf_Q,D,C,RN,1'b1);
`else
reg notifier;
U_FD_P_RB_NO (buf_Q,D,C,RN,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 $setup(posedge D, posedge C, 0, notifier);
 $setup(negedge D, posedge C, 0, notifier);
 $recovery(posedge RN, posedge C, 0, notifier);
 $hold(posedge C, negedge D, 0, notifier);
 $hold(posedge C, posedge D, 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : DFF with rising edge clock,low preset,low clear,q and qb outputs

module DFCP1_3B (C,D,Q,QN,RN,SN);

output Q,QN;
input C,D,RN,SN;

`ifdef functional
U_FD_P_RB_SB_NO (buf_Q,D,C,RN,SN,1'b1);
`else
reg notifier;
U_FD_P_RB_SB_NO (buf_Q,D,C,RN,SN,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);


`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 (SN => QN) = (1,1);
 (SN => Q) = (1,1);
 $setup(posedge D, posedge C, 0, notifier);
 $setup(negedge D, posedge C, 0, notifier);
 $recovery(posedge RN, posedge C, 0, notifier);
 $recovery(posedge SN, posedge C, 0, notifier);
 $hold(posedge C, negedge D, 0, notifier);
 $hold(posedge C, posedge D, 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
 endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : DFF with rising edge clock,low preset,low clear,q and qb outputs

module DFCP3_3B (C,D,Q,QN,RN,SN);

output Q,QN;
input C,D,RN,SN;

`ifdef functional
U_FD_P_RB_SB_NO (buf_Q,D,C,RN,SN,1'b1);
`else
reg notifier;
U_FD_P_RB_SB_NO (buf_Q,D,C,RN,SN,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);


`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 (SN => QN) = (1,1);
 (SN => Q) = (1,1);
 $setup(posedge D, posedge C, 0, notifier);
 $setup(negedge D, posedge C, 0, notifier);
 $recovery(posedge RN, posedge C, 0, notifier);
 $recovery(posedge SN, posedge C, 0, notifier);
 $hold(posedge C, negedge D, 0, notifier);
 $hold(posedge C, posedge D, 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
 endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : BOOL_DFF with rising clock q and qb outputs

module DFE1_3B (C,D,E,Q,QN);

output Q,QN;
input C,D,E;

buf (Q,buf_Q);
not (QN,buf_Q);

U_MUX_2_1 (BOOL_OUT,buf_Q,D,E);
`ifdef functional
U_FD_P_NO (buf_Q,BOOL_OUT,C,1'b1);
`else
reg notifier;
U_FD_P_NO (buf_Q,BOOL_OUT,C,notifier);
`endif

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 $setup(posedge D, posedge C &&& (E), 0, notifier);
 $setup(negedge D, posedge C &&& (E), 0, notifier);
 $setup(posedge E, posedge C, 0, notifier);
 $setup(negedge E, posedge C, 0, notifier);
 $hold(posedge C &&& (E), negedge D, 0, notifier);
 $hold(posedge C &&& (E), posedge D, 0, notifier);
 $hold(posedge C, negedge E, 0, notifier);
 $hold(posedge C, posedge E, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : BOOL_DFF with rising clock q and qb outputs

module DFE3_3B (C,D,E,Q,QN);

output Q,QN;
input C,D,E;

buf (Q,buf_Q);
not (QN,buf_Q);

U_MUX_2_1 (BOOL_OUT,buf_Q,D,E);
`ifdef functional
U_FD_P_NO (buf_Q,BOOL_OUT,C,1'b1);
`else
reg notifier;
U_FD_P_NO (buf_Q,BOOL_OUT,C,notifier);
`endif

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 $setup(posedge D, posedge C &&& (E), 0, notifier);
 $setup(negedge D, posedge C &&& (E), 0, notifier);
 $setup(posedge E, posedge C, 0, notifier);
 $setup(negedge E, posedge C, 0, notifier);
 $hold(posedge C &&& (E), negedge D, 0, notifier);
 $hold(posedge C &&& (E), posedge D, 0, notifier);
 $hold(posedge C, negedge E, 0, notifier);
 $hold(posedge C, posedge E, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : BOOL_DFF with rising clock low clear q and qb outputs

module DFEC1_3B (C,D,E,Q,QN,RN);

output Q,QN;
input C,D,E,RN;

buf (Q,buf_Q);
not (QN,buf_Q);

U_MUX_2_1 (BOOL_OUT,buf_Q,D,E);
`ifdef functional
U_FD_P_RB_NO (buf_Q,BOOL_OUT,C,RN,1'b1);
`else
reg notifier;
U_FD_P_RB_NO (buf_Q,BOOL_OUT,C,RN,notifier);
`endif

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 $setup(posedge D, posedge C &&& (E), 0, notifier);
 $setup(negedge D, posedge C &&& (E), 0, notifier);
 $setup(posedge E, posedge C, 0, notifier);
 $setup(negedge E, posedge C, 0, notifier);
 $recovery(posedge RN, posedge C, 0, notifier);
 $hold(posedge C &&& (E), negedge D, 0, notifier);
 $hold(posedge C &&& (E), posedge D, 0, notifier);  
 $hold(posedge C, negedge E, 0, notifier);
 $hold(posedge C, posedge E, 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
 endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : BOOL_DFF with rising clock low clear q and qb outputs

module DFEC3_3B (C,D,E,Q,QN,RN);

output Q,QN;
input C,D,E,RN;

buf (Q,buf_Q);
not (QN,buf_Q);

U_MUX_2_1 (BOOL_OUT,buf_Q,D,E);
`ifdef functional
U_FD_P_RB_NO (buf_Q,BOOL_OUT,C,RN,1'b1);
`else
reg notifier;
U_FD_P_RB_NO (buf_Q,BOOL_OUT,C,RN,notifier);
`endif

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 $setup(posedge D, posedge C &&& (E), 0, notifier);
 $setup(negedge D, posedge C &&& (E), 0, notifier);
 $setup(posedge E, posedge C, 0, notifier);
 $setup(negedge E, posedge C, 0, notifier);
 $recovery(posedge RN, posedge C, 0, notifier);
 $hold(posedge C &&& (E), negedge D, 0, notifier);
 $hold(posedge C &&& (E), posedge D, 0, notifier);
 $hold(posedge C, negedge E, 0, notifier);
 $hold(posedge C, posedge E, 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
 endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : BOOL_DFF with rising clock low preset,low clear q and qb outputs

module DFECP1_3B (C,D,E,Q,QN,RN,SN);

output Q,QN;
input C,D,E,RN,SN;

buf (Q,buf_Q);
not (QN,buf_Q);

U_MUX_2_1 (BOOL_OUT,buf_Q,D,E);
`ifdef functional
U_FD_P_RB_SB_NO (buf_Q,BOOL_OUT,C,RN,SN,1'b1);
`else
reg notifier;
U_FD_P_RB_SB_NO (buf_Q,BOOL_OUT,C,RN,SN,notifier);
`endif

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 (SN => QN) = (1,1);
 (SN => Q) = (1,1);
 $setup(posedge D, posedge C &&& (E), 0, notifier);
 $setup(negedge D, posedge C &&& (E), 0, notifier);
 $setup(posedge E, posedge C, 0, notifier);
 $setup(negedge E, posedge C, 0, notifier);
 $recovery(posedge RN, posedge C, 0, notifier);
 $recovery(posedge SN, posedge C, 0, notifier);
 $hold(posedge C &&& (E), negedge D, 0, notifier);
 $hold(posedge C &&& (E), posedge D, 0, notifier);
 $hold(posedge C, negedge E, 0, notifier);
 $hold(posedge C, posedge E, 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
 endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : BOOL_DFF with rising clock low preset,low clear q and qb outputs

module DFECP3_3B (C,D,E,Q,QN,RN,SN);

output Q,QN;
input C,D,E,RN,SN;

buf (Q,buf_Q);
not (QN,buf_Q);

U_MUX_2_1 (BOOL_OUT,buf_Q,D,E);
`ifdef functional
U_FD_P_RB_SB_NO (buf_Q,BOOL_OUT,C,RN,SN,1'b1);
`else
reg notifier;
U_FD_P_RB_SB_NO (buf_Q,BOOL_OUT,C,RN,SN,notifier);
`endif

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 (SN => QN) = (1,1);
 (SN => Q) = (1,1);
 $setup(posedge D, posedge C &&& (E), 0, notifier);
 $setup(negedge D, posedge C &&& (E), 0, notifier);
 $setup(posedge E, posedge C, 0, notifier);
 $setup(negedge E, posedge C, 0, notifier);
 $recovery(posedge RN, posedge C, 0, notifier);
 $recovery(posedge SN, posedge C, 0, notifier);
 $hold(posedge C &&& (E), negedge D, 0, notifier);
 $hold(posedge C &&& (E), posedge D, 0, notifier);
 $hold(posedge C, negedge E, 0, notifier); 
 $hold(posedge C, posedge E, 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
 endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : BOOL_DFF with rising clock low preset q and qb outputs

module DFEP1_3B (C,D,E,Q,QN,SN);

output Q,QN;
input C,D,E,SN;

buf (Q,buf_Q);
not (QN,buf_Q);

U_MUX_2_1 (BOOL_OUT,buf_Q,D,E);
`ifdef functional
U_FD_P_SB_NO (buf_Q,BOOL_OUT,C,SN,1'b1);
`else
reg notifier;
U_FD_P_SB_NO (buf_Q,BOOL_OUT,C,SN,notifier);
`endif

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (SN => Q) = (1,1);
 (SN => QN) = (1,1);
 $setup(posedge D, posedge C &&& (E), 0, notifier);
 $setup(negedge D, posedge C &&& (E), 0, notifier);
 $setup(posedge E, posedge C, 0, notifier);
 $setup(negedge E, posedge C, 0, notifier);
 $recovery(posedge SN, posedge C, 0, notifier);
 $hold(posedge C &&& (E), negedge D, 0, notifier);
 $hold(posedge C &&& (E), posedge D, 0, notifier);
 $hold(posedge C, negedge E, 0, notifier);
 $hold(posedge C, posedge E, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
 endspecify 
`endif
endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : BOOL_DFF with rising clock low preset q and qb outputs

module DFEP3_3B (C,D,E,Q,QN,SN);

output Q,QN;
input C,D,E,SN;

buf (Q,buf_Q);
not (QN,buf_Q);

U_MUX_2_1 (BOOL_OUT,buf_Q,D,E);
`ifdef functional
U_FD_P_SB_NO (buf_Q,BOOL_OUT,C,SN,1'b1);
`else
reg notifier;
U_FD_P_SB_NO (buf_Q,BOOL_OUT,C,SN,notifier);
`endif


`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (SN => Q) = (1,1);
 (SN => QN) = (1,1);
 $setup(posedge D, posedge C &&& (E), 0, notifier);
 $setup(negedge D, posedge C &&& (E), 0, notifier);
 $setup(posedge E, posedge C, 0, notifier);
 $setup(negedge E, posedge C, 0, notifier);
 $recovery(posedge SN, posedge C, 0, notifier);
 $hold(posedge C &&& (E), negedge D, 0, notifier);
 $hold(posedge C &&& (E), posedge D, 0, notifier);  
 $hold(posedge C, negedge E, 0, notifier);
 $hold(posedge C, posedge E, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
 endspecify 
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : DFF with rising edge clock,low preset,q and qb outputs

module DFP1_3B (C,D,Q,QN,SN);

output Q,QN;
input C,D,SN;

`ifdef functional
U_FD_P_SB_NO (buf_Q,D,C,SN,1'b1);
`else
reg notifier;
U_FD_P_SB_NO (buf_Q,D,C,SN,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (SN => Q) = (1,1);
 (SN => QN) = (1,1);
 $setup(posedge D, posedge C, 0, notifier);
 $setup(negedge D, posedge C, 0, notifier);
 $recovery(posedge SN, posedge C, 0, notifier);
 $hold(posedge C, negedge D, 0, notifier);
 $hold(posedge C, posedge D, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : DFF with rising edge clock,low preset,q and qb outputs

module DFP3_3B (C,D,Q,QN,SN);

output Q,QN;
input C,D,SN;

`ifdef functional
U_FD_P_SB_NO (buf_Q,D,C,SN,1'b1);
`else
reg notifier;
U_FD_P_SB_NO (buf_Q,D,C,SN,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (SN => Q) = (1,1);
 (SN => QN) = (1,1);
 $setup(posedge D, posedge C, 0, notifier);
 $setup(negedge D, posedge C, 0, notifier);
 $recovery(posedge SN, posedge C, 0, notifier);
 $hold(posedge C, negedge D, 0, notifier);
 $hold(posedge C, posedge D, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : SCAN_DFF with rising edge clock,q and qb outputs

module DFS1_3B (C,D,Q,QN,SD,SE);

output Q,QN;
input C,D,SD,SE;

`ifdef functional
U_FD_P_NO (buf_Q,mux_out,C,1'b1);
`else
reg notifier;
U_FD_P_NO (buf_Q,mux_out,C,notifier);
`endif

U_MUX_2_1 (mux_out,D,SD,SE);
buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 $setup(posedge D, posedge C &&& (~SE), 0, notifier);
 $setup(negedge D, posedge C &&& (~SE), 0, notifier);
 $setup(posedge SD, posedge C &&& (SE), 0, notifier);
 $setup(negedge SD, posedge C &&& (SE), 0, notifier);
 $setup(posedge SE, posedge C, 0, notifier);
 $setup(negedge SE, posedge C, 0, notifier);
 $hold(posedge C &&& (~SE), posedge D, 0, notifier);
 $hold(posedge C &&& (~SE), negedge D, 0, notifier);
 $hold(posedge C &&& (SE), negedge SD, 0, notifier);
 $hold(posedge C &&& (SE), posedge SD, 0, notifier);
 $hold(posedge C, negedge SE, 0, notifier);
 $hold(posedge C, posedge SE, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : SCAN_DFF with rising edge clock,q and qb outputs

module DFS3_3B (C,D,Q,QN,SD,SE);

output Q,QN;
input C,D,SD,SE;

`ifdef functional
U_FD_P_NO (buf_Q,mux_out,C,1'b1);
`else
reg notifier;
U_FD_P_NO (buf_Q,mux_out,C,notifier);
`endif

U_MUX_2_1 (mux_out,D,SD,SE);
buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 $setup(posedge D, posedge C &&& (~SE), 0, notifier);
 $setup(negedge D, posedge C &&& (~SE), 0, notifier);
 $setup(posedge SD, posedge C &&& (SE), 0, notifier);
 $setup(negedge SD, posedge C &&& (SE), 0, notifier);
 $setup(posedge SE, posedge C, 0, notifier);
 $setup(negedge SE, posedge C, 0, notifier);
 $hold(posedge C &&& (~SE), posedge D, 0, notifier);
 $hold(posedge C &&& (~SE), negedge D, 0, notifier);
 $hold(posedge C &&& (SE), negedge SD, 0, notifier);
 $hold(posedge C &&& (SE), posedge SD, 0, notifier);
 $hold(posedge C, negedge SE, 0, notifier);
 $hold(posedge C, posedge SE, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : SCAN_DFF with rising edge clock,low clear,q and qb outputs

module DFSC1_3B (C,D,Q,QN,RN,SD,SE);

output Q,QN;
input C,D,RN,SD,SE;

`ifdef functional
U_FD_P_RB_NO (buf_Q,mux_out,C,RN,1'b1);
`else
reg notifier;
U_FD_P_RB_NO (buf_Q,mux_out,C,RN,notifier);
`endif

U_MUX_2_1 (mux_out,D,SD,SE);
buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 $setup(posedge D, posedge C &&& (~SE), 0, notifier);
 $setup(negedge D, posedge C &&& (~SE), 0, notifier);
 $recovery(posedge RN, posedge C, 0, notifier);
 $setup(posedge SD, posedge C &&& (SE), 0, notifier);
 $setup(negedge SD, posedge C &&& (SE), 0, notifier);
 $setup(posedge SE, posedge C, 0, notifier);
 $setup(negedge SE, posedge C, 0, notifier);
 $hold(posedge C &&& (~SE), posedge D, 0, notifier);
 $hold(posedge C &&& (~SE), negedge D, 0, notifier);
 $hold(posedge C &&& (SE), negedge SD, 0, notifier);
 $hold(posedge C &&& (SE), posedge SD, 0, notifier);
 $hold(posedge C, negedge SE, 0, notifier);
 $hold(posedge C, posedge SE, 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : SCAN_DFF with rising edge clock,low clear,q and qb outputs

module DFSC3_3B (C,D,Q,QN,RN,SD,SE);

output Q,QN;
input C,D,RN,SD,SE;

`ifdef functional
U_FD_P_RB_NO (buf_Q,mux_out,C,RN,1'b1);
`else
reg notifier;
U_FD_P_RB_NO (buf_Q,mux_out,C,RN,notifier);
`endif

U_MUX_2_1 (mux_out,D,SD,SE);
buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 $setup(posedge D, posedge C &&& (~SE), 0, notifier);
 $setup(negedge D, posedge C &&& (~SE), 0, notifier);
 $recovery(posedge RN, posedge C, 0, notifier);
 $setup(posedge SD, posedge C &&& (SE), 0, notifier);
 $setup(negedge SD, posedge C &&& (SE), 0, notifier);
 $setup(posedge SE, posedge C, 0, notifier);
 $setup(negedge SE, posedge C, 0, notifier);
 $hold(posedge C &&& (~SE), posedge D, 0, notifier);
 $hold(posedge C &&& (~SE), negedge D, 0, notifier);
 $hold(posedge C &&& (SE), negedge SD, 0, notifier);
 $hold(posedge C &&& (SE), posedge SD, 0, notifier);
 $hold(posedge C, negedge SE, 0, notifier);
 $hold(posedge C, posedge SE, 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : SCAN_DFF with rising edge clock,low preset,low clear,q and qb outputs

module DFSCP1_3B (C,D,Q,QN,RN,SD,SE,SN);

output Q,QN;
input C,D,RN,SD,SE,SN;

`ifdef functional
U_FD_P_RB_SB_NO (buf_Q,mux_out,C,RN,SN,1'b1);
`else
reg notifier;
U_FD_P_RB_SB_NO (buf_Q,mux_out,C,RN,SN,notifier);
`endif

U_MUX_2_1 (mux_out,D,SD,SE);

buf (Q,buf_Q);
not (QN,buf_Q);


`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 (SN => QN) = (1,1);
 (SN => Q) = (1,1);
 $setup(posedge D, posedge C &&& (~SE), 0, notifier);
 $setup(negedge D, posedge C &&& (~SE), 0, notifier);
 $recovery(posedge RN, posedge C, 0, notifier);
 $setup(posedge SD, posedge C &&& (SE), 0, notifier);
 $setup(negedge SD, posedge C &&& (SE), 0, notifier);
 $setup(posedge SE, posedge C, 0, notifier);
 $setup(negedge SE, posedge C, 0, notifier);
 $recovery(posedge SN, posedge C, 0, notifier);
 $hold(posedge C &&& (~SE), posedge D, 0, notifier);
 $hold(posedge C &&& (~SE), negedge D, 0, notifier);
 $hold(posedge C &&& (SE), negedge SD, 0, notifier);
 $hold(posedge C &&& (SE), posedge SD, 0, notifier);
 $hold(posedge C, negedge SE, 0, notifier);
 $hold(posedge C, posedge SE, 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : SCAN_DFF with rising edge clock,low preset,low clear,q and qb outputs

module DFSCP3_3B (C,D,Q,QN,RN,SD,SE,SN);

output Q,QN;
input C,D,RN,SD,SE,SN;

`ifdef functional
U_FD_P_RB_SB_NO (buf_Q,mux_out,C,RN,SN,1'b1);
`else
reg notifier;
U_FD_P_RB_SB_NO (buf_Q,mux_out,C,RN,SN,notifier);
`endif

U_MUX_2_1 (mux_out,D,SD,SE);
buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 (SN => QN) = (1,1);
 (SN => Q) = (1,1);
 $setup(posedge D, posedge C &&& (~SE), 0, notifier);
 $setup(negedge D, posedge C &&& (~SE), 0, notifier);
 $recovery(posedge RN, posedge C, 0, notifier);
 $setup(posedge SD, posedge C &&& (SE), 0, notifier);
 $setup(negedge SD, posedge C &&& (SE), 0, notifier);
 $setup(posedge SE, posedge C, 0, notifier);
 $setup(negedge SE, posedge C, 0, notifier);
 $recovery(posedge SN, posedge C, 0, notifier);
 $hold(posedge C &&& (~SE), posedge D, 0, notifier);
 $hold(posedge C &&& (~SE), negedge D, 0, notifier);
 $hold(posedge C &&& (SE), negedge SD, 0, notifier);
 $hold(posedge C &&& (SE), posedge SD, 0, notifier);
 $hold(posedge C, negedge SE, 0, notifier);
 $hold(posedge C, posedge SE, 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : BOOL_SCAN_DFF with rising clock q and qb outputs

module DFSE1_3B (C,D,E,Q,QN,SD,SE);

output Q,QN;
input C,D,E,SD,SE;

`ifdef functional
U_dfse_Q (buf_Q,C,E,SE,D,SD,1'b0);
`else
reg notifier;
U_dfse_Q (buf_Q,C,E,SE,D,SD,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);
and (EandNSE, E, ~SE);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 $setup(posedge D, posedge C &&& (EandNSE), 0, notifier);
 $setup(negedge D, posedge C &&& (EandNSE), 0, notifier);
 $setup(posedge E, posedge C, 0, notifier);
 $setup(negedge E, posedge C, 0, notifier);
 $setup(posedge SD, posedge C &&& (SE), 0, notifier);
 $setup(negedge SD, posedge C &&& (SE), 0, notifier);
 $setup(posedge SE, posedge C, 0, notifier);
 $setup(negedge SE, posedge C, 0, notifier);
 $hold(posedge C &&& (EandNSE), posedge D, 0, notifier);
 $hold(posedge C &&& (EandNSE), negedge D, 0, notifier);
 $hold(posedge C &&& (SE), negedge SD, 0, notifier);
 $hold(posedge C &&& (SE), posedge SD, 0, notifier);
 $hold(posedge C, negedge SE, 0, notifier);
 $hold(posedge C, posedge SE, 0, notifier);
 $hold(posedge C, negedge E, 0, notifier);
 $hold(posedge C, posedge E, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine



//
`celldefine
`timescale 1ns / 1ps

// Description : BOOL_SCAN_DFF with rising clock q and qb outputs

module DFSE3_3B (C,D,E,Q,QN,SD,SE);

output Q,QN;
input C,D,E,SD,SE;

`ifdef functional
U_dfse_Q (buf_Q,C,E,SE,D,SD,1'b0);
`else
reg notifier;
U_dfse_Q (buf_Q,C,E,SE,D,SD,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);
and (EandNSE, E, ~SE);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 $setup(posedge D, posedge C &&& (EandNSE), 0, notifier);
 $setup(negedge D, posedge C &&& (EandNSE), 0, notifier);
 $setup(posedge E, posedge C, 0, notifier);
 $setup(negedge E, posedge C, 0, notifier);
 $setup(posedge SD, posedge C &&& (SE), 0, notifier);
 $setup(negedge SD, posedge C &&& (SE), 0, notifier);
 $setup(posedge SE, posedge C, 0, notifier);
 $setup(negedge SE, posedge C, 0, notifier);
 $hold(posedge C &&& (EandNSE), posedge D, 0, notifier);
 $hold(posedge C &&& (EandNSE), negedge D, 0, notifier);
 $hold(posedge C &&& (SE), negedge SD, 0, notifier);
 $hold(posedge C &&& (SE), posedge SD, 0, notifier);
 $hold(posedge C, negedge SE, 0, notifier);
 $hold(posedge C, posedge SE, 0, notifier);
 $hold(posedge C, negedge E, 0, notifier);
 $hold(posedge C, posedge E, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : BOOL_SCAN_DFF with rising clock low clear q and qb outputs

module DFSEC1_3B (C,D,E,Q,QN,RN,SD,SE);

output Q,QN;
input C,D,E,RN,SD,SE;

`ifdef functional
U_dfsec_Q (buf_Q,C,RN,E,SE,D,SD,1'b0);
`else
reg notifier;
U_dfsec_Q (buf_Q,C,RN,E,SE,D,SD,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);
and (EandNSE, E, ~SE);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 $setup(posedge D, posedge C &&& (EandNSE), 0, notifier);
 $setup(negedge D, posedge C &&& (EandNSE), 0, notifier);
 $setup(posedge E, posedge C, 0, notifier);
 $setup(negedge E, posedge C, 0, notifier);
 $recovery(posedge RN, posedge C, 0, notifier);
 $setup(posedge SD, posedge C &&& (SE), 0, notifier);
 $setup(negedge SD, posedge C &&& (SE), 0, notifier);
 $setup(posedge SE, posedge C, 0, notifier);
 $setup(negedge SE, posedge C, 0, notifier);
 $hold(posedge C &&& (EandNSE), posedge D, 0, notifier);
 $hold(posedge C &&& (EandNSE), negedge D, 0, notifier);
 $hold(posedge C &&& (SE), negedge SD, 0, notifier);
 $hold(posedge C &&& (SE), posedge SD, 0, notifier);
 $hold(posedge C, negedge SE, 0, notifier);
 $hold(posedge C, posedge SE, 0, notifier);
 $hold(posedge C, negedge E, 0, notifier);
 $hold(posedge C, posedge E, 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine


//
`celldefine
`timescale 1ns / 1ps

// Description : BOOL_SCAN_DFF with rising clock low clear q and qb outputs

module DFSEC3_3B (C,D,E,Q,QN,RN,SD,SE);

output Q,QN;
input C,D,E,RN,SD,SE;

`ifdef functional
U_dfsec_Q (buf_Q,C,RN,E,SE,D,SD,1'b0);
`else
reg notifier;
U_dfsec_Q (buf_Q,C,RN,E,SE,D,SD,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);
and (EandNSE, E, ~SE);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 $setup(posedge D, posedge C &&& (EandNSE), 0, notifier);
 $setup(negedge D, posedge C &&& (EandNSE), 0, notifier);
 $setup(posedge E, posedge C, 0, notifier);
 $setup(negedge E, posedge C, 0, notifier);
 $recovery(posedge RN, posedge C, 0, notifier);
 $setup(posedge SD, posedge C &&& (SE), 0, notifier);
 $setup(negedge SD, posedge C &&& (SE), 0, notifier);
 $setup(posedge SE, posedge C, 0, notifier);
 $setup(negedge SE, posedge C, 0, notifier);
 $hold(posedge C &&& (EandNSE), posedge D, 0, notifier);
 $hold(posedge C &&& (EandNSE), negedge D, 0, notifier);
 $hold(posedge C &&& (SE), negedge SD, 0, notifier);
 $hold(posedge C &&& (SE), posedge SD, 0, notifier);
 $hold(posedge C, negedge SE, 0, notifier);
 $hold(posedge C, posedge SE, 0, notifier);
 $hold(posedge C, negedge E, 0, notifier);
 $hold(posedge C, posedge E, 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine


//
`celldefine
`timescale 1ns / 1ps

// Description : BOOL_SCAN_DFF with rising clock low preset,low clear q and qb outputs

module DFSECP1_3B (C,D,E,Q,QN,RN,SD,SE,SN);

output Q,QN;
input C,D,E,RN,SD,SE,SN;

`ifdef functional
U_dfsecp_Q (buf_Q,C,RN,SN,E,SE,D,SD,1'b0);
`else
reg notifier;
U_dfsecp_Q (buf_Q,C,RN,SN,E,SE,D,SD,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);
and (EandNSE, E, ~SE);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 (SN => QN) = (1,1);
 (SN => Q) = (1,1);
 $setup(posedge D, posedge C &&& (EandNSE), 0, notifier);
 $setup(negedge D, posedge C &&& (EandNSE), 0, notifier);
 $setup(posedge E, posedge C, 0, notifier);
 $setup(negedge E, posedge C, 0, notifier);
 $recovery(posedge RN, posedge C, 0, notifier);
 $setup(posedge SD, posedge C &&& (SE), 0, notifier);
 $setup(negedge SD, posedge C &&& (SE), 0, notifier);
 $setup(posedge SE, posedge C, 0, notifier);
 $setup(negedge SE, posedge C, 0, notifier);
 $recovery(posedge SN, posedge C, 0, notifier);
 $hold(posedge C &&& (EandNSE), posedge D, 0, notifier);
 $hold(posedge C &&& (EandNSE), negedge D, 0, notifier);
 $hold(posedge C &&& (SE), negedge SD, 0, notifier);
 $hold(posedge C &&& (SE), posedge SD, 0, notifier);
 $hold(posedge C, negedge SE, 0, notifier);
 $hold(posedge C, posedge SE, 0, notifier);
 $hold(posedge C, negedge E, 0, notifier);
 $hold(posedge C, posedge E, 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : BOOL_SCAN_DFF with rising clock low preset,low clear q and qb outputs

module DFSECP3_3B (C,D,E,Q,QN,RN,SD,SE,SN);

output Q,QN;
input C,D,E,RN,SD,SE,SN;

`ifdef functional
U_dfsecp_Q (buf_Q,C,RN,SN,E,SE,D,SD,1'b0);
`else
reg notifier;
U_dfsecp_Q (buf_Q,C,RN,SN,E,SE,D,SD,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);
and (EandNSE, E, ~SE);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 (SN => QN) = (1,1);
 (SN => Q) = (1,1);
 $setup(posedge D, posedge C &&& (EandNSE), 0, notifier);
 $setup(negedge D, posedge C &&& (EandNSE), 0, notifier);
 $setup(posedge E, posedge C, 0, notifier);
 $setup(negedge E, posedge C, 0, notifier);
 $recovery(posedge RN, posedge C, 0, notifier);
 $setup(posedge SD, posedge C &&& (SE), 0, notifier);
 $setup(negedge SD, posedge C &&& (SE), 0, notifier);
 $setup(posedge SE, posedge C, 0, notifier);
 $setup(negedge SE, posedge C, 0, notifier);
 $recovery(posedge SN, posedge C, 0, notifier);
 $hold(posedge C &&& (EandNSE), posedge D, 0, notifier);
 $hold(posedge C &&& (EandNSE), negedge D, 0, notifier);
 $hold(posedge C &&& (SE), negedge SD, 0, notifier);
 $hold(posedge C &&& (SE), posedge SD, 0, notifier);
 $hold(posedge C, negedge SE, 0, notifier);
 $hold(posedge C, posedge SE, 0, notifier);
 $hold(posedge C, negedge E, 0, notifier);
 $hold(posedge C, posedge E, 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : BOOL_SCAN_DFF with rising clock low preset q and qb outputs

module DFSEP1_3B (C,D,E,Q,QN,SD,SE,SN);

output Q,QN;
input C,D,E,SD,SE,SN;

`ifdef functional
U_dfsep_Q (buf_Q,C,SE,E,SN,D,SD,1'b0);
`else
reg notifier;
U_dfsep_Q (buf_Q,C,SE,E,SN,D,SD,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);
and (EandNSE, E, ~SE);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (SN => Q) = (1,1);
 (SN => QN) = (1,1);
 $setup(posedge D, posedge C &&& (EandNSE), 0, notifier);
 $setup(negedge D, posedge C &&& (EandNSE), 0, notifier);
 $setup(posedge E, posedge C, 0, notifier);
 $setup(negedge E, posedge C, 0, notifier);
 $setup(posedge SD, posedge C &&& (SE), 0, notifier);
 $setup(negedge SD, posedge C &&& (SE), 0, notifier);
 $setup(posedge SE, posedge C, 0, notifier);
 $setup(negedge SE, posedge C, 0, notifier);
 $hold(posedge C &&& (EandNSE), posedge D, 0, notifier);
 $hold(posedge C &&& (EandNSE), negedge D, 0, notifier);
 $hold(posedge C &&& (SE), negedge SD, 0, notifier);
 $hold(posedge C &&& (SE), posedge SD, 0, notifier);
 $hold(posedge C, negedge SE, 0, notifier);
 $hold(posedge C, posedge SE, 0, notifier);
 $hold(posedge C, negedge E, 0, notifier);
 $hold(posedge C, posedge E, 0, notifier);
 $recovery(posedge SN, posedge C, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine


//
`celldefine
`timescale 1ns / 1ps

// Description : BOOL_SCAN_DFF with rising clock low preset q and qb outputs

module DFSEP3_3B (C,D,E,Q,QN,SD,SE,SN);

output Q,QN;
input C,D,E,SD,SE,SN;

`ifdef functional
U_dfsep_Q (buf_Q,C,SE,E,SN,D,SD,1'b0);
`else
reg notifier;
U_dfsep_Q (buf_Q,C,SE,E,SN,D,SD,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);
and (EandNSE, E, ~SE);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (SN => Q) = (1,1);
 (SN => QN) = (1,1);
 $setup(posedge D, posedge C &&& (EandNSE), 0, notifier);
 $setup(negedge D, posedge C &&& (EandNSE), 0, notifier);
 $setup(posedge E, posedge C, 0, notifier);
 $setup(negedge E, posedge C, 0, notifier);
 $setup(posedge SD, posedge C &&& (SE), 0, notifier);
 $setup(negedge SD, posedge C &&& (SE), 0, notifier);
 $setup(posedge SE, posedge C, 0, notifier);
 $setup(negedge SE, posedge C, 0, notifier);
 $recovery(posedge SN, posedge C, 0, notifier); 
 $hold(posedge C &&& (EandNSE), posedge D, 0, notifier);
 $hold(posedge C &&& (EandNSE), negedge D, 0, notifier);
 $hold(posedge C &&& (SE), negedge SD, 0, notifier);
 $hold(posedge C &&& (SE), posedge SD, 0, notifier);
 $hold(posedge C, negedge SE, 0, notifier);
 $hold(posedge C, posedge SE, 0, notifier);
 $hold(posedge C, negedge E, 0, notifier);
 $hold(posedge C, posedge E, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : SCAN_DFF with rising edge clock,low preset,q and qb outputs

module DFSP1_3B (C,D,Q,QN,SD,SE,SN);

output Q,QN;
input C,D,SD,SE,SN;

`ifdef functional
U_FD_P_SB_NO (buf_Q,mux_out,C,SN,1'b1);
`else
reg notifier;
U_FD_P_SB_NO (buf_Q,mux_out,C,SN,notifier);
`endif

U_MUX_2_1 (mux_out,D,SD,SE);
buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (SN => Q) = (1,1);
 (SN => QN) = (1,1);
 $setup(posedge D, posedge C &&& (~SE), 0, notifier);
 $setup(negedge D, posedge C &&& (~SE), 0, notifier);
 $setup(posedge SD, posedge C &&& (SE), 0, notifier);
 $setup(negedge SD, posedge C &&& (SE), 0, notifier);
 $setup(posedge SE, posedge C, 0, notifier);
 $setup(negedge SE, posedge C, 0, notifier);
 $recovery(posedge SN, posedge C, 0, notifier);
 $hold(posedge C &&& (~SE), posedge D, 0, notifier);
 $hold(posedge C &&& (~SE), negedge D, 0, notifier);
 $hold(posedge C &&& (SE), negedge SD, 0, notifier);
 $hold(posedge C &&& (SE), posedge SD, 0, notifier);
 $hold(posedge C, negedge SE, 0, notifier);
 $hold(posedge C, posedge SE, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : SCAN_DFF with rising edge clock,low preset,q and qb outputs

module DFSP3_3B (C,D,Q,QN,SD,SE,SN);

output Q,QN;
input C,D,SD,SE,SN;

`ifdef functional
U_FD_P_SB_NO (buf_Q,mux_out,C,SN,1'b1);
`else
reg notifier;
U_FD_P_SB_NO (buf_Q,mux_out,C,SN,notifier);
`endif

U_MUX_2_1 (mux_out,D,SD,SE);
buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (SN => Q) = (1,1);
 (SN => QN) = (1,1);
 $setup(posedge D, posedge C &&& (~SE), 0, notifier);
 $setup(negedge D, posedge C &&& (~SE), 0, notifier);
 $setup(posedge SD, posedge C &&& (SE), 0, notifier);
 $setup(negedge SD, posedge C &&& (SE), 0, notifier);
 $setup(posedge SE, posedge C, 0, notifier);
 $setup(negedge SE, posedge C, 0, notifier);
 $recovery(posedge SN, posedge C, 0, notifier);
 $hold(posedge C &&& (~SE), posedge D, 0, notifier);
 $hold(posedge C &&& (~SE), negedge D, 0, notifier);
 $hold(posedge C &&& (SE), negedge SD, 0, notifier);
 $hold(posedge C &&& (SE), posedge SD, 0, notifier);
 $hold(posedge C, negedge SE, 0, notifier);
 $hold(posedge C, posedge SE, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : LATCH with low enable,q and qb outputs

module DL1_3B (D,GN,Q,QN);

output Q,QN;
input D,GN;

`ifdef functional
U_LD_N_NO (buf_Q,D,GN,1'b1);
`else
reg notifier;
U_LD_N_NO (buf_Q,D,GN,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
specify
 (D => Q) = (1,1);
 (D => QN) = (1,1);
 (GN => Q) = (1,1);
 (GN => QN) = (1,1);
 $setup(posedge D, posedge GN, 0, notifier);
 $setup(negedge D, posedge GN, 0, notifier);
 $hold(posedge GN, negedge D, 0, notifier);
 $hold(posedge GN, posedge D, 0, notifier);
 $width(negedge GN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : LATCH with low enable,q and qb outputs

module DL3_3B (D,GN,Q,QN);

output Q,QN;
input D,GN;

`ifdef functional
U_LD_N_NO (buf_Q,D,GN,1'b1);
`else
reg notifier;
U_LD_N_NO (buf_Q,D,GN,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
specify
 (D => Q) = (1,1);
 (D => QN) = (1,1);
 (GN => Q) = (1,1);
 (GN => QN) = (1,1);
 $setup(posedge D, posedge GN, 0, notifier);
 $setup(negedge D, posedge GN, 0, notifier);  
 $hold(posedge GN, negedge D, 0, notifier);
 $hold(posedge GN, posedge D, 0, notifier);
 $width(negedge GN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : LATCH with low enable,low clear,q and qb outputs

module DLC1_3B (D,GN,Q,QN,RN);

output Q,QN;
input D,GN,RN;

`ifdef functional
U_LD_P_RB_NO (buf_Q,D,GN,RN,1'b1);
`else
reg notifier;
U_LD_P_RB_NO (buf_Q,D,GN,RN,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
specify
 (D => Q) = (1,1);
 (D => QN) = (1,1);
 (GN => Q) = (1,1);
 (GN => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 $setup(posedge D, posedge GN, 0, notifier);
 $setup(negedge D, posedge GN, 0, notifier);
 $recovery(posedge RN, posedge GN, 0, notifier);
 $hold(posedge GN, negedge D, 0, notifier);
 $hold(posedge GN, posedge D, 0, notifier);
 $hold(posedge GN, posedge RN, 0, notifier);
 $width(negedge GN, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : LATCH with low enable,low clear,q and qb outputs

module DLC3_3B (D,GN,Q,QN,RN);

output Q,QN;
input D,GN,RN;

`ifdef functional
U_LD_P_RB_NO (buf_Q,D,GN,RN,1'b1);
`else
reg notifier;
U_LD_P_RB_NO (buf_Q,D,GN,RN,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
specify
 (D => Q) = (1,1);
 (D => QN) = (1,1);
 (GN => Q) = (1,1);
 (GN => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 $setup(posedge D, posedge GN, 0, notifier);
 $setup(negedge D, posedge GN, 0, notifier);
 $recovery(posedge RN, posedge GN, 0, notifier);
 $hold(posedge GN, negedge D, 0, notifier);
 $hold(posedge GN, posedge D, 0, notifier);
 $hold(posedge GN, posedge RN, 0, notifier);
 $width(negedge GN, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : LATCH with low enable,low preset,low clear,q and qb outputs

module DLCP1_3B (D,GN,Q,QN,RN,SN);

output Q,QN;
input D,GN,RN,SN;

`ifdef functional
U_LD_P_RB_SB_NO (buf_Q,D,GN,RN,SN,1'b1);
`else
reg notifier;
U_LD_P_RB_SB_NO (buf_Q,D,GN,RN,SN,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
specify
 (D => Q) = (1,1);
 (D => QN) = (1,1);
 (GN => Q) = (1,1);
 (GN => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 (SN => Q) = (1,1);
 (SN => QN) = (1,1);
 $setup(posedge D, posedge GN, 0, notifier);
 $setup(negedge D, posedge GN, 0, notifier);
 $recovery(posedge RN, posedge GN, 0, notifier);
 $recovery(posedge SN, posedge GN, 0, notifier);
 $hold(posedge GN, negedge D, 0, notifier);
 $hold(posedge GN, posedge D, 0, notifier);
 $hold(posedge GN, posedge RN, 0, notifier);
 $hold(posedge GN, posedge SN, 0, notifier);
 $width(negedge GN, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : LATCH with low enable,low preset,low clear,q and qb outputs

module DLCP3_3B (D,GN,Q,QN,RN,SN);

output Q,QN;
input D,GN,RN,SN;

`ifdef functional
U_LD_P_RB_SB_NO (buf_Q,D,GN,RN,SN,1'b1);
`else
reg notifier;
U_LD_P_RB_SB_NO (buf_Q,D,GN,RN,SN,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
specify
 (D => Q) = (1,1);
 (D => QN) = (1,1);
 (GN => Q) = (1,1);
 (GN => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 (SN => Q) = (1,1);
 (SN => QN) = (1,1);
 $setup(posedge D, posedge GN, 0, notifier);
 $setup(negedge D, posedge GN, 0, notifier);
 $recovery(posedge RN, posedge GN, 0, notifier);
 $recovery(posedge SN, posedge GN, 0, notifier);
 $hold(posedge GN, negedge D, 0, notifier);
 $hold(posedge GN, posedge D, 0, notifier);
 $hold(posedge GN, posedge RN, 0, notifier);
 $hold(posedge GN, posedge SN, 0, notifier);
 $width(negedge GN, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : LATCH with low enable,low preset,low clear,q output

module DLCPQ1_3B (D,GN,Q,RN,SN);

output Q;
input D,GN,RN,SN;

`ifdef functional
U_LD_P_RB_SB_NO (Q,D,GN,RN,SN,1'b1);
`else
reg notifier;
U_LD_P_RB_SB_NO (Q,D,GN,RN,SN,notifier);
`endif

`ifdef functional
`else
 specify
 (D => Q) = (1,1);
 (GN => Q) = (1,1);
 (RN => Q) = (1,1);
 (SN => Q) = (1,1);
 $setup(posedge D, posedge GN, 0, notifier);
 $setup(negedge D, posedge GN, 0, notifier);
 $recovery(posedge RN, posedge GN, 0, notifier);
 $recovery(posedge SN, posedge GN, 0, notifier);
 $hold(posedge GN, negedge D, 0, notifier);
 $hold(posedge GN, posedge D, 0, notifier);
 $hold(posedge GN, posedge RN, 0, notifier);
 $hold(posedge GN, posedge SN, 0, notifier);
 $width(negedge GN, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine


//
`celldefine
`timescale 1ns / 1ps

// Description : LATCH with low enable,low preset,low clear,q output

module DLCPQ3_3B (D,GN,Q,RN,SN);

output Q;
input D,GN,RN,SN;

`ifdef functional
U_LD_P_RB_SB_NO (Q,D,GN,RN,SN,1'b1);
`else
reg notifier;
U_LD_P_RB_SB_NO (Q,D,GN,RN,SN,notifier);
`endif

`ifdef functional
`else
 specify
 (D => Q) = (1,1);
 (GN => Q) = (1,1);
 (RN => Q) = (1,1);
 (SN => Q) = (1,1);
 $setup(posedge D, posedge GN, 0, notifier);
 $setup(negedge D, posedge GN, 0, notifier);
 $recovery(posedge RN, posedge GN, 0, notifier);
 $recovery(posedge SN, posedge GN, 0, notifier);
 $hold(posedge GN, negedge D, 0, notifier);
 $hold(posedge GN, posedge D, 0, notifier);
 $hold(posedge GN, posedge RN, 0, notifier);
 $hold(posedge GN, posedge SN, 0, notifier);
 $width(negedge GN, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : LATCH with low enable,low clear,q output

module DLCQ1_3B (D,GN,Q,RN);

output Q;
input D,GN,RN;

`ifdef functional
U_LD_P_RB_NO (Q,D,GN,RN,1'b1);
`else
reg notifier;
U_LD_P_RB_NO (Q,D,GN,RN,notifier);
`endif

`ifdef functional
`else
 specify
 (D => Q) = (1,1);
 (GN => Q) = (1,1);
 (RN => Q) = (1,1);
 $setup(posedge D, posedge GN, 0, notifier);
 $setup(negedge D, posedge GN, 0, notifier);
 $recovery(posedge RN, posedge GN, 0, notifier);
 $hold(posedge GN, negedge D, 0, notifier);
 $hold(posedge GN, posedge D, 0, notifier);
 $hold(posedge GN, posedge RN, 0, notifier);
 $width(negedge GN, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : LATCH with low enable,low clear,q output

module DLCQ3_3B (D,GN,Q,RN);

output Q;
input D,GN,RN;

`ifdef functional
U_LD_P_RB_NO (Q,D,GN,RN,1'b1);
`else
reg notifier;
U_LD_P_RB_NO (Q,D,GN,RN,notifier);
`endif

`ifdef functional
`else
 specify
 (D => Q) = (1,1);
 (GN => Q) = (1,1);
 (RN => Q) = (1,1);
 $setup(posedge D, posedge GN, 0, notifier);
 $setup(negedge D, posedge GN, 0, notifier);
 $recovery(posedge RN, posedge GN, 0, notifier);
 $hold(posedge GN, negedge D, 0, notifier);
 $hold(posedge GN, posedge D, 0, notifier);
 $hold(posedge GN, posedge RN, 0, notifier);
 $width(negedge GN, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : LATCH with low enable,low preset,q and qb outputs

module DLP1_3B (D,GN,Q,QN,SN);

output Q,QN;
input D,GN,SN;

`ifdef functional
U_LD_N_SB_NO (buf_Q,D,GN,SN,1'b1);
`else
reg notifier;
U_LD_N_SB_NO (buf_Q,D,GN,SN,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (D => Q) = (1,1);
 (D => QN) = (1,1);
 (GN => Q) = (1,1);
 (GN => QN) = (1,1);
 (SN => Q) = (1,1);
 (SN => QN) = (1,1);
 $setup(posedge D, posedge GN, 0, notifier);
 $setup(negedge D, posedge GN, 0, notifier);
 $recovery(posedge SN, posedge GN, 0, notifier);
 $hold(posedge GN, negedge D, 0, notifier);
 $hold(posedge GN, posedge D, 0, notifier);
 $hold(posedge GN, posedge SN, 0, notifier);
 $width(negedge GN, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : LATCH with low enable,low preset,q and qb outputs

module DLP3_3B (D,GN,Q,QN,SN);

output Q,QN;
input D,GN,SN;

`ifdef functional
U_LD_N_SB_NO (buf_Q,D,GN,SN,1'b1);
`else
reg notifier;
U_LD_N_SB_NO (buf_Q,D,GN,SN,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (D => Q) = (1,1);
 (D => QN) = (1,1);
 (GN => Q) = (1,1);
 (GN => QN) = (1,1);
 (SN => Q) = (1,1);
 (SN => QN) = (1,1);
 $setup(posedge D, posedge GN, 0, notifier);
 $setup(negedge D, posedge GN, 0, notifier);
 $recovery(posedge SN, posedge GN, 0, notifier);
 $hold(posedge GN, negedge D, 0, notifier);
 $hold(posedge GN, posedge D, 0, notifier);
 $hold(posedge GN, posedge SN, 0, notifier);
 $width(negedge GN, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : LATCH with low enable,low preset,q output

module DLPQ1_3B (D,GN,Q,SN);

output Q;
input D,GN,SN;

`ifdef functional
U_LD_N_SB_NO (Q,D,GN,SN,1'b1);
`else
reg notifier;
U_LD_N_SB_NO (Q,D,GN,SN,notifier);
`endif

`ifdef functional
`else
 specify
 (D => Q) = (1,1);
 (GN => Q) = (1,1);
 (SN => Q) = (1,1);
 $setup(posedge D, posedge GN, 0, notifier);
 $setup(negedge D, posedge GN, 0, notifier);
 $recovery(posedge SN, posedge GN, 0, notifier);
 $hold(posedge GN, posedge SN, 0, notifier);
 $hold(posedge GN, negedge D, 0, notifier);
 $hold(posedge GN, posedge D, 0, notifier);
 $width(negedge GN, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : LATCH with low enable,low preset,q output

module DLPQ3_3B (D,GN,Q,SN);

output Q;
input D,GN,SN;

`ifdef functional
U_LD_N_SB_NO (Q,D,GN,SN,1'b1);
`else
reg notifier;
U_LD_N_SB_NO (Q,D,GN,SN,notifier);
`endif

`ifdef functional
`else
 specify
 (D => Q) = (1,1);
 (GN => Q) = (1,1);
 (SN => Q) = (1,1);
 $setup(posedge D, posedge GN, 0, notifier);
 $setup(negedge D, posedge GN, 0, notifier);
 $recovery(posedge SN, posedge GN, 0, notifier);
 $hold(posedge GN, negedge D, 0, notifier);
 $hold(posedge GN, posedge D, 0, notifier);
 $hold(posedge GN, posedge SN, 0, notifier);
 $width(negedge GN, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : LATCH with low enable,q output

module DLQ1_3B (D,GN,Q);

output Q;
input D,GN;

`ifdef functional
U_LD_N_NO (Q,D,GN,1'b1);
`else
reg notifier;
U_LD_N_NO (Q,D,GN,notifier);
`endif

`ifdef functional
`else
 specify
 (D => Q) = (1,1);
 (GN => Q) = (1,1);
 $setup(posedge D, posedge GN, 0, notifier);
 $setup(negedge D, posedge GN, 0, notifier);
 $hold(posedge GN, negedge D, 0, notifier);
 $hold(posedge GN, posedge D, 0, notifier);
 $width(negedge GN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : LATCH with low enable,q output

module DLQ3_3B (D,GN,Q);

output Q;
input D,GN;

`ifdef functional
U_LD_N_NO (Q,D,GN,1'b1);
`else
reg notifier;
U_LD_N_NO (Q,D,GN,notifier);
`endif

`ifdef functional
`else
 specify
 (D => Q) = (1,1);
 (GN => Q) = (1,1);
 $setup(posedge D, posedge GN, 0, notifier);
 $setup(negedge D, posedge GN, 0, notifier);
 $hold(posedge GN, negedge D, 0, notifier);
 $hold(posedge GN, posedge D, 0, notifier);
 $width(negedge GN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : BUFFER

module DLY12_3B (A,Q);

output Q;
input A;

buf (Q,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : BUFFER

module DLY22_3B (A,Q);

output Q;
input A;

buf (Q,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : BUFFER

module DLY32_3B (A,Q);

output Q;
input A;

buf (Q,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : BUFFER

module DLY42_3B (A,Q);

output Q;
input A;

buf (Q,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 3 wide 2-2-2 AND-OR-INVERT

module IMAJ30_3B (A,B,C,Q);

output Q;
input A,B,C;

and (g_1_out,B,A);
and (g_2_out,C,B);
and (g_3_out,C,A);
nor (Q,g_1_out,g_2_out,g_3_out);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 3 wide 2-2-2 AND-OR-INVERT

module IMAJ31_3B (A,B,C,Q);

output Q;
input A,B,C;

and (g_1_out,B,A);
and (g_2_out,C,B);
and (g_3_out,C,A);
nor (Q,g_1_out,g_2_out,g_3_out);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 2 to 1 INVERTING MULTIPLEXER

module IMUX20_3B (A,B,Q,S);

output Q;
input A,B,S;

U_MUX_2_1_INV (Q,A,B,S);

`ifdef functional
`else
specify
 (S => Q) = (1,1);
 (A => Q) = (1,1);
 (B => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 2 to 1 INVERTING MULTIPLEXER

module IMUX21_3B (A,B,Q,S);

output Q;
input A,B,S;

U_MUX_2_1_INV (Q,A,B,S);

`ifdef functional
`else
specify
 (S => Q) = (1,1);
 (A => Q) = (1,1);
 (B => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 2 to 1 INVERTING MULTIPLEXER

module IMUX22_3B (A,B,Q,S);

output Q;
input A,B,S;

U_MUX_2_1_INV (Q,A,B,S);

`ifdef functional
`else
specify
 (S => Q) = (1,1);
 (A => Q) = (1,1);
 (B => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 2 to 1 INVERTING MULTIPLEXER

module IMUX23_3B (A,B,Q,S);

output Q;
input A,B,S;

U_MUX_2_1_INV (Q,A,B,S);

`ifdef functional
`else
specify
 (S => Q) = (1,1);
 (A => Q) = (1,1);
 (B => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps
 


module IMUX24_3B (A,B,Q,S);

output Q;
input A,B,S;

U_MUX_2_1_INV (Q,A,B,S);

`ifdef functional
`else
specify
 (S => Q) = (1,1);
 (A => Q) = (1,1);
 (B => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 3 to 1 INVERTING MULTIPLEXER

module IMUX30_3B (A,B,C,Q,S0,S1);

output Q;
input A,B,C,S0,S1;

U_MUX_3_2_INV (Q,A,B,C,S0,S1);

`ifdef functional
`else
specify
 (S0 => Q) = (1,1);
 (S1 => Q) = (1,1);
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 3 to 1 INVERTING MULTIPLEXER

module IMUX31_3B (A,B,C,Q,S0,S1);

output Q;
input A,B,C,S0,S1;

U_MUX_3_2_INV (Q,A,B,C,S0,S1);

`ifdef functional
`else
specify
 (S0 => Q) = (1,1);
 (S1 => Q) = (1,1);
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 3 to 1 INVERTING MULTIPLEXER

module IMUX32_3B (A,B,C,Q,S0,S1);

output Q;
input A,B,C,S0,S1;

U_MUX_3_2_INV (Q,A,B,C,S0,S1);

`ifdef functional
`else
specify
 (S0 => Q) = (1,1);
 (S1 => Q) = (1,1);
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 3 to 1 INVERTING MULTIPLEXER

module IMUX33_3B (A,B,C,Q,S0,S1);

output Q;
input A,B,C,S0,S1;

U_MUX_3_2_INV (Q,A,B,C,S0,S1);

`ifdef functional
`else
specify
 (S0 => Q) = (1,1);
 (S1 => Q) = (1,1);
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 4 to 1 INVERTING MULTIPLEXER

module IMUX40_3B (A,B,C,D,Q,S0,S1);

output Q;
input A,B,C,D,S0,S1;

U_MUX_4_2_INV (Q,A,B,C,D,S0,S1);

`ifdef functional
`else
specify
 (S0 => Q) = (1,1);
 (S1 => Q) = (1,1);
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
 (D => Q) = (1,1); 
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 4 to 1 INVERTING MULTIPLEXER

module IMUX41_3B (A,B,C,D,Q,S0,S1);

output Q;
input A,B,C,D,S0,S1;

U_MUX_4_2_INV (Q,A,B,C,D,S0,S1);

`ifdef functional
`else
specify
 (S0 => Q) = (1,1);
 (S1 => Q) = (1,1);
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
 (D => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 4 to 1 INVERTING MULTIPLEXER

module IMUX42_3B (A,B,C,D,Q,S0,S1);

output Q;
input A,B,C,D,S0,S1;

U_MUX_4_2_INV (Q,A,B,C,D,S0,S1);

`ifdef functional
`else
specify
 (S0 => Q) = (1,1);
 (S1 => Q) = (1,1);
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
 (D => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : INVERTER

module INV0_3B (A,Q);

output Q;
input A;

not (Q,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : INVERTER

module INV1_3B (A,Q);

output Q;
input A;

not (Q,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : INVERTER

module INV10_3B (A,Q);

output Q;
input A;

not (Q,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : INVERTER

module INV12_3B (A,Q);

output Q;
input A;

not (Q,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : INVERTER

module INV15_3B (A,Q);

output Q;
input A;

not (Q,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : INVERTER

module INV2_3B (A,Q);

output Q;
input A;

not (Q,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : INVERTER

module INV3_3B (A,Q);

output Q;
input A;

not (Q,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : INVERTER

module INV4_3B (A,Q);

output Q;
input A;

not (Q,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : INVERTER

module INV6_3B (A,Q);

output Q;
input A;

not (Q,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : INVERTER

module INV8_3B (A,Q);

output Q;
input A;

not (Q,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : JKFF with rising edge clock,j and k,q and qb outputs

module JK1_3B (C,J,K,Q,QN);

output Q,QN;
input C,J,K;

`ifdef functional
U_FJK_P_NO (buf_Q,J,K,C,1'b1);
`else
reg notifier;
U_FJK_P_NO (buf_Q,J,K,C,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 $setup(posedge J, posedge C, 0, notifier);
 $setup(negedge J, posedge C, 0, notifier);
 $setup(posedge K, posedge C, 0, notifier);
 $setup(negedge K, posedge C, 0, notifier);
 $hold(posedge C, negedge J, 0, notifier);
 $hold(posedge C, posedge J, 0, notifier);
 $hold(posedge C, negedge K, 0, notifier);
 $hold(posedge C, posedge K, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : JKFF with rising edge clock,j and k,q and qb outputs

module JK3_3B (C,J,K,Q,QN);

output Q,QN;
input C,J,K;

`ifdef functional
U_FJK_P_NO (buf_Q,J,K,C,1'b1);
`else
reg notifier;
U_FJK_P_NO (buf_Q,J,K,C,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 $setup(posedge J, posedge C, 0, notifier);
 $setup(negedge J, posedge C, 0, notifier);
 $setup(posedge K, posedge C, 0, notifier);
 $setup(negedge K, posedge C, 0, notifier);
 $hold(posedge C, negedge J, 0, notifier);
 $hold(posedge C, posedge J, 0, notifier);
 $hold(posedge C, negedge K, 0, notifier);
 $hold(posedge C, posedge K, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : JKFF with rising edge clock,low clear,j and k,q and qb outputs

module JKC1_3B (C,J,K,Q,QN,RN);

output Q,QN;
input C,J,K,RN;

`ifdef functional
U_FJK_P_RB_NO (buf_Q,J,K,C,RN,1'b1);
`else
reg notifier;
U_FJK_P_RB_NO (buf_Q,J,K,C,RN,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 $setup(posedge J, posedge C, 0, notifier);
 $setup(negedge J, posedge C, 0, notifier);
 $setup(posedge K, posedge C, 0, notifier);
 $setup(negedge K, posedge C, 0, notifier);
 $recovery(posedge RN, posedge C, 0, notifier);
 $hold(posedge C, negedge J, 0, notifier);
 $hold(posedge C, posedge J, 0, notifier);
 $hold(posedge C, negedge K, 0, notifier);
 $hold(posedge C, posedge K, 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : JKFF with rising edge clock,low clear,j and k,q and qb outputs

module JKC3_3B (C,J,K,Q,QN,RN);

output Q,QN;
input C,J,K,RN;

`ifdef functional
U_FJK_P_RB_NO (buf_Q,J,K,C,RN,1'b1);
`else
reg notifier;
U_FJK_P_RB_NO (buf_Q,J,K,C,RN,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 $setup(posedge J, posedge C, 0, notifier);
 $setup(negedge J, posedge C, 0, notifier);
 $setup(posedge K, posedge C, 0, notifier);
 $setup(negedge K, posedge C, 0, notifier);
 $recovery(posedge RN, posedge C, 0, notifier);
 $hold(posedge C, negedge J, 0, notifier);
 $hold(posedge C, posedge J, 0, notifier);
 $hold(posedge C, negedge K, 0, notifier);
 $hold(posedge C, posedge K, 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : JKFF with rising edge clock,low preset,low clear,j and k,q and qb outputs

module JKCP1_3B (C,J,K,Q,QN,RN,SN);

output Q,QN;
input C,J,K,RN,SN;

`ifdef functional
U_FJK_P_RB_SB_NO (buf_Q,J,K,C,RN,SN,1'b1);
`else
reg notifier;
U_FJK_P_RB_SB_NO (buf_Q,J,K,C,RN,SN,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 (SN => QN) = (1,1);
 (SN => Q) = (1,1);
 $setup(posedge J, posedge C, 0, notifier);
 $setup(negedge J, posedge C, 0, notifier);
 $setup(posedge K, posedge C, 0, notifier);
 $setup(negedge K, posedge C, 0, notifier);
 $recovery(posedge RN, posedge C, 0, notifier);
 $recovery(posedge SN, posedge C, 0, notifier);
 $hold(posedge C, negedge J, 0, notifier);
 $hold(posedge C, posedge J, 0, notifier);
 $hold(posedge C, negedge K, 0, notifier);
 $hold(posedge C, posedge K, 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : JKFF with rising edge clock,low preset,low clear,j and k,q and qb outputs

module JKCP3_3B (C,J,K,Q,QN,RN,SN);

output Q,QN;
input C,J,K,RN,SN;

`ifdef functional
U_FJK_P_RB_SB_NO (Q,J,K,C,RN,SN,1'b1);
`else
reg notifier;
U_FJK_P_RB_SB_NO (buf_Q,J,K,C,RN,SN,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);


`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 (SN => QN) = (1,1);
 (SN => Q) = (1,1);
 $setup(posedge J, posedge C, 0, notifier);
 $setup(negedge J, posedge C, 0, notifier);
 $setup(posedge K, posedge C, 0, notifier);
 $setup(negedge K, posedge C, 0, notifier);
 $recovery(posedge RN, posedge C, 0, notifier);
 $recovery(posedge SN, posedge C, 0, notifier);
 $hold(posedge C, negedge J, 0, notifier);
 $hold(posedge C, posedge J, 0, notifier);
 $hold(posedge C, negedge K, 0, notifier);
 $hold(posedge C, posedge K, 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : JKFF with rising edge clock,low preset,j and k,q and qb outputs

module JKP1_3B (C,J,K,Q,QN,SN);

output Q,QN;
input C,J,K,SN;

`ifdef functional
U_FJK_P_SB_NO (buf_Q,J,K,C,SN,1'b1);
`else
reg notifier;
U_FJK_P_SB_NO (buf_Q,J,K,C,SN,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (SN => Q) = (1,1);
 (SN => QN) = (1,1);
 $setup(posedge J, posedge C, 0, notifier);
 $setup(negedge J, posedge C, 0, notifier);
 $setup(posedge K, posedge C, 0, notifier);
 $setup(negedge K, posedge C, 0, notifier);
 $recovery(posedge SN, posedge C, 0, notifier);
 $hold(posedge C, negedge J, 0, notifier);
 $hold(posedge C, posedge J, 0, notifier);
 $hold(posedge C, negedge K, 0, notifier);
 $hold(posedge C, posedge K, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : JKFF with rising edge clock,low preset,j and k,q and qb outputs

module JKP3_3B (C,J,K,Q,QN,SN);

output Q,QN;
input C,J,K,SN;

`ifdef functional
U_FJK_P_SB_NO (buf_Q,J,K,C,SN,1'b1);
`else
reg notifier;
U_FJK_P_SB_NO (buf_Q,J,K,C,SN,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (SN => Q) = (1,1);
 (SN => QN) = (1,1);
 $setup(posedge J, posedge C, 0, notifier);
 $setup(negedge J, posedge C, 0, notifier);
 $setup(posedge K, posedge C, 0, notifier);
 $setup(negedge K, posedge C, 0, notifier);
 $recovery(posedge SN, posedge C, 0, notifier);
 $hold(posedge C, negedge J, 0, notifier);
 $hold(posedge C, posedge J, 0, notifier);
 $hold(posedge C, negedge K, 0, notifier);
 $hold(posedge C, posedge K, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
 endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : SCAN_JKFF with rising clock q and qb outputs

module JKS1_3B (C,J,K,Q,QN,SD,SE);

output Q,QN;
input C,J,K,SD,SE;

`ifdef functional
U_jks_Q (buf_Q,C,SE,J,K,SD,1'b0);
`else
reg notifier;
U_jks_Q (buf_Q,C,SE,J,K,SD,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 $setup(posedge J, posedge C &&& (~SE), 0, notifier);
 $setup(negedge J, posedge C &&& (~SE), 0, notifier);
 $setup(posedge K, posedge C &&& (~SE), 0, notifier);
 $setup(negedge K, posedge C &&& (~SE), 0, notifier);
 $setup(posedge SD, posedge C &&& (SE), 0, notifier);
 $setup(negedge SD, posedge C &&& (SE), 0, notifier);
 $setup(posedge SE, posedge C, 0, notifier);
 $setup(negedge SE, posedge C, 0, notifier);
 $hold(posedge C &&& (~SE), negedge J, 0, notifier);
 $hold(posedge C &&& (~SE), posedge J, 0, notifier);  
 $hold(posedge C &&& (~SE), negedge K, 0, notifier);
 $hold(posedge C &&& (~SE), posedge K, 0, notifier);
 $hold(posedge C &&& (SE), negedge SD, 0, notifier);
 $hold(posedge C &&& (SE), posedge SD, 0, notifier);
 $hold(posedge C, negedge SE, 0, notifier);
 $hold(posedge C, posedge SE, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine


//
`celldefine
`timescale 1ns / 1ps

// Description : SCAN_JKFF with rising clock q and qb outputs

module JKS3_3B (C,J,K,Q,QN,SD,SE);

output Q,QN;
input C,J,K,SD,SE;

`ifdef functional
U_jks_Q (buf_Q,C,SE,J,K,SD,1'b0);
`else
reg notifier;
U_jks_Q (buf_Q,C,SE,J,K,SD,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 $setup(posedge J, posedge C &&& (~SE), 0, notifier);
 $setup(negedge J, posedge C &&& (~SE), 0, notifier);
 $setup(posedge K, posedge C &&& (~SE), 0, notifier);
 $setup(negedge K, posedge C &&& (~SE), 0, notifier);
 $setup(posedge SD, posedge C &&& (SE), 0, notifier);
 $setup(negedge SD, posedge C &&& (SE), 0, notifier);
 $setup(posedge SE, posedge C, 0, notifier);
 $setup(negedge SE, posedge C, 0, notifier);
 $hold(posedge C &&& (~SE), negedge J, 0, notifier);
 $hold(posedge C &&& (~SE), posedge J, 0, notifier);  
 $hold(posedge C &&& (~SE), negedge K, 0, notifier);
 $hold(posedge C &&& (~SE), posedge K, 0, notifier);
 $hold(posedge C &&& (SE), negedge SD, 0, notifier);
 $hold(posedge C &&& (SE), posedge SD, 0, notifier);
 $hold(posedge C, negedge SE, 0, notifier);
 $hold(posedge C, posedge SE, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine


//
`celldefine
`timescale 1ns / 1ps

// Description : SCAN_JKFF with rising clock low clear q and qb outputs

module JKSC1_3B (C,J,K,Q,QN,RN,SD,SE);

output Q,QN;
input C,J,K,RN,SD,SE;

`ifdef functional
U_jksc_Q (buf_Q,C,RN,SE,J,K,SD,1'b0);
`else
reg notifier;
U_jksc_Q (buf_Q,C,RN,SE,J,K,SD,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 $setup(posedge J, posedge C &&& (~SE), 0, notifier);
 $setup(negedge J, posedge C &&& (~SE), 0, notifier);
 $setup(posedge K, posedge C &&& (~SE), 0, notifier);
 $setup(negedge K, posedge C &&& (~SE), 0, notifier);
 $recovery(posedge RN, posedge C, 0, notifier);
 $setup(posedge SD, posedge C &&& (SE), 0, notifier);
 $setup(negedge SD, posedge C &&& (SE), 0, notifier);
 $setup(posedge SE, posedge C, 0, notifier);
 $setup(negedge SE, posedge C, 0, notifier);
 $hold(posedge C &&& (~SE), negedge J, 0, notifier);
 $hold(posedge C &&& (~SE), posedge J, 0, notifier);  
 $hold(posedge C &&& (~SE), negedge K, 0, notifier);
 $hold(posedge C &&& (~SE), posedge K, 0, notifier);
 $hold(posedge C &&& (SE), negedge SD, 0, notifier);
 $hold(posedge C &&& (SE), posedge SD, 0, notifier);
 $hold(posedge C, negedge SE, 0, notifier);
 $hold(posedge C, posedge SE, 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : SCAN_JKFF with rising clock low clear q and qb outputs

module JKSC3_3B (C,J,K,Q,QN,RN,SD,SE);

output Q,QN;
input C,J,K,RN,SD,SE;

`ifdef functional
U_jksc_Q (buf_Q,C,RN,SE,J,K,SD,1'b0);
`else
reg notifier;
U_jksc_Q (buf_Q,C,RN,SE,J,K,SD,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 $setup(posedge J, posedge C &&& (~SE), 0, notifier);
 $setup(negedge J, posedge C &&& (~SE), 0, notifier);
 $setup(posedge K, posedge C &&& (~SE), 0, notifier);
 $setup(negedge K, posedge C &&& (~SE), 0, notifier);
 $recovery(posedge RN, posedge C, 0, notifier);
 $setup(posedge SD, posedge C &&& (SE), 0, notifier);
 $setup(negedge SD, posedge C &&& (SE), 0, notifier);
 $setup(posedge SE, posedge C, 0, notifier);
 $setup(negedge SE, posedge C, 0, notifier);
 $hold(posedge C &&& (~SE), negedge J, 0, notifier);
 $hold(posedge C &&& (~SE), posedge J, 0, notifier);  
 $hold(posedge C &&& (~SE), negedge K, 0, notifier);
 $hold(posedge C &&& (~SE), posedge K, 0, notifier);
 $hold(posedge C &&& (SE), negedge SD, 0, notifier);
 $hold(posedge C &&& (SE), posedge SD, 0, notifier);
 $hold(posedge C, negedge SE, 0, notifier);
 $hold(posedge C, posedge SE, 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine


//
`celldefine
`timescale 1ns / 1ps

// Description : SCAN_JKFF with rising clock low clear,low preset q and qb outputs

module JKSCP1_3B (C,J,K,Q,QN,RN,SD,SE,SN);

output Q,QN;
input C,J,K,RN,SD,SE,SN;


`ifdef functional
U_jkscp_Q (buf_Q,C,RN,SN,SE,J,K,SD,1'b0);
`else
reg notifier;
U_jkscp_Q (buf_Q,C,RN,SN,SE,J,K,SD,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);


`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 (SN => QN) = (1,1);
 (SN => Q) = (1,1);
 $setup(posedge J, posedge C &&& (~SE), 0, notifier);
 $setup(negedge J, posedge C &&& (~SE), 0, notifier);
 $setup(posedge K, posedge C &&& (~SE), 0, notifier);
 $setup(negedge K, posedge C &&& (~SE), 0, notifier);
 $recovery(posedge RN, posedge C, 0, notifier);
 $setup(posedge SD, posedge C &&& (SE), 0, notifier);
 $setup(negedge SD, posedge C &&& (SE), 0, notifier);
 $setup(posedge SE, posedge C, 0, notifier);
 $setup(negedge SE, posedge C, 0, notifier);
 $recovery(posedge SN, posedge C, 0, notifier);
 $hold(posedge C &&& (~SE), negedge J, 0, notifier);
 $hold(posedge C &&& (~SE), posedge J, 0, notifier);  
 $hold(posedge C &&& (~SE), negedge K, 0, notifier);
 $hold(posedge C &&& (~SE), posedge K, 0, notifier);
 $hold(posedge C &&& (SE), negedge SD, 0, notifier);
 $hold(posedge C &&& (SE), posedge SD, 0, notifier);
 $hold(posedge C, negedge SE, 0, notifier);
 $hold(posedge C, posedge SE, 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine


//
`celldefine
`timescale 1ns / 1ps

// Description : SCAN_JKFF with rising clock low clear,low preset q and qb outputs

module JKSCP3_3B (C,J,K,Q,QN,RN,SD,SE,SN);

output Q,QN;
input C,J,K,RN,SD,SE,SN;

`ifdef functional
U_jkscp_Q (buf_Q,C,RN,SN,SE,J,K,SD,1'b0);
`else
reg notifier;
U_jkscp_Q (buf_Q,C,RN,SN,SE,J,K,SD,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 (SN => QN) = (1,1);
 (SN => Q) = (1,1);
 $setup(posedge J, posedge C &&& (~SE), 0, notifier);
 $setup(negedge J, posedge C &&& (~SE), 0, notifier);
 $setup(posedge K, posedge C &&& (~SE), 0, notifier);
 $setup(negedge K, posedge C &&& (~SE), 0, notifier);
 $recovery(posedge RN, posedge C, 0, notifier);
 $setup(posedge SD, posedge C &&& (SE), 0, notifier);
 $setup(negedge SD, posedge C &&& (SE), 0, notifier);
 $setup(posedge SE, posedge C, 0, notifier);
 $setup(negedge SE, posedge C, 0, notifier);
 $recovery(posedge SN, posedge C, 0, notifier);
 $hold(posedge C &&& (~SE), negedge J, 0, notifier);
 $hold(posedge C &&& (~SE), posedge J, 0, notifier);  
 $hold(posedge C &&& (~SE), negedge K, 0, notifier);
 $hold(posedge C &&& (~SE), posedge K, 0, notifier);
 $hold(posedge C &&& (SE), negedge SD, 0, notifier);
 $hold(posedge C &&& (SE), posedge SD, 0, notifier);
 $hold(posedge C, negedge SE, 0, notifier);
 $hold(posedge C, posedge SE, 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine



//
`celldefine
`timescale 1ns / 1ps

// Description : SCAN_JKFF with rising clock low preset q and qb outputs

module JKSP1_3B (C,J,K,Q,QN,SD,SE,SN);

output Q,QN;
input C,J,K,SD,SE,SN;

`ifdef functional
U_jksp_Q (buf_Q,C,SE,SN,J,K,SD,1'b0);
`else
reg notifier;
U_jksp_Q (buf_Q,C,SE,SN,J,K,SD,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (SN => Q) = (1,1);
 (SN => QN) = (1,1);
 $setup(posedge J, posedge C &&& (~SE), 0, notifier);
 $setup(negedge J, posedge C &&& (~SE), 0, notifier);
 $setup(posedge K, posedge C &&& (~SE), 0, notifier);
 $setup(negedge K, posedge C &&& (~SE), 0, notifier);
 $setup(posedge SD, posedge C &&& (SE), 0, notifier);
 $setup(negedge SD, posedge C &&& (SE), 0, notifier);
 $setup(posedge SE, posedge C, 0, notifier);
 $setup(negedge SE, posedge C, 0, notifier);
 $recovery(posedge SN, posedge C, 0, notifier);
 $hold(posedge C &&& (~SE), negedge J, 0, notifier);
 $hold(posedge C &&& (~SE), posedge J, 0, notifier);  
 $hold(posedge C &&& (~SE), negedge K, 0, notifier);
 $hold(posedge C &&& (~SE), posedge K, 0, notifier);
 $hold(posedge C &&& (SE), negedge SD, 0, notifier);
 $hold(posedge C &&& (SE), posedge SD, 0, notifier);
 $hold(posedge C, negedge SE, 0, notifier);
 $hold(posedge C, posedge SE, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine


//
`celldefine
`timescale 1ns / 1ps

// Description : SCAN_JKFF with rising clock low preset q and qb outputs

module JKSP3_3B (C,J,K,Q,QN,SD,SE,SN);

output Q,QN;
input C,J,K,SD,SE,SN;

`ifdef functional
U_jksp_Q (buf_Q,C,SE,SN,J,K,SD,1'b0);
`else
reg notifier;
U_jksp_Q (buf_Q,C,SE,SN,J,K,SD,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (SN => Q) = (1,1);
 (SN => QN) = (1,1);
 $setup(posedge J, posedge C &&& (~SE), 0, notifier);
 $setup(negedge J, posedge C &&& (~SE), 0, notifier);
 $setup(posedge K, posedge C &&& (~SE), 0, notifier);
 $setup(negedge K, posedge C &&& (~SE), 0, notifier);
 $setup(posedge SD, posedge C &&& (SE), 0, notifier);
 $setup(negedge SD, posedge C &&& (SE), 0, notifier);
 $setup(posedge SE, posedge C, 0, notifier);
 $setup(negedge SE, posedge C, 0, notifier);
 $recovery(posedge SN, posedge C, 0, notifier);
 $hold(posedge C &&& (~SE), negedge J, 0, notifier);
 $hold(posedge C &&& (~SE), posedge J, 0, notifier);  
 $hold(posedge C &&& (~SE), negedge K, 0, notifier);
 $hold(posedge C &&& (~SE), posedge K, 0, notifier);
 $hold(posedge C &&& (SE), negedge SD, 0, notifier);
 $hold(posedge C &&& (SE), posedge SD, 0, notifier);
 $hold(posedge C, negedge SE, 0, notifier);
 $hold(posedge C, posedge SE, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine


//
`celldefine
`timescale 1ns / 1ps

// Description : 3 wide 2-2-2 AND-OR

module MAJ31_3B (A,B,C,Q);

output Q;
input A,B,C;

and (g_1_out,B,A);
and (g_2_out,C,B);
and (g_3_out,C,A);
or (Q,g_1_out,g_2_out,g_3_out);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 3 wide 2-2-2 AND-OR

module MAJ32_3B (A,B,C,Q);

output Q;
input A,B,C;

and (g_1_out,B,A);
and (g_2_out,C,B);
and (g_3_out,C,A);
or (Q,g_1_out,g_2_out,g_3_out);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 2 to 1 MULTIPLEXER

module MUX21_3B (A,B,Q,S);

output Q;
input A,B,S;

U_MUX_2_1 (Q,A,B,S);

`ifdef functional
`else
specify
 (S => Q) = (1,1);
 (A => Q) = (1,1);
 (B => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 2 to 1 MULTIPLEXER

module MUX22_3B (A,B,Q,S);

output Q;
input A,B,S;

U_MUX_2_1 (Q,A,B,S);

`ifdef functional
`else
specify
 (S => Q) = (1,1);
 (A => Q) = (1,1);
 (B => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 2 to 1 MULTIPLEXER

module MUX24_3B (A,B,Q,S);

output Q;
input A,B,S;

U_MUX_2_1 (Q,A,B,S);

`ifdef functional
`else
specify
 (S => Q) = (1,1);
 (A => Q) = (1,1);
 (B => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 2 to 1 MULTIPLEXER

module MUX26_3B (A,B,Q,S);

output Q;
input A,B,S;

U_MUX_2_1 (Q,A,B,S);

`ifdef functional
`else
specify
 (S => Q) = (1,1);
 (A => Q) = (1,1);
 (B => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 3 to 1 MULTIPLEXER

module MUX31_3B (A,B,C,Q,S0,S1);

output Q;
input A,B,C,S0,S1;

U_MUX_3_2 (Q,A,B,C,S0,S1);

`ifdef functional
`else
specify
 (S0 => Q) = (1,1);
 (S1 => Q) = (1,1);
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 3 to 1 MULTIPLEXER

module MUX32_3B (A,B,C,Q,S0,S1);

output Q;
input A,B,C,S0,S1;

U_MUX_3_2 (Q,A,B,C,S0,S1);

`ifdef functional
`else
specify
 (S0 => Q) = (1,1);
 (S1 => Q) = (1,1);
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 3 to 1 MULTIPLEXER

module MUX33_3B (A,B,C,Q,S0,S1);

output Q;
input A,B,C,S0,S1;

U_MUX_3_2 (Q,A,B,C,S0,S1);

`ifdef functional
`else
specify
 (S0 => Q) = (1,1);
 (S1 => Q) = (1,1);
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 3 to 1 MULTIPLEXER

module MUX34_3B (A,B,C,Q,S0,S1);

output Q;
input A,B,C,S0,S1;

U_MUX_3_2 (Q,A,B,C,S0,S1);

`ifdef functional
`else
specify
 (S0 => Q) = (1,1);
 (S1 => Q) = (1,1);
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 4 to 1 MULTIPLEXER

module MUX41_3B (A,B,C,D,Q,S0,S1);

output Q;
input A,B,C,D,S0,S1;

U_MUX_4_2 (Q,A,B,C,D,S0,S1);

`ifdef functional
`else
specify
 (S0 => Q) = (1,1);
 (S1 => Q) = (1,1);
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
 (D => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 4 to 1 MULTIPLEXER

module MUX42_3B (A,B,C,D,Q,S0,S1);

output Q;
input A,B,C,D,S0,S1;

U_MUX_4_2 (Q,A,B,C,D,S0,S1);

`ifdef functional
`else
specify
 (S0 => Q) = (1,1);
 (S1 => Q) = (1,1);
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
 (D => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 4 to 1 MULTIPLEXER

module MUX43_3B (A,B,C,D,Q,S0,S1);

output Q;
input A,B,C,D,S0,S1;

U_MUX_4_2 (Q,A,B,C,D,S0,S1);

`ifdef functional
`else
specify
 (S0 => Q) = (1,1);
 (S1 => Q) = (1,1);
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
 (D => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 2 input NAND

module NAND20_3B (A,B,Q);

output Q;
input A,B;

nand (Q,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 2 input NAND

module NAND21_3B (A,B,Q);

output Q;
input A,B;

nand (Q,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 2 input NAND

module NAND22_3B (A,B,Q);

output Q;
input A,B;

nand (Q,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 2 input NAND

module NAND23_3B (A,B,Q);

output Q;
input A,B;

nand (Q,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 2 input NAND

module NAND24_3B (A,B,Q);

output Q;
input A,B;

nand (Q,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 2 input NAND

module NAND26_3B (A,B,Q);

output Q;
input A,B;

nand (Q,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 2 input NAND

module NAND28_3B (A,B,Q);

output Q;
input A,B;

nand (Q,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 3 input NAND

module NAND30_3B (A,B,C,Q);

output Q;
input A,B,C;

nand (Q,C,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 3 input NAND

module NAND31_3B (A,B,C,Q);

output Q;
input A,B,C;

nand (Q,C,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 3 input NAND

module NAND32_3B (A,B,C,Q);

output Q;
input A,B,C;

nand (Q,C,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 3 input NAND

module NAND33_3B (A,B,C,Q);

output Q;
input A,B,C;

nand (Q,C,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 3 input NAND

module NAND34_3B (A,B,C,Q);

output Q;
input A,B,C;

nand (Q,C,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 4 input NAND

module NAND40_3B (A,B,C,D,Q);

output Q;
input A,B,C,D;

nand (Q,D,C,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
 (D => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 4 input NAND

module NAND41_3B (A,B,C,D,Q);

output Q;
input A,B,C,D;

nand (Q,D,C,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
 (D => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 4 input NAND

module NAND42_3B (A,B,C,D,Q);

output Q;
input A,B,C,D;

nand (Q,D,C,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
 (D => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 4 input NAND

module NAND43_3B (A,B,C,D,Q);

output Q;
input A,B,C,D;

nand (Q,D,C,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
 (D => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 2 input NOR

module NOR20_3B (A,B,Q);

output Q;
input A,B;

nor (Q,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 2 input NOR

module NOR21_3B (A,B,Q);

output Q;
input A,B;

nor (Q,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 2 input NOR

module NOR22_3B (A,B,Q);

output Q;
input A,B;

nor (Q,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 2 input NOR

module NOR23_3B (A,B,Q);

output Q;
input A,B;

nor (Q,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 2 input NOR

module NOR24_3B (A,B,Q);

output Q;
input A,B;

nor (Q,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 3 input NOR

module NOR30_3B (A,B,C,Q);

output Q;
input A,B,C;

nor (Q,C,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 3 input NOR

module NOR31_3B (A,B,C,Q);

output Q;
input A,B,C;

nor (Q,C,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 3 input NOR

module NOR32_3B (A,B,C,Q);

output Q;
input A,B,C;

nor (Q,C,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 3 input NOR

module NOR33_3B (A,B,C,Q);

output Q;
input A,B,C;

nor (Q,C,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 4 input NOR

module NOR40_3B (A,B,C,D,Q);

output Q;
input A,B,C,D;

nor (Q,D,C,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
 (D => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 4 input NOR

module NOR41_3B (A,B,C,D,Q);

output Q;
input A,B,C,D;

nor (Q,D,C,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
 (D => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 4 input NOR

module NOR42_3B (A,B,C,D,Q);

output Q;
input A,B,C,D;

nor (Q,D,C,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
 (D => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 2 wide 1-2 OR-AND-INVERT

module OAI210_3B (A,B,C,Q);

output Q;
input A,B,C;

or (g_2_out,A,B);
nand (Q,C,g_2_out);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 2 wide 1-2 OR-AND-INVERT

module OAI211_3B (A,B,C,Q);

output Q;
input A,B,C;

or (g_2_out,A,B);
nand (Q,C,g_2_out);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 3 wide 1-1-2 OR-AND-INVERT

module OAI2110_3B (A,B,C,D,Q);

output Q;
input A,B,C,D;

or (g_3_out,B,A);
nand (Q,D,C,g_3_out);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
 (D => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 3 wide 1-1-2 OR-AND-INVERT

module OAI2111_3B (A,B,C,D,Q);

output Q;
input A,B,C,D;

or (g_3_out,B,A);
nand (Q,D,C,g_3_out);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
 (D => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 3 wide 1-1-2 OR-AND-INVERT

module OAI2112_3B (A,B,C,D,Q);

output Q;
input A,B,C,D;

or (g_3_out,B,A);
nand (Q,D,C,g_3_out);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
 (D => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 2 wide 1-2 OR-AND-INVERT

module OAI212_3B (A,B,C,Q);

output Q;
input A,B,C;

or (g_2_out,A,B);
nand (Q,C,g_2_out);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 2 wide 2-2 OR-AND-INVERT

module OAI220_3B (A,B,C,D,Q);

output Q;
input A,B,C,D;

or (g_1_out,D,C);
or (g_2_out,B,A);
nand (Q,g_1_out,g_2_out);

`ifdef functional
`else
specify
 (C => Q) = (1,1);
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (D => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 2 wide 2-2 OR-AND-INVERT

module OAI221_3B (A,B,C,D,Q);

output Q;
input A,B,C,D;

or (g_1_out,D,C);
or (g_2_out,B,A);
nand (Q,g_1_out,g_2_out);

`ifdef functional
`else
specify
 (C => Q) = (1,1);
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (D => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 2 wide 2-2 OR-AND-INVERT

module OAI222_3B (A,B,C,D,Q);

output Q;
input A,B,C,D;

or (g_1_out,D,C);
or (g_2_out,B,A);
nand (Q,g_1_out,g_2_out);

`ifdef functional
`else
specify
 (C => Q) = (1,1);
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (D => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 2 wide 1-3 OR-AND-INVERT

module OAI310_3B (A,B,C,D,Q);

output Q;
input A,B,C,D;

or (g_2_out,B,A,C);
nand (Q,D,g_2_out);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
 (D => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 2 wide 1-3 OR-AND-INVERT

module OAI311_3B (A,B,C,D,Q);

output Q;
input A,B,C,D;

or (g_2_out,B,A,C);
nand (Q,D,g_2_out);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
 (D => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 2 wide 1-3 OR-AND-INVERT

module OAI312_3B (A,B,C,D,Q);

output Q;
input A,B,C,D;

or (g_2_out,B,A,C);
nand (Q,D,g_2_out);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
 (D => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : TFF with rising edge clock,low clear,q and qb outputs

module TFC1_3B (C,Q,QN,RN);

output Q,QN;
input C,RN;

`ifdef functional
U_FT_P_RB_NO (buf_Q,C,RN,1'b1);
`else
reg notifier;
U_FT_P_RB_NO (buf_Q,C,RN,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 $recovery(posedge RN, posedge C, 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : TFF with rising edge clock,low clear,q and qb outputs

module TFC3_3B (C,Q,QN,RN);

output Q,QN;
input C,RN;

`ifdef functional
U_FT_P_RB_NO (buf_Q,C,RN,1'b1);
`else
reg notifier;
U_FT_P_RB_NO (buf_Q,C,RN,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 $recovery(posedge RN, posedge C, 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : TFF with rising edge clock,low preset,low clear,q and qb outputs

module TFCP1_3B (C,Q,QN,RN,SN);

output Q,QN;
input C,RN,SN;

`ifdef functional
U_tfcp_Q (buf_Q,C,RN,SN,1'b0);
`else
reg notifier;
U_tfcp_Q (buf_Q,C,RN,SN,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 (SN => QN) = (1,1);
 (SN => Q) = (1,1);
 $recovery(posedge RN, posedge C, 0, notifier);
 $recovery(posedge SN, posedge C, 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : TFF with rising edge clock,low preset,low clear,q and qb outputs

module TFCP3_3B (C,Q,QN,RN,SN);

output Q,QN;
input C,RN,SN;

`ifdef functional
U_tfcp_Q (buf_Q,C,RN,SN,1'b0);
`else
reg notifier;
U_tfcp_Q (buf_Q,C,RN,SN,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 (SN => QN) = (1,1);
 (SN => Q) = (1,1);
 $recovery(posedge RN, posedge C, 0, notifier);
 $recovery(posedge SN, posedge C, 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : TFF with rising edge clock,low clear,high enable,q and qb outputs

module TFEC1_3B (C,Q,QN,RN,T);

output Q,QN;
input C,RN,T;

`ifdef functional
U_FT_P_TE_RB_NO (buf_Q,T,C,RN,1'b1);
`else
reg notifier;
U_FT_P_TE_RB_NO (buf_Q,T,C,RN,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 $recovery(posedge RN, posedge C, 0, notifier);
 $setup(posedge T, posedge C, 0, notifier);
 $setup(negedge T, posedge C, 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $hold(posedge C, posedge T, 0, notifier);
 $hold(posedge C, negedge T, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : TFF with rising edge clock,low clear,high enable,q and qb outputs

module TFEC3_3B (C,Q,QN,RN,T);

output Q,QN;
input C,RN,T;

`ifdef functional
U_FT_P_TE_RB_NO (buf_Q,T,C,RN,1'b1);
`else
reg notifier;
U_FT_P_TE_RB_NO (buf_Q,T,C,RN,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 $recovery(posedge RN, posedge C, 0, notifier);
 $setup(posedge T, posedge C, 0, notifier);
 $setup(negedge T, posedge C, 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $hold(posedge C, posedge T, 0, notifier);
 $hold(posedge C, negedge T, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : TFF with rising edge clock,low preset,low clear,high enable,q and qb outputs

module TFECP1_3B (C,Q,QN,RN,SN,T);

output Q,QN;
input C,RN,SN,T;

`ifdef functional
U_tfecp_Q (buf_Q,C,RN,SN,T,1'b0);
`else
reg notifier;
U_tfecp_Q (buf_Q,C,RN,SN,T,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 (SN => QN) = (1,1);
 (SN => Q) = (1,1);
 $recovery(posedge RN, posedge C, 0, notifier);
 $recovery(posedge SN, posedge C, 0, notifier);
 $setup(posedge T, posedge C, 0, notifier);
 $setup(negedge T, posedge C, 0, notifier);
 $hold(posedge C, posedge T, 0, notifier);
 $hold(posedge C, negedge T, 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

module TFECP3_3B (C,Q,QN,RN,SN,T);

output Q,QN;
input C,RN,SN,T;

`ifdef functional
U_tfecp_Q (buf_Q,C,RN,SN,T,1'b0);
`else
reg notifier;
U_tfecp_Q (buf_Q,C,RN,SN,T,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 (SN => QN) = (1,1);
 (SN => Q) = (1,1);
 $recovery(posedge RN, posedge C, 0, notifier);
 $recovery(posedge SN, posedge C, 0, notifier);
 $setup(posedge T, posedge C, 0, notifier);
 $setup(negedge T, posedge C, 0, notifier);
 $hold(posedge C, posedge T, 0, notifier);
 $hold(posedge C, negedge T, 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine




//
`celldefine
`timescale 1ns / 1ps

// Description : TFF with rising edge clock,low preset,high enable,q and qb outputs

module TFEP1_3B (C,Q,QN,SN,T);

output Q,QN;
input C,SN,T;

`ifdef functional
U_tfep_Q (buf_Q,SN,C,T,1'b0);
`else
reg notifier;
U_tfep_Q (buf_Q,SN,C,T,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (SN => Q) = (1,1);
 (SN => QN) = (1,1);
 $recovery(posedge SN, posedge C, 0, notifier);
 $setup(posedge T, posedge C, 0, notifier);
 $setup(negedge T, posedge C, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $hold(posedge C, posedge T, 0, notifier);
 $hold(posedge C, negedge T, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine



//
`celldefine
`timescale 1ns / 1ps

// Description : TFF with rising edge clock,low preset,high enable,q and qb outputs

module TFEP3_3B (C,Q,QN,SN,T);

output Q,QN;
input C,SN,T;

`ifdef functional
U_tfep_Q (buf_Q,SN,C,T,1'b0);
`else
reg notifier;
U_tfep_Q (buf_Q,SN,C,T,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (SN => Q) = (1,1);
 (SN => QN) = (1,1);
 $recovery(posedge SN, posedge C, 0, notifier);
 $setup(posedge T, posedge C, 0, notifier);
 $setup(negedge T, posedge C, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $hold(posedge C, posedge T, 0, notifier);
 $hold(posedge C, negedge T, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine


//
`celldefine
`timescale 1ns / 1ps

// Description : TFF with rising edge clock,low preset,q and qb outputs

module TFP1_3B (C,Q,QN,SN);

output Q,QN;
input C,SN;

`ifdef functional
U_FT_P_SB_NO (buf_Q,C,SN,1'b1);
`else
reg notifier;
U_FT_P_SB_NO (buf_Q,C,SN,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (SN => Q) = (1,1);
 (SN => QN) = (1,1);
 $recovery(posedge SN, posedge C, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : TFF with rising edge clock,low preset,q and qb outputs

module TFP3_3B (C,Q,QN,SN);

output Q,QN;
input C,SN;

`ifdef functional
U_FT_P_SB_NO (buf_Q,C,SN,1'b1);
`else
reg notifier;
U_FT_P_SB_NO (buf_Q,C,SN,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (SN => Q) = (1,1);
 (SN => QN) = (1,1);
 $recovery(posedge SN, posedge C, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : SCAN_TFF with rising clock low clear q and qb outputs

module TFSC1_3B (C,Q,QN,RN,SD,SE);

output Q,QN;
input C,RN,SD,SE;

`ifdef functional
U_tfsc_Q (buf_Q,C,RN,SE,SD,1'b0);
`else
reg notifier;
U_tfsc_Q (buf_Q,C,RN,SE,SD,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 $recovery(posedge RN, posedge C, 0, notifier);
 $setup(posedge SD, posedge C &&& (SE), 0, notifier);
 $setup(negedge SD, posedge C &&& (SE), 0, notifier);
 $setup(posedge SE, posedge C, 0, notifier);
 $setup(negedge SE, posedge C, 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $hold(posedge C &&& (SE), posedge SD, 0, notifier);
 $hold(posedge C &&& (SE), negedge SD, 0, notifier);
 $hold(posedge C, negedge SE, 0, notifier);
 $hold(posedge C, posedge SE, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine



//
`celldefine
`timescale 1ns / 1ps

// Description : SCAN_TFF with rising clock low clear q and qb outputs

module TFSC3_3B (C,Q,QN,RN,SD,SE);

output Q,QN;
input C,RN,SD,SE;

`ifdef functional
U_tfsc_Q (buf_Q,C,RN,SE,SD,1'b0);
`else
reg notifier;
U_tfsc_Q (buf_Q,C,RN,SE,SD,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 $recovery(posedge RN, posedge C, 0, notifier);
 $setup(posedge SD, posedge C &&& (SE), 0, notifier);
 $setup(negedge SD, posedge C &&& (SE), 0, notifier);
 $setup(posedge SE, posedge C, 0, notifier);
 $setup(negedge SE, posedge C, 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $hold(posedge C &&& (SE), posedge SD, 0, notifier);
 $hold(posedge C &&& (SE), negedge SD, 0, notifier);
 $hold(posedge C, negedge SE, 0, notifier);
 $hold(posedge C, posedge SE, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine


//
`celldefine
`timescale 1ns / 1ps

// Description : UNKNOWN

module TFSCP1_3B (C,Q,QN,RN,SD,SE,SN);

output Q,QN;
input C,RN,SD,SE,SN;

`ifdef functional
U_tfscp_Q (buf_Q,C,RN,SN,SE,SD,1'b0);
`else
reg notifier;
U_tfscp_Q (buf_Q,C,RN,SN,SE,SD,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);


`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 (SN => QN) = (1,1);
 (SN => Q) = (1,1);
 $recovery(posedge RN, posedge C, 0, notifier);
 $setup(posedge SD, posedge C &&& (SE), 0, notifier);
 $setup(negedge SD, posedge C &&& (SE), 0, notifier);
 $setup(posedge SE, posedge C, 0, notifier);
 $setup(negedge SE, posedge C, 0, notifier);
 $recovery(posedge SN, posedge C, 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $hold(posedge C &&& (SE), posedge SD, 0, notifier);
 $hold(posedge C &&& (SE), negedge SD, 0, notifier);
 $hold(posedge C, negedge SE, 0, notifier);
 $hold(posedge C, posedge SE, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine


//
`celldefine
`timescale 1ns / 1ps

// Description : UNKNOWN

module TFSCP3_3B (C,Q,QN,RN,SD,SE,SN);

output Q,QN;
input C,RN,SD,SE,SN;

`ifdef functional
U_tfscp_Q (buf_Q,C,RN,SN,SE,SD,1'b0);
`else
reg notifier;
U_tfscp_Q (buf_Q,C,RN,SN,SE,SD,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);


`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 (SN => QN) = (1,1);
 (SN => Q) = (1,1);
 $recovery(posedge RN, posedge C, 0, notifier);
 $setup(posedge SD, posedge C &&& (SE), 0, notifier);
 $setup(negedge SD, posedge C &&& (SE), 0, notifier);
 $setup(posedge SE, posedge C, 0, notifier);
 $setup(negedge SE, posedge C, 0, notifier);
 $recovery(posedge SN, posedge C, 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $hold(posedge C &&& (SE), posedge SD, 0, notifier);
 $hold(posedge C &&& (SE), negedge SD, 0, notifier);
 $hold(posedge C, negedge SE, 0, notifier);
 $hold(posedge C, posedge SE, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine



//
`celldefine
`timescale 1ns / 1ps

// Description : UNKNOWN

module TFSEC1_3B (C,Q,QN,RN,SD,SE,T);

output Q,QN;
input C,RN,SD,SE,T;

`ifdef functional
U_tfsec_Q (buf_Q,C,RN,T,SE,SD,1'b0);
`else
reg notifier;
U_tfsec_Q (buf_Q,C,RN,T,SE,SD,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 $recovery(posedge RN, posedge C, 0, notifier);
 $setup(posedge SD, posedge C &&& (SE), 0, notifier);
 $setup(negedge SD, posedge C &&& (SE), 0, notifier);
 $setup(posedge SE, posedge C, 0, notifier);
 $setup(negedge SE, posedge C, 0, notifier);
 $setup(posedge T, posedge C &&& (~SE), 0, notifier);
 $setup(negedge T, posedge C &&& (~SE), 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $hold(posedge C &&& (SE), posedge SD, 0, notifier);
 $hold(posedge C &&& (SE), negedge SD, 0, notifier);
 $hold(posedge C, negedge SE, 0, notifier);
 $hold(posedge C, posedge SE, 0, notifier);
 $hold(posedge C &&& (~SE), posedge T, 0, notifier);
 $hold(posedge C &&& (~SE), negedge T, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine


//
`celldefine
`timescale 1ns / 1ps

// Description : UNKNOWN

module TFSEC3_3B (C,Q,QN,RN,SD,SE,T);

output Q,QN;
input C,RN,SD,SE,T;

`ifdef functional
U_tfsec_Q (buf_Q,C,RN,T,SE,SD,1'b0);
`else
reg notifier;
U_tfsec_Q (buf_Q,C,RN,T,SE,SD,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 $recovery(posedge RN, posedge C, 0, notifier);
 $setup(posedge SD, posedge C &&& (SE), 0, notifier);
 $setup(negedge SD, posedge C &&& (SE), 0, notifier);
 $setup(posedge SE, posedge C, 0, notifier);
 $setup(negedge SE, posedge C, 0, notifier);
 $setup(posedge T, posedge C &&& (~SE), 0, notifier);
 $setup(negedge T, posedge C &&& (~SE), 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $hold(posedge C &&& (SE), posedge SD, 0, notifier);
 $hold(posedge C &&& (SE), negedge SD, 0, notifier);
 $hold(posedge C, negedge SE, 0, notifier);
 $hold(posedge C, posedge SE, 0, notifier);
 $hold(posedge C &&& (~SE), posedge T, 0, notifier);
 $hold(posedge C &&& (~SE), negedge T, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine


//
`celldefine
`timescale 1ns / 1ps

// Description : UNKNOWN

module TFSECP1_3B (C,Q,QN,RN,SD,SE,SN,T);

output Q,QN;
input C,RN,SD,SE,SN,T;

`ifdef functional
U_tfsecp_Q (buf_Q,C,RN,SN,T,SE,SD,1'b0);
`else
reg notifier;
U_tfsecp_Q (buf_Q,C,RN,SN,T,SE,SD,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 (SN => QN) = (1,1);
 (SN => Q) = (1,1);
 $recovery(posedge RN, posedge C, 0, notifier);
 $setup(posedge SD, posedge C &&& (SE), 0, notifier);
 $setup(negedge SD, posedge C &&& (SE), 0, notifier);
 $setup(posedge SE, posedge C, 0, notifier);
 $setup(negedge SE, posedge C, 0, notifier);
 $recovery(posedge SN, posedge C, 0, notifier);
 $setup(posedge T, posedge C &&& (~SE), 0, notifier);
 $setup(negedge T, posedge C &&& (~SE), 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $hold(posedge C &&& (SE), posedge SD, 0, notifier);
 $hold(posedge C &&& (SE), negedge SD, 0, notifier);
 $hold(posedge C, negedge SE, 0, notifier);
 $hold(posedge C, posedge SE, 0, notifier);
 $hold(posedge C &&& (~SE), posedge T, 0, notifier);
 $hold(posedge C &&& (~SE), negedge T, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine


//
`celldefine
`timescale 1ns / 1ps

// Description : UNKNOWN

module TFSECP3_3B (C,Q,QN,RN,SD,SE,SN,T);

output Q,QN;
input C,RN,SD,SE,SN,T;

`ifdef functional
U_tfsecp_Q (buf_Q,C,RN,SN,T,SE,SD,1'b0);
`else
reg notifier;
U_tfsecp_Q (buf_Q,C,RN,SN,T,SE,SD,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (RN => Q) = (1,1);
 (RN => QN) = (1,1);
 (SN => QN) = (1,1);
 (SN => Q) = (1,1);
 $recovery(posedge RN, posedge C, 0, notifier);
 $setup(posedge SD, posedge C &&& (SE), 0, notifier);
 $setup(negedge SD, posedge C &&& (SE), 0, notifier);
 $setup(posedge SE, posedge C, 0, notifier);
 $setup(negedge SE, posedge C, 0, notifier);
 $recovery(posedge SN, posedge C, 0, notifier);
 $setup(posedge T, posedge C &&& (~SE), 0, notifier);
 $setup(negedge T, posedge C &&& (~SE), 0, notifier);
 $hold(posedge C, posedge RN, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $hold(posedge C &&& (SE), posedge SD, 0, notifier);
 $hold(posedge C &&& (SE), negedge SD, 0, notifier);
 $hold(posedge C, negedge SE, 0, notifier);
 $hold(posedge C, posedge SE, 0, notifier);
 $hold(posedge C &&& (~SE), posedge T, 0, notifier);
 $hold(posedge C &&& (~SE), negedge T, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge RN, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : UNKNOWN

module TFSEP1_3B (C,Q,QN,SD,SE,SN,T);

output Q,QN;
input C,SD,SE,SN,T;

`ifdef functional
U_tfsep_Q (buf_Q,C,SN,T,SE,SD,1'b0);
`else
reg notifier;
U_tfsep_Q (buf_Q,C,SN,T,SE,SD,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);


`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (SN => Q) = (1,1);
 (SN => QN) = (1,1);
 $setup(posedge SD, posedge C &&& (SE), 0, notifier);
 $setup(negedge SD, posedge C &&& (SE), 0, notifier);
 $setup(posedge SE, posedge C, 0, notifier);
 $setup(negedge SE, posedge C, 0, notifier);
 $recovery(posedge SN, posedge C, 0, notifier);
 $setup(posedge T, posedge C &&& (~SE), 0, notifier);
 $setup(negedge T, posedge C &&& (~SE), 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $hold(posedge C &&& (SE), posedge SD, 0, notifier);
 $hold(posedge C &&& (SE), negedge SD, 0, notifier);
 $hold(posedge C, negedge SE, 0, notifier);
 $hold(posedge C, posedge SE, 0, notifier);
 $hold(posedge C &&& (~SE), posedge T, 0, notifier);
 $hold(posedge C &&& (~SE), negedge T, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : UNKNOWN

module TFSEP3_3B (C,Q,QN,SD,SE,SN,T);

output Q,QN;
input C,SD,SE,SN,T;

`ifdef functional
U_tfsep_Q (buf_Q,C,SN,T,SE,SD,1'b0);
`else
reg notifier;
U_tfsep_Q (buf_Q,C,SN,T,SE,SD,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (SN => Q) = (1,1);
 (SN => QN) = (1,1);
 $setup(posedge SD, posedge C &&& (SE), 0, notifier);
 $setup(negedge SD, posedge C &&& (SE), 0, notifier);
 $setup(posedge SE, posedge C, 0, notifier);
 $setup(negedge SE, posedge C, 0, notifier);
 $recovery(posedge SN, posedge C, 0, notifier);
 $setup(posedge T, posedge C &&& (~SE), 0, notifier);
 $setup(negedge T, posedge C &&& (~SE), 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $hold(posedge C &&& (SE), posedge SD, 0, notifier);
 $hold(posedge C &&& (SE), negedge SD, 0, notifier);
 $hold(posedge C, negedge SE, 0, notifier);
 $hold(posedge C, posedge SE, 0, notifier);
 $hold(posedge C &&& (~SE), posedge T, 0, notifier);
 $hold(posedge C &&& (~SE), negedge T, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : SCAN_TFF with rising clock low clear q and qb outputs

module TFSP1_3B (C,Q,QN,SD,SE,SN);

output Q,QN;
input C,SD,SE,SN;

`ifdef functional
U_tfsp_Q (buf_Q,C,SE,SN,SD,1'b0);
`else
reg notifier;
U_tfsp_Q (buf_Q,C,SE,SN,SD,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (SN => Q) = (1,1);
 (SN => QN) = (1,1);
 $setup(posedge SD, posedge C &&& (SE), 0, notifier);
 $setup(negedge SD, posedge C &&& (SE), 0, notifier);
 $setup(posedge SE, posedge C, 0, notifier);
 $setup(negedge SE, posedge C, 0, notifier);
 $recovery(posedge SN, posedge C, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $hold(posedge C &&& (SE), posedge SD, 0, notifier);
 $hold(posedge C &&& (SE), negedge SD, 0, notifier);
 $hold(posedge C, negedge SE, 0, notifier);
 $hold(posedge C, posedge SE, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine


//
`celldefine
`timescale 1ns / 1ps

// Description : SCAN_TFF with rising clock low clear q and qb outputs

module TFSP3_3B (C,Q,QN,SD,SE,SN);

output Q,QN;
input C,SD,SE,SN;

`ifdef functional
U_tfsp_Q (buf_Q,C,SE,SN,SD,1'b0);
`else
reg notifier;
U_tfsp_Q (buf_Q,C,SE,SN,SD,notifier);
`endif

buf (Q,buf_Q);
not (QN,buf_Q);

`ifdef functional
`else
 specify
 (C => Q) = (1,1);
 (C => QN) = (1,1);
 (SN => Q) = (1,1);
 (SN => QN) = (1,1);
 $setup(posedge SD, posedge C &&& (SE), 0, notifier);
 $setup(negedge SD, posedge C &&& (SE), 0, notifier);
 $setup(posedge SE, posedge C, 0, notifier);
 $setup(negedge SE, posedge C, 0, notifier);
 $recovery(posedge SN, posedge C, 0, notifier);
 $hold(posedge C, posedge SN, 0, notifier);
 $hold(posedge C &&& (SE), posedge SD, 0, notifier);
 $hold(posedge C &&& (SE), negedge SD, 0, notifier);
 $hold(posedge C, negedge SE, 0, notifier);
 $hold(posedge C, posedge SE, 0, notifier);
 $width(posedge C, 1, 0, notifier);
 $width(negedge C, 1, 0, notifier);
 $width(negedge SN, 1, 0, notifier);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 2 input XNOR

module XNR20_3B (A,B,Q);

output Q;
input A,B;

xnor (Q,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 2 input XNOR

module XNR21_3B (A,B,Q);

output Q;
input A,B;

xnor (Q,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 2 input XNOR

module XNR22_3B (A,B,Q);

output Q;
input A,B;

xnor (Q,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 3 input XNOR

module XNR30_3B (A,B,C,Q);

output Q;
input A,B,C;

xnor (Q,C,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 3 input XNOR

module XNR31_3B (A,B,C,Q);

output Q;
input A,B,C;

xnor (Q,C,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 4 input XNOR

module XNR40_3B (A,B,C,D,Q);

output Q;
input A,B,C,D;

xnor (Q,D,C,B,A);

`ifdef functional
`else
specify
 (B => Q) = (1,1);
 (A => Q) = (1,1);
 (C => Q) = (1,1);
 (D => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 4 input XNOR

module XNR41_3B (A,B,C,D,Q);

output Q;
input A,B,C,D;

xnor (Q,D,C,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
 (C => Q) = (1,1);
 (D => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 2 input XOR

module XOR20_3B (A,B,Q);

output Q;
input A,B;

xor (Q,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 2 input XOR

module XOR21_3B (A,B,Q);

output Q;
input A,B;

xor (Q,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 2 input XOR

module XOR22_3B (A,B,Q);

output Q;
input A,B;

xor (Q,B,A);

`ifdef functional
`else
specify
 (A => Q) = (1,1);
 (B => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 3 input XOR

module XOR30_3B (A,B,C,Q);

output Q;
input A,B,C;

xor (Q,C,B,A);

`ifdef functional
`else
specify
 (B => Q) = (1,1);
 (A => Q) = (1,1);
 (C => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 3 input XOR

module XOR31_3B (A,B,C,Q);

output Q;
input A,B,C;

xor (Q,C,B,A);

`ifdef functional
`else
specify
 (B => Q) = (1,1);
 (A => Q) = (1,1);
 (C => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 4 input XOR

module XOR40_3B (A,B,C,D,Q);

output Q;
input A,B,C,D;

xor (Q,D,C,B,A);

`ifdef functional
`else
specify
 (B => Q) = (1,1);
 (A => Q) = (1,1);
 (C => Q) = (1,1);
 (D => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine

//
`celldefine
`timescale 1ns / 1ps

// Description : 4 input XOR

module XOR41_3B (A,B,C,D,Q);

output Q;
input A,B,C,D;

xor (Q,D,C,B,A);

`ifdef functional
`else
specify
 (B => Q) = (1,1);
 (A => Q) = (1,1);
 (C => Q) = (1,1);
 (D => Q) = (1,1);
endspecify
`endif

endmodule
`endcelldefine


module BUSHD_3B (A);
 inout A;

 buf (A_buf, A);
 buf (pull1, pull0)(A, A_buf);
 
endmodule


module TIE0_3B (Q);
 output Q;

 buf (Q,0);
 
endmodule


module TIE1_3B (Q);
 output Q;

 buf (Q,1);
 
endmodule


