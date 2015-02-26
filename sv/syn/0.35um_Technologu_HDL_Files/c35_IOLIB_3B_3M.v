// Verilog simulation library for c35 IOLIB_4M_3B 3.3V
// $Id: c35 IOLIB_3B_4M.v,v 1.1 2001/09/25 12:07:16 bka Exp mbo $
// Owner: austriamicrosystems AG  HIT-Kit: Digital
`timescale 1ns/1ps
`celldefine 
module BBC1P_3B (A, EN, PAD, Y);
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

module BBC4P_3B (A, EN, PAD, Y);
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

module BBC4SMP_3B (A, EN, PAD, Y);
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

module BBC8P_3B (A, EN, PAD, Y);
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

module BBC8SMP_3B (A, EN, PAD, Y);
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

module BBC8SP_3B (A, EN, PAD, Y);
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

module BBC16P_3B (A, EN, PAD, Y);
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

module BBC16SMP_3B (A, EN, PAD, Y);
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

module BBC16SP_3B (A, EN, PAD, Y);
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

module BBC24P_3B (A, EN, PAD, Y);
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

module BBC24SMP_3B (A, EN, PAD, Y);
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

module BBC24SP_3B (A, EN, PAD, Y);
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

module BBCD1P_3B (A, EN, PAD, Y);
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

module BBCD4P_3B (A, EN, PAD, Y);
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

module BBCD4SMP_3B (A, EN, PAD, Y);
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

module BBCD8P_3B (A, EN, PAD, Y);
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

module BBCD8SMP_3B (A, EN, PAD, Y);
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

module BBCD8SP_3B (A, EN, PAD, Y);
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

module BBCD16P_3B (A, EN, PAD, Y);
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

module BBCD16SMP_3B (A, EN, PAD, Y);
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

module BBCD16SP_3B (A, EN, PAD, Y);
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

module BBCD24P_3B (A, EN, PAD, Y);
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

module BBCD24SMP_3B (A, EN, PAD, Y);
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

module BBCD24SP_3B (A, EN, PAD, Y);
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

module BBCU1P_3B (A, EN, PAD, Y);
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

module BBCU4P_3B (A, EN, PAD, Y);
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

module BBCU4SMP_3B (A, EN, PAD, Y);
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

module BBCU8P_3B (A, EN, PAD, Y);
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

module BBCU8SMP_3B (A, EN, PAD, Y);
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

module BBCU8SP_3B (A, EN, PAD, Y);
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

module BBCU16P_3B (A, EN, PAD, Y);
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

module BBCU16SMP_3B (A, EN, PAD, Y);
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

module BBCU16SP_3B (A, EN, PAD, Y);
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

module BBCU24P_3B (A, EN, PAD, Y);
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

module BBCU24SMP_3B (A, EN, PAD, Y);
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

module BBCU24SP_3B (A, EN, PAD, Y);
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

module BBS1P_3B (A, EN, PAD, Y);
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

module BBS4P_3B (A, EN, PAD, Y);
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

module BBS4SMP_3B (A, EN, PAD, Y);
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

module BBS8P_3B (A, EN, PAD, Y);
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

module BBS8SMP_3B (A, EN, PAD, Y);
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

module BBS8SP_3B (A, EN, PAD, Y);
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

module BBS16P_3B (A, EN, PAD, Y);
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

module BBS16SMP_3B (A, EN, PAD, Y);
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

module BBS16SP_3B (A, EN, PAD, Y);
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

module BBS24P_3B (A, EN, PAD, Y);
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

module BBS24SMP_3B (A, EN, PAD, Y);
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

module BBS24SP_3B (A, EN, PAD, Y);
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

module BBSD1P_3B (A, EN, PAD, Y);
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

module BBSD4P_3B (A, EN, PAD, Y);
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

module BBSD4SMP_3B (A, EN, PAD, Y);
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

