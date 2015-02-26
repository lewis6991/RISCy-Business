// Verilog simulation library for c35 IOLIBV5_4M 3.3V
// $Id: csx_IOLIBV5_3M.v,v 1.2 2001/10/30 09:43:46 mbo Exp mbo $
// Owner: austriamicrosystems AG  HIT-Kit: Digital
`timescale 1ns/1ps
`celldefine 
module BBC1P_V5 (A, EN, PAD, Y);
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

module BBC4P_V5 (A, EN, PAD, Y);
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

module BBC4SMP_V5 (A, EN, PAD, Y);
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

module BBC8P_V5 (A, EN, PAD, Y);
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

module BBC8SMP_V5 (A, EN, PAD, Y);
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

module BBC8SP_V5 (A, EN, PAD, Y);
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

module BBC16P_V5 (A, EN, PAD, Y);
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

module BBC16SMP_V5 (A, EN, PAD, Y);
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

module BBC16SP_V5 (A, EN, PAD, Y);
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

module BBC24P_V5 (A, EN, PAD, Y);
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

module BBC24SMP_V5 (A, EN, PAD, Y);
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

module BBC24SP_V5 (A, EN, PAD, Y);
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

module BBCD1P_V5 (A, EN, PAD, Y);
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

module BBCD4P_V5 (A, EN, PAD, Y);
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

module BBCD4SMP_V5 (A, EN, PAD, Y);
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

module BBCD8P_V5 (A, EN, PAD, Y);
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

module BBCD8SMP_V5 (A, EN, PAD, Y);
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

module BBCD8SP_V5 (A, EN, PAD, Y);
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

module BBCD16P_V5 (A, EN, PAD, Y);
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

module BBCD16SMP_V5 (A, EN, PAD, Y);
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

module BBCD16SP_V5 (A, EN, PAD, Y);
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

module BBCD24P_V5 (A, EN, PAD, Y);
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

module BBCD24SMP_V5 (A, EN, PAD, Y);
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

module BBCD24SP_V5 (A, EN, PAD, Y);
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

module BBCU1P_V5 (A, EN, PAD, Y);
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

module BBCU4P_V5 (A, EN, PAD, Y);
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

module BBCU4SMP_V5 (A, EN, PAD, Y);
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

module BBCU8P_V5 (A, EN, PAD, Y);
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

module BBCU8SMP_V5 (A, EN, PAD, Y);
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

module BBCU8SP_V5 (A, EN, PAD, Y);
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

module BBCU16P_V5 (A, EN, PAD, Y);
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

module BBCU16SMP_V5 (A, EN, PAD, Y);
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

module BBCU16SP_V5 (A, EN, PAD, Y);
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

module BBCU24P_V5 (A, EN, PAD, Y);
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

module BBCU24SMP_V5 (A, EN, PAD, Y);
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

module BBCU24SP_V5 (A, EN, PAD, Y);
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

module BBS1P_V5 (A, EN, PAD, Y);
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

module BBS4P_V5 (A, EN, PAD, Y);
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

module BBS4SMP_V5 (A, EN, PAD, Y);
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

module BBS8P_V5 (A, EN, PAD, Y);
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

module BBS8SMP_V5 (A, EN, PAD, Y);
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

module BBS8SP_V5 (A, EN, PAD, Y);
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

module BBS16P_V5 (A, EN, PAD, Y);
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

module BBS16SMP_V5 (A, EN, PAD, Y);
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

module BBS16SP_V5 (A, EN, PAD, Y);
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

module BBS24P_V5 (A, EN, PAD, Y);
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

module BBS24SMP_V5 (A, EN, PAD, Y);
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

module BBS24SP_V5 (A, EN, PAD, Y);
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

module BBSD1P_V5 (A, EN, PAD, Y);
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

module BBSD4P_V5 (A, EN, PAD, Y);
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

module BBSD4SMP_V5 (A, EN, PAD, Y);
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

module BBSD8P_V5 (A, EN, PAD, Y);
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

module BBSD8SMP_V5 (A, EN, PAD, Y);
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

module BBSD8SP_V5 (A, EN, PAD, Y);
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

module BBSD16P_V5 (A, EN, PAD, Y);
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

module BBSD16SMP_V5 (A, EN, PAD, Y);
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

module BBSD16SP_V5 (A, EN, PAD, Y);
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

module BBSD24P_V5 (A, EN, PAD, Y);
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

module BBSD24SMP_V5 (A, EN, PAD, Y);
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

module BBSD24SP_V5 (A, EN, PAD, Y);
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

module BBSU1P_V5 (A, EN, PAD, Y);
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

module BBSU4P_V5 (A, EN, PAD, Y);
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

module BBSU4SMP_V5 (A, EN, PAD, Y);
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

module BBSU8P_V5 (A, EN, PAD, Y);
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

module BBSU8SMP_V5 (A, EN, PAD, Y);
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

