`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2022 11:44:52 AM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
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