module BBSD8P_3B (A, EN, PAD, Y);
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

module BBSD8SMP_3B (A, EN, PAD, Y);
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

module BBSD8SP_3B (A, EN, PAD, Y);
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

module BBSD16P_3B (A, EN, PAD, Y);
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

module BBSD16SMP_3B (A, EN, PAD, Y);
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

module BBSD16SP_3B (A, EN, PAD, Y);
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

module BBSD24P_3B (A, EN, PAD, Y);
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

module BBSD24SMP_3B (A, EN, PAD, Y);
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

module BBSD24SP_3B (A, EN, PAD, Y);
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

module BBSU1P_3B (A, EN, PAD, Y);
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

module BBSU4P_3B (A, EN, PAD, Y);
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

module BBSU4SMP_3B (A, EN, PAD, Y);
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

module BBSU8P_3B (A, EN, PAD, Y);
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

module BBSU8SMP_3B (A, EN, PAD, Y);
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

module BBSU8SP_3B (A, EN, PAD, Y);
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

module BBSU16P_3B (A, EN, PAD, Y);
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

module BBSU16SMP_3B (A, EN, PAD, Y);
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

module BBSU16SP_3B (A, EN, PAD, Y);
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

module BBSU24P_3B (A, EN, PAD, Y);
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

module BBSU24SMP_3B (A, EN, PAD, Y);
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

module BBSU24SP_3B (A, EN, PAD, Y);
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

module BBT1P_3B (A, EN, PAD, Y);
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

module BBT4P_3B (A, EN, PAD, Y);
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

module BBT4SMP_3B (A, EN, PAD, Y);
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

module BBT8P_3B (A, EN, PAD, Y);
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

module BBT8SMP_3B (A, EN, PAD, Y);
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

module BBT8SP_3B (A, EN, PAD, Y);
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

module BBT16P_3B (A, EN, PAD, Y);
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

module BBT16SMP_3B (A, EN, PAD, Y);
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

module BBT16SP_3B (A, EN, PAD, Y);
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

module BBT24P_3B (A, EN, PAD, Y);
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

module BBT24SMP_3B (A, EN, PAD, Y);
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

module BBT24SP_3B (A, EN, PAD, Y);
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

module BBTD1P_3B (A, EN, PAD, Y);
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

module BBTD4P_3B (A, EN, PAD, Y);
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

module BBTD4SMP_3B (A, EN, PAD, Y);
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

module BBTD8P_3B (A, EN, PAD, Y);
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

module BBTD8SMP_3B (A, EN, PAD, Y);
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

module BBTD8SP_3B (A, EN, PAD, Y);
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

module BBTD16P_3B (A, EN, PAD, Y);
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

module BBTD16SMP_3B (A, EN, PAD, Y);
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

module BBTD16SP_3B (A, EN, PAD, Y);
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

module BBTD24P_3B (A, EN, PAD, Y);
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

module BBTD24SMP_3B (A, EN, PAD, Y);
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

module BBTD24SP_3B (A, EN, PAD, Y);
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

module BBTU1P_3B (A, EN, PAD, Y);
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

module BBTU4P_3B (A, EN, PAD, Y);
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

module BBTU4SMP_3B (A, EN, PAD, Y);
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

module BBTU8P_3B (A, EN, PAD, Y);
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

module BBTU8SMP_3B (A, EN, PAD, Y);
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

module BBTU8SP_3B (A, EN, PAD, Y);
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

module BBTU16P_3B (A, EN, PAD, Y);
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

module BBTU16SMP_3B (A, EN, PAD, Y);
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

module BBTU16SP_3B (A, EN, PAD, Y);
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

module BBTU24P_3B (A, EN, PAD, Y);
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

module BBTU24SMP_3B (A, EN, PAD, Y);
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

module BBTU24SP_3B (A, EN, PAD, Y);
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

module BT1P_3B (A, EN, PAD);
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

