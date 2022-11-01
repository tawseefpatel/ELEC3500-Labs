`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Student: Tawseef Patel 101145333
// 
// Create Date: 10/31/2022 
// Design Name: Assigment 2 Q3
// Module Name: a_squared
// Project Name: Assignment 2
//
//////////////////////////////////////////////////////////////////////////////////

module a_squared (
    input [2:0] a,
    output [4:0] y
);

assign y[0] = a[0] & !a[2];
assign y[1] = 0;
assign y[2] = a[1] & !a[0] & !a[2];
assign y[3] = a[0] & a[1] & !a[2];
assign y[4] = a[2] & !a[0] & !a[1];

endmodule