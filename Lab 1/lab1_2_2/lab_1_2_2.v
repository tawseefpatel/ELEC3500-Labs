`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Student: Tawseef Patel 101145333 & Saad Babur 101123210
// 
// Create Date: 10/14/2022
// Design Name: lab1_2_2.v
// Module Name: lab1_2_2
// Project Name: Lab 1_2
//////////////////////////////////////////////////////////////////////////////////


module lab_1_2_2(
    input [1:0] x,
    input [1:0] y,
    input s,
    output [1:0] m
    );
    
    assign #3 m[0] = (x[0] & ~s) | (y[0] & s);
    assign #3 m[1] = (x[1] & ~s) | (y[1] & s); 
endmodule
