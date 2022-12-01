`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Student: Tawseef Patel 101145333
// 
// Create Date: 10/20/2022 
// Design Name: fulladder_dataflow.v
// Module Name: fulladder_dataflow
// Project Name: Lab2_4_1
//
//////////////////////////////////////////////////////////////////////////////////


module fulladder_dataflow(
    input a, b, cin,
    output s, p, g
);

parameter AND_DELAY = 2;
parameter OR_DELAY = 2;
parameter XOR_DELAY = 2;

xor #(XOR_DELAY) x_or (s, a, b, cin);
and #(AND_DELAY) a_nd (p, a, b);
or  #(OR_DELAY)  o_r  (g, a, b);

endmodule