module BBSU8SP_V5 (A, EN, PAD, Y);
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

module BBSU16P_V5 (A, EN, PAD, Y);
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

module BBSU16SMP_V5 (A, EN, PAD, Y);
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

module BBSU16SP_V5 (A, EN, PAD, Y);
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

module BBSU24P_V5 (A, EN, PAD, Y);
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

module BBSU24SMP_V5 (A, EN, PAD, Y);
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

module BBSU24SP_V5 (A, EN, PAD, Y);
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

module BBT1P_V5 (A, EN, PAD, Y);
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

module BBT4P_V5 (A, EN, PAD, Y);
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

module BBT4SMP_V5 (A, EN, PAD, Y);
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

module BBT8P_V5 (A, EN, PAD, Y);
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

module BBT8SMP_V5 (A, EN, PAD, Y);
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

module BBT8SP_V5 (A, EN, PAD, Y);
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

module BBT16P_V5 (A, EN, PAD, Y);
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

module BBT16SMP_V5 (A, EN, PAD, Y);
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

module BBT16SP_V5 (A, EN, PAD, Y);
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

module BBT24P_V5 (A, EN, PAD, Y);
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

module BBT24SMP_V5 (A, EN, PAD, Y);
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

module BBT24SP_V5 (A, EN, PAD, Y);
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

module BBTD1P_V5 (A, EN, PAD, Y);
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

module BBTD4P_V5 (A, EN, PAD, Y);
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

module BBTD4SMP_V5 (A, EN, PAD, Y);
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

module BBTD8P_V5 (A, EN, PAD, Y);
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

module BBTD8SMP_V5 (A, EN, PAD, Y);
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

module BBTD8SP_V5 (A, EN, PAD, Y);
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

module BBTD16P_V5 (A, EN, PAD, Y);
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

module BBTD16SMP_V5 (A, EN, PAD, Y);
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

module BBTD16SP_V5 (A, EN, PAD, Y);
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

module BBTD24P_V5 (A, EN, PAD, Y);
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

module BBTD24SMP_V5 (A, EN, PAD, Y);
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

module BBTD24SP_V5 (A, EN, PAD, Y);
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

module BBTU1P_V5 (A, EN, PAD, Y);
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

module BBTU4P_V5 (A, EN, PAD, Y);
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

module BBTU4SMP_V5 (A, EN, PAD, Y);
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

module BBTU8P_V5 (A, EN, PAD, Y);
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

module BBTU8SMP_V5 (A, EN, PAD, Y);
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

module BBTU8SP_V5 (A, EN, PAD, Y);
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

module BBTU16P_V5 (A, EN, PAD, Y);
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

module BBTU16SMP_V5 (A, EN, PAD, Y);
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

module BBTU16SP_V5 (A, EN, PAD, Y);
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

module BBTU24P_V5 (A, EN, PAD, Y);
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

module BBTU24SMP_V5 (A, EN, PAD, Y);
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

module BBTU24SP_V5 (A, EN, PAD, Y);
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

module BT1P_V5 (A, EN, PAD);
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

module BT2P_V5 (A, EN, PAD);
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

module BT4P_V5 (A, EN, PAD);
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

module BT4SMP_V5 (A, EN, PAD);
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

module BT8P_V5 (A, EN, PAD);
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

module BT8SMP_V5 (A, EN, PAD);
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

module BT8SP_V5 (A, EN, PAD);
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

module BT12P_V5 (A, EN, PAD);
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

module BT12SMP_V5 (A, EN, PAD);
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

module BT12SP_V5 (A, EN, PAD);
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

module BT16P_V5 (A, EN, PAD);
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

module BT16SMP_V5 (A, EN, PAD);
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

module BT16SP_V5 (A, EN, PAD);
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

module BT24P_V5 (A, EN, PAD);
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

module BT24SMP_V5 (A, EN, PAD);
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

module BT24SP_V5 (A, EN, PAD);
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

module BU1P_V5 (A, PAD);
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

module BU2P_V5 (A, PAD);
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

module BU4P_V5 (A, PAD);
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

module BU4SMP_V5 (A, PAD);
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

module BU8P_V5 (A, PAD);
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

module BU8SMP_V5 (A, PAD);
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

module BU8SP_V5 (A, PAD);
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

module BU12P_V5 (A, PAD);
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

module BU12SMP_V5 (A, PAD);
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

module BU12SP_V5 (A, PAD);
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

module BU16P_V5 (A, PAD);
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

module BU16SMP_V5 (A, PAD);
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

module BU16SP_V5 (A, PAD);
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

module BU24P_V5 (A, PAD);
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

module BU24SMP_V5 (A, PAD);
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

module BU24SP_V5 (A, PAD);
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

module BUDD1P_V5 (A, PAD);
  input A;
  output PAD;

  bufif0 (PAD, 0, A);

