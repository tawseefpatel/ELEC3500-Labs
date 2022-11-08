`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Student: Tawseef Patel 101145333
// 
// Create Date: 10/19/2022 
// Design Name: top.v
// Module Name: top
// Project Name: Lab2_2_1
//
//////////////////////////////////////////////////////////////////////////////////

module top(
    input  [3:0] bin_val,
    output  [6:0] seg,
    output [7:0] an,
    output  z
);
wire [3:0] m_out;

lab2_2_1_partA parta(
    .v(bin_val),
    .z(z),
    .m(m_out)
);

bcdto7segment_dataflow display(
    .x(m_out),
    .an(an),
    .seg(seg)
);

endmodule
