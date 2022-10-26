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


module lab_1_2_2(
    input [1:0] x,
    input [1:0] y,
    input s,
    output [1:0] m
    );
    
    assign #3 m[0] = (x[0] & ~s) | (y[0] & s);
    assign #3 m[1] = (x[1] & ~s) | (y[1] & s); 
endmodule
