`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2022 05:43:53 PM
// Design Name: 
// Module Name: lab_1_4_1
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


module lab_1_4_1(
    input  u,
    input  w,
    input  v,
    input s0,
    input s1,
    output m
    );

    wire A;
    lab1_1_1 (
        .x(u),
        .y(v),
        .s(s0),
        .m(A)
    );
    
    lab1_1_1 (
        .x(A),
        .y(w),
        .s(s1),
        .m(m)
    );
    
    
endmodule
