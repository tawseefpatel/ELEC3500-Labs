`timescale 1ns / 1ps

module top(
    input [3:0] bin_val,
    output reg [6:0] seg,
    output [7:0] an,
    output z
);
reg [3:0] m_out;

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