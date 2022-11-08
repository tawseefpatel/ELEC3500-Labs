`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Student: Tawseef Patel 101145333
// 
// Create Date: 10/19/2022 
// Design Name: lab2_2_1.v
// Module Name: lab2_2_1_partA
// Project Name: Lab2_2_1
//
//////////////////////////////////////////////////////////////////////////////////

module lab2_2_1_partA(
    input  [3:0] v,
    output  z, 
    output  [3:0] m
);

assign z = (v > 9); // 1 if V greater than 9

assign m = z? v-10:v; // if z=1 -> v-10 ( m goes back to 0000), else m = v

endmodule