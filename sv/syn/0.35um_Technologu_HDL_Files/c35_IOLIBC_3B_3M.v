// Verilog simulation library for c35 IOLIBV5_4M 3.3V
// $Id: c35_IOLIBC_3B_4M.v,v 1.2 2004/04/30 09:43:46 bka 
// Owner: austriamicrosystems AG  HIT-Kit: Digital
`timescale 1ns/1ps

module BBC4C_3B (A, EN, PAD, Y);
  input A;
  input EN;
  inout PAD;
  output Y;

  buf (Y, PAD);
  bufif0 (PAD, A, EN);

`ifdef functional
`else
  specify
    (A => PAD) = (1,1);
    (EN => PAD) = (1,1);
    (PAD => Y) = (1,1);
  endspecify
`endif

endmodule
module BBC24C_3B (A, EN, PAD, Y);
  input A;
  input EN;
  inout PAD;
  output Y;

  buf (Y, PAD);
  bufif0 (PAD, A, EN);

`ifdef functional
`else
  specify
    (A => PAD) = (1,1);
    (EN => PAD) = (1,1);
    (PAD => Y) = (1,1);
  endspecify
`endif

endmodule
module BBCU8SC_3B (A, EN, PAD, Y);
  input A;
  input EN;
  inout PAD;
  output Y;

  buf (Y, PAD);
  bufif0 (PAD, A, EN);

`ifdef functional
`else
  specify
    (A => PAD) = (1,1);
    (EN => PAD) = (1,1);
    (PAD => Y) = (1,1);
  endspecify
`endif

endmodule
module BT1C_3B (A, EN, PAD);
  input A;
  input EN;
  output PAD;

  bufif0 (PAD, A, EN);

`ifdef functional
`else
  specify
    (A => PAD) = (1,1);
    (EN => PAD) = (1,1);
  endspecify
`endif

endmodule
module BU1C_3B (A, PAD);
  input A;
  output PAD;

  buf (PAD, A);

`ifdef functional
`else
  specify
    (A => PAD) = (1,1);
  endspecify
`endif

endmodule
module BU4C_3B (A, PAD);
  input A;
  output PAD;

  buf (PAD, A);

`ifdef functional
`else
  specify
    (A => PAD) = (1,1);
  endspecify
`endif

endmodule
module GND3ALLC_3B(A);
  inout A;
 
endmodule
module GND3IC_3B(A);
  inout A;
 
endmodule
module GND3OC_3B(A);
  inout A;
 
endmodule
module GND3RC_3B(A);
  inout A;
 
endmodule
module ICCK2C_3B (PAD, Y);
  input PAD;
  output Y;

  buf (Y, PAD);

`ifdef functional
`else
  specify
    (PAD => Y) = (1,1);
  endspecify
`endif

endmodule
module ICDC_3B (PAD, Y);
  input PAD;
  output Y;

  buf (Y, PAD);

`ifdef functional
`else
  specify
    (PAD => Y) = (1,1);
  endspecify
`endif

endmodule
module ICC_3B (PAD, Y);
  input PAD;
  output Y;

  buf (Y, PAD);

`ifdef functional
`else
  specify
    (PAD => Y) = (1,1);
  endspecify
`endif

endmodule
module ICUC_3B (PAD, Y);
  input PAD;
  output Y;

  buf (Y, PAD);

`ifdef functional
`else
  specify
    (PAD => Y) = (1,1);
  endspecify
`endif

endmodule
module VSUBC_3B(A);
  inout A;
 
endmodule
module VDD3ALLC_3B(A);
  inout A;
 
endmodule
module VDD3IC_3B(A);
  inout A;
 
endmodule
module VDD3OC_3B(A);
  inout A;
 
endmodule
module VDD3RC_3B(A);
  inout A;
 
endmodule
