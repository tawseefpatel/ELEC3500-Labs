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
    // reg  [4:0] y;
    // wire [2:0] a
    // always @(*) begin
    //     y=0;
    //     case (a)
    //         3'b000 : y=0; 0 0000
    //         3'b001 : y=1; 0 0001
    //         3'b010 : y=4; 0 0100
    //         3'b011 : y=9; 0 1001
    //         3'b100 : y=16;1 0000
    //         default: y=0; 0 0000
    //     endcase
    // end

assign y[0] = a[0] & !a[2];
assign y[1] = 0;
assign y[2] = a[1] & !a[0] & !a[2];
assign y[3] = a[0] & a[1] & !a[2];
assign y[4] = a[2] & !a[0] & !a[1];

endmodule