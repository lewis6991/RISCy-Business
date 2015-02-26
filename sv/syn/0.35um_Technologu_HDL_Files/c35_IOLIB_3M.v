// Verilog simulation library for c35 IOLIB_4M 3.3V
// $Id: csx_IOLIB_3M.v,v 1.1 2001/09/25 12:07:16 mbo Exp mbo $
// Owner: austriamicrosystems AG  HIT-Kit: Digital
`timescale 1ns/1ps
`celldefine 
module BBC1P (A, EN, PAD, Y);
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

module BBC4P (A, EN, PAD, Y);
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

module BBC4SMP (A, EN, PAD, Y);
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

module BBC8P (A, EN, PAD, Y);
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

module BBC8SMP (A, EN, PAD, Y);
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

module BBC8SP (A, EN, PAD, Y);
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

module BBC16P (A, EN, PAD, Y);
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

module BBC16SMP (A, EN, PAD, Y);
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

module BBC16SP (A, EN, PAD, Y);
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

module BBC24P (A, EN, PAD, Y);
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

module BBC24SMP (A, EN, PAD, Y);
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

module BBC24SP (A, EN, PAD, Y);
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

module BBCD1P (A, EN, PAD, Y);
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

module BBCD4P (A, EN, PAD, Y);
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

module BBCD4SMP (A, EN, PAD, Y);
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

module BBCD8P (A, EN, PAD, Y);
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

module BBCD8SMP (A, EN, PAD, Y);
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

module BBCD8SP (A, EN, PAD, Y);
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

module BBCD16P (A, EN, PAD, Y);
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

module BBCD16SMP (A, EN, PAD, Y);
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

module BBCD16SP (A, EN, PAD, Y);
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

module BBCD24P (A, EN, PAD, Y);
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

module BBCD24SMP (A, EN, PAD, Y);
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

module BBCD24SP (A, EN, PAD, Y);
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

module BBCU1P (A, EN, PAD, Y);
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

module BBCU4P (A, EN, PAD, Y);
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

module BBCU4SMP (A, EN, PAD, Y);
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

module BBCU8P (A, EN, PAD, Y);
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

module BBCU8SMP (A, EN, PAD, Y);
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

module BBCU8SP (A, EN, PAD, Y);
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

module BBCU16P (A, EN, PAD, Y);
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

module BBCU16SMP (A, EN, PAD, Y);
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

module BBCU16SP (A, EN, PAD, Y);
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

module BBCU24P (A, EN, PAD, Y);
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

module BBCU24SMP (A, EN, PAD, Y);
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

module BBCU24SP (A, EN, PAD, Y);
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

module BBS1P (A, EN, PAD, Y);
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

module BBS4P (A, EN, PAD, Y);
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

module BBS4SMP (A, EN, PAD, Y);
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

module BBS8P (A, EN, PAD, Y);
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

module BBS8SMP (A, EN, PAD, Y);
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

module BBS8SP (A, EN, PAD, Y);
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

module BBS16P (A, EN, PAD, Y);
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

module BBS16SMP (A, EN, PAD, Y);
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

module BBS16SP (A, EN, PAD, Y);
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

module BBS24P (A, EN, PAD, Y);
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

module BBS24SMP (A, EN, PAD, Y);
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

module BBS24SP (A, EN, PAD, Y);
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

module BBSD1P (A, EN, PAD, Y);
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

module BBSD4P (A, EN, PAD, Y);
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

module BBSD4SMP (A, EN, PAD, Y);
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

module BBSD8P (A, EN, PAD, Y);
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

module BBSD8SMP (A, EN, PAD, Y);
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

module BBSD8SP (A, EN, PAD, Y);
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

module BBSD16P (A, EN, PAD, Y);
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

module BBSD16SMP (A, EN, PAD, Y);
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

module BBSD16SP (A, EN, PAD, Y);
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

module BBSD24P (A, EN, PAD, Y);
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

module BBSD24SMP (A, EN, PAD, Y);
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

module BBSD24SP (A, EN, PAD, Y);
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

module BBSU1P (A, EN, PAD, Y);
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

module BBSU4P (A, EN, PAD, Y);
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

module BBSU4SMP (A, EN, PAD, Y);
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

module BBSU8P (A, EN, PAD, Y);
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

module BBSU8SMP (A, EN, PAD, Y);
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

module BBSU8SP (A, EN, PAD, Y);
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

module BBSU16P (A, EN, PAD, Y);
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

module BBSU16SMP (A, EN, PAD, Y);
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

module BBSU16SP (A, EN, PAD, Y);
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

module BBSU24P (A, EN, PAD, Y);
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

module BBSU24SMP (A, EN, PAD, Y);
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

module BBSU24SP (A, EN, PAD, Y);
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

module BBT1P (A, EN, PAD, Y);
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

module BBT4P (A, EN, PAD, Y);
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

module BBT4SMP (A, EN, PAD, Y);
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

module BBT8P (A, EN, PAD, Y);
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

module BBT8SMP (A, EN, PAD, Y);
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

module BBT8SP (A, EN, PAD, Y);
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

