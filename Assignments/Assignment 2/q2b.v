`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Student: Tawseef Patel 101145333
// 
// Create Date: 10/31/2022
// Design Name: Assigment 2 Q2b
// Module Name: ass2_q2b_24_to_1_mux
// Project Name: Assignment 2
//
//////////////////////////////////////////////////////////////////////////////////

module ass2_q2b_24_to_1_mux (
    input [23:0] x,
    input [4:0] sel,
    output reg out
)
    reg [3:0] connects;

    ass2_q2a_6_to_1_mux mux1(.in(x[5:0])   , .sel(sel[2:0]) , .out(connects[0]));
    ass2_q2a_6_to_1_mux mux2(.in(x[11:6])  , .sel(sel[2:0]) , .out(connects[1]));
    ass2_q2a_6_to_1_mux mux3(.in(x[17:12]) , .sel(sel[2:0]) , .out(connects[2]));
    ass2_q2a_6_to_1_mux mux4(.in(x[23:18]) , .sel(sel[2:0]) , .out(connects[3]));

    ass2_q2a_6_to_1_mux mux_final(.in(connects), .sel(sel[4:3]), .out(out));
endmodule