`ifdef functional
`else
  specify
    (A => PAD) = (1,1);
  endspecify
`endif

endmodule

module BUDD2P_V5 (A, PAD);
  input A;
  output PAD;

  bufif0 (PAD, 0, A);

`ifdef functional
`else
  specify
    (A => PAD) = (1,1);
  endspecify
`endif

endmodule

module BUDD4P_V5 (A, PAD);
  input A;
  output PAD;

  bufif0 (PAD, 0, A);

`ifdef functional
`else
  specify
    (A => PAD) = (1,1);
  endspecify
`endif

endmodule

module BUDD8P_V5 (A, PAD);
  input A;
  output PAD;

  bufif0 (PAD, 0, A);

`ifdef functional
`else
  specify
    (A => PAD) = (1,1);
  endspecify
`endif

endmodule

module BUDD12P_V5 (A, PAD);
  input A;
  output PAD;

  bufif0 (PAD, 0, A);

`ifdef functional
`else
  specify
    (A => PAD) = (1,1);
  endspecify
`endif

endmodule

module BUDD16P_V5 (A, PAD);
  input A;
  output PAD;

  bufif0 (PAD, 0, A);

`ifdef functional
`else
  specify
    (A => PAD) = (1,1);
  endspecify
`endif

endmodule

module BUDD24P_V5 (A, PAD);
  input A;
  output PAD;

  bufif0 (PAD, 0, A);

`ifdef functional
`else
  specify
    (A => PAD) = (1,1);
  endspecify
`endif

endmodule

module BUDU1P_V5 (A, PAD);
  input A;
  output PAD;

  notif0 (PAD, 0, A);

`ifdef functional
`else
  specify
    (A => PAD) = (1,1);
  endspecify
`endif

endmodule

module BUDU2P_V5 (A, PAD);
  input A;
  output PAD;

  notif0 (PAD, 0, A);

`ifdef functional
`else
  specify
    (A => PAD) = (1,1);
  endspecify
`endif

endmodule

module BUDU4P_V5 (A, PAD);
  input A;
  output PAD;

  notif0 (PAD, 0, A);

`ifdef functional
`else
  specify
    (A => PAD) = (1,1);
  endspecify
`endif

endmodule

module BUDU8P_V5 (A, PAD);
  input A;
  output PAD;

  notif0 (PAD, 0, A);

`ifdef functional
`else
  specify
    (A => PAD) = (1,1);
  endspecify
`endif

endmodule

module BUDU12P_V5 (A, PAD);
  input A;
  output PAD;

  notif0 (PAD, 0, A);

`ifdef functional
`else
  specify
    (A => PAD) = (1,1);
  endspecify
`endif

endmodule

module BUDU16P_V5 (A, PAD);
  input A;
  output PAD;

  notif0 (PAD, 0, A);

`ifdef functional
`else
  specify
    (A => PAD) = (1,1);
  endspecify
`endif

endmodule

module BUDU24P_V5 (A, PAD);
  input A;
  output PAD;

  notif0 (PAD, 0, A);

`ifdef functional
`else
  specify
    (A => PAD) = (1,1);
  endspecify
`endif

endmodule

module CBU1P_V5 (A, Y);
  input A;
  output Y;

  buf (Y, A);

`ifdef functional
`else
  specify
    (A => Y) = (1,1);
  endspecify
`endif

endmodule

module CBU2P_V5 (A, Y);
  input A;
  output Y;

  buf (Y, A);

`ifdef functional
`else
  specify
    (A => Y) = (1,1);
  endspecify
`endif

endmodule

module GND5ALLP_V5(A);
  inout A;
 
endmodule
 
module GND5IP_V5(A);
  inout A;
 
endmodule
 
module GND5OP_V5(A);
  inout A;
 
endmodule
 
module GND5RP_V5(A);
  inout A;
 
endmodule
 
module ICCK2P_V5 (PAD, Y);
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

module ICCK4P_V5 (PAD, Y);
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

module ICDP_V5 (PAD, Y);
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

module ICP_V5 (PAD, Y);
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

module ICUP_V5 (PAD, Y);
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

module ISDP_V5 (PAD, Y);
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

module ISP_V5 (PAD, Y);
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

module ISUP_V5 (PAD, Y);
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

module ITCK2P_V5 (PAD, Y);
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

module ITCK4P_V5 (PAD, Y);
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

module ITDP_V5 (PAD, Y);
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

module ITP_V5 (PAD, Y);
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

module ITUP_V5 (PAD, Y);
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

module VDD3IP_V5(A);
  inout A;
 
endmodule
 
module VDD3RP_V5(A);
  inout A;
 
 
endmodule
 
module VDD5ALLP_V5(A);
  inout A;
 
endmodule
 
module VDD5OP_V5(A);
  inout A;
 
endmodule
 
module VDD5RP_V5(A);
  inout A;
 
endmodule
 
`endcelldefine