module BBT16P (A, EN, PAD, Y);
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

module BBT16SMP (A, EN, PAD, Y);
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

module BBT16SP (A, EN, PAD, Y);
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

module BBT24P (A, EN, PAD, Y);
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

module BBT24SMP (A, EN, PAD, Y);
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

module BBT24SP (A, EN, PAD, Y);
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

module BBTD1P (A, EN, PAD, Y);
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

module BBTD4P (A, EN, PAD, Y);
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

module BBTD4SMP (A, EN, PAD, Y);
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

module BBTD8P (A, EN, PAD, Y);
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

module BBTD8SMP (A, EN, PAD, Y);
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

module BBTD8SP (A, EN, PAD, Y);
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

module BBTD16P (A, EN, PAD, Y);
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

module BBTD16SMP (A, EN, PAD, Y);
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

module BBTD16SP (A, EN, PAD, Y);
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

module BBTD24P (A, EN, PAD, Y);
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

module BBTD24SMP (A, EN, PAD, Y);
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

module BBTD24SP (A, EN, PAD, Y);
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

module BBTU1P (A, EN, PAD, Y);
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

module BBTU4P (A, EN, PAD, Y);
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

module BBTU4SMP (A, EN, PAD, Y);
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

module BBTU8P (A, EN, PAD, Y);
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

module BBTU8SMP (A, EN, PAD, Y);
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

module BBTU8SP (A, EN, PAD, Y);
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

module BBTU16P (A, EN, PAD, Y);
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

module BBTU16SMP (A, EN, PAD, Y);
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

module BBTU16SP (A, EN, PAD, Y);
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

module BBTU24P (A, EN, PAD, Y);
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

module BBTU24SMP (A, EN, PAD, Y);
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

module BBTU24SP (A, EN, PAD, Y);
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

module BT1P (A, EN, PAD);
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

module BT2P (A, EN, PAD);
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

module BT4P (A, EN, PAD);
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

module BT4SMP (A, EN, PAD);
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

module BT8P (A, EN, PAD);
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

module BT8SMP (A, EN, PAD);
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

module BT8SP (A, EN, PAD);
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

module BT12P (A, EN, PAD);
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

module BT12SMP (A, EN, PAD);
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

module BT12SP (A, EN, PAD);
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

module BT16P (A, EN, PAD);
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

module BT16SMP (A, EN, PAD);
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

module BT16SP (A, EN, PAD);
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

module BT24P (A, EN, PAD);
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

module BT24SMP (A, EN, PAD);
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

module BT24SP (A, EN, PAD);
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

module BU1P (A, PAD);
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

module BU2P (A, PAD);
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

module BU4P (A, PAD);
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

module BU4SMP (A, PAD);
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

module BU8P (A, PAD);
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

module BU8SMP (A, PAD);
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

module BU8SP (A, PAD);
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

module BU12P (A, PAD);
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

module BU12SMP (A, PAD);
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

module BU12SP (A, PAD);
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

module BU16P (A, PAD);
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

module BU16SMP (A, PAD);
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

module BU16SP (A, PAD);
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

module BU24P (A, PAD);
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

module BU24SMP (A, PAD);
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

module BU24SP (A, PAD);
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

module BUDD1P (A, PAD);
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

module BUDD2P (A, PAD);
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

module BUDD4P (A, PAD);
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

module BUDD8P (A, PAD);
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

module BUDD12P (A, PAD);
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

module BUDD16P (A, PAD);
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

module BUDD24P (A, PAD);
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

module BUDU1P (A, PAD);
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

module BUDU2P (A, PAD);
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

module BUDU4P (A, PAD);
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

module BUDU8P (A, PAD);
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

module BUDU12P (A, PAD);
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

module BUDU16P (A, PAD);
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

module BUDU24P (A, PAD);
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

module CBU1P (A, Y);
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

module CBU2P (A, Y);
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

module GND3ALLP(A);
  inout A;
 
endmodule
 
module GND3IP(A);
  inout A;
 
endmodule
 
module GND3OP(A);
  inout A;
 
endmodule
 
module GND3RP(A);
  inout A;
 
endmodule
 
module ICCK2P (PAD, Y);
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

module ICCK4P (PAD, Y);
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

module ICCK8P (PAD, Y);
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

module ICCK16P (PAD, Y);
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

module ICDP (PAD, Y);
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

module ICP (PAD, Y);
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

module ICUP (PAD, Y);
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

module ISDP (PAD, Y);
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

module ISP (PAD, Y);
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

module ISUP (PAD, Y);
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

module ITCK2P (PAD, Y);
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

module ITCK4P (PAD, Y);
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

module ITCK8P (PAD, Y);
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

module ITCK16P (PAD, Y);
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

module ITDP (PAD, Y);
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

module ITP (PAD, Y);
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

module ITUP (PAD, Y);
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

module VDD3ALLP(A);
  inout A;
 
endmodule
 
module VDD3IP(A);
  inout A;
 
endmodule
 
module VDD3OP(A);
  inout A;
 
endmodule
 
module VDD3RP(A);
  inout A;
 
endmodule
 
`endcelldefine
