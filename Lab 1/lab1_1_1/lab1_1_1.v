`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Student: Tawseef Patel 101145333 & Saad Babur 101123210
// 
// Create Date: 10/14/2022
// Design Name: lab1_1_1.v //2x1 MUX - GATE LEVEL 
// Module Name: lab1_1_1
// Project Name: Lab 1_1
//////////////////////////////////////////////////////////////////////////////////


module lab1_1_1(
    input x,
    input y,
    input s,
    output m
    );
    
    not var1(not_s, s);
    and var2(x_not_s, x, not_s);
    and var3(y_s, y, s);
    or out(m, x_not_s, y_s);
endmodule