module BT2P_3B (A, EN, PAD);
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

module BT4P_3B (A, EN, PAD);
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

module BT4SMP_3B (A, EN, PAD);
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

module BT8P_3B (A, EN, PAD);
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

module BT8SMP_3B (A, EN, PAD);
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

module BT8SP_3B (A, EN, PAD);
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

module BT12P_3B (A, EN, PAD);
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

module BT12SMP_3B (A, EN, PAD);
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

module BT12SP_3B (A, EN, PAD);
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

module BT16P_3B (A, EN, PAD);
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

module BT16SMP_3B (A, EN, PAD);
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

module BT16SP_3B (A, EN, PAD);
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

module BT24P_3B (A, EN, PAD);
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

module BT24SMP_3B (A, EN, PAD);
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

module BT24SP_3B (A, EN, PAD);
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

module BU1P_3B (A, PAD);
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

module BU2P_3B (A, PAD);
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

module BU4P_3B (A, PAD);
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

module BU4SMP_3B (A, PAD);
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

module BU8P_3B (A, PAD);
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

module BU8SMP_3B (A, PAD);
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

module BU8SP_3B (A, PAD);
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

module BU12P_3B (A, PAD);
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

module BU12SMP_3B (A, PAD);
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

module BU12SP_3B (A, PAD);
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

module BU16P_3B (A, PAD);
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

module BU16SMP_3B (A, PAD);
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

module BU16SP_3B (A, PAD);
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

module BU24P_3B (A, PAD);
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

module BU24SMP_3B (A, PAD);
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

module BU24SP_3B (A, PAD);
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

module BUDD1P_3B (A, PAD);
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

module BUDD2P_3B (A, PAD);
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

module BUDD4P_3B (A, PAD);
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

module BUDD8P_3B (A, PAD);
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

module BUDD12P_3B (A, PAD);
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

module BUDD16P_3B (A, PAD);
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

module BUDD24P_3B (A, PAD);
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

module BUDU1P_3B (A, PAD);
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

module BUDU2P_3B (A, PAD);
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

module BUDU4P_3B (A, PAD);
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

module BUDU8P_3B (A, PAD);
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

module BUDU12P_3B (A, PAD);
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

module BUDU16P_3B (A, PAD);
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

module BUDU24P_3B (A, PAD);
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

module CBU1P_3B (A, Y);
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

module CBU2P_3B (A, Y);
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

module GND3ALLP_3B(A);
  inout A;
 
endmodule
 
module GND3IP_3B(A);
  inout A;
 
endmodule
 
module GND3OP_3B(A);
  inout A;
 
endmodule
 
module GND3RP_3B(A);
  inout A;
 
endmodule
 
module ICCK2P_3B (PAD, Y);
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

module ICCK4P_3B (PAD, Y);
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

module ICCK8P_3B (PAD, Y);
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

module ICCK16P_3B (PAD, Y);
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

module ICDP_3B (PAD, Y);
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

module ICP_3B (PAD, Y);
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

module ICUP_3B (PAD, Y);
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

module ISDP_3B (PAD, Y);
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

module ISP_3B (PAD, Y);
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

module ISUP_3B (PAD, Y);
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

module ITCK2P_3B (PAD, Y);
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

module ITCK4P_3B (PAD, Y);
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

module ITCK8P_3B (PAD, Y);
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

module ITCK16P_3B (PAD, Y);
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

module ITDP_3B (PAD, Y);
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

module ITP_3B (PAD, Y);
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

module ITUP_3B (PAD, Y);
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

module VSUBP_3B(A);
  inout A;
 
endmodule

module VDD3ALLP_3B(A);
  inout A;
 
endmodule
 
module VDD3IP_3B(A);
  inout A;
 
endmodule
 
module VDD3OP_3B(A);
  inout A;
 
endmodule
 
module VDD3RP_3B(A);
  inout A;
 
endmodule
 
`endcelldefine
