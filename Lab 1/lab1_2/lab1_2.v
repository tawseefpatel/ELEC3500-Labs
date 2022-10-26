`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Student: Tawseef Patel 101145333 & Saad Babur 101123210
// 
// Create Date: 10/14/2022 03:41:20 PM
// Design Name: 2x1 MUX - GATE LEVEL 
// Module Name: lab1_1_1
// Project Name: Lab 1
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


module lab1_2(
    input [1:0] x,
    input [1:0] y,
    input s,
    output [1:0] m
    );
    
    not var1(not_s, s);
    and var2(x_not_s_0, x[0], not_s);
    and var3(y_s_0, y[0], s);
    
    and var4(x_not_s_1, x[1], not_s);
    and var5(y_s_1, y[1], s);
    or(m[0], x_not_s_0, y_s_0);
    or(m[1], x_not_s_1, y_s_1);    
endmodule
