`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Student: Tawseef Patel 101145333 & Saad Babur 101123210
// 
// Create Date: 10/14/2022
// Design Name: lab_1_4_1.v 
// Module Name: lab_1_4_1
// Project Name: Lab 1_4_1
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
