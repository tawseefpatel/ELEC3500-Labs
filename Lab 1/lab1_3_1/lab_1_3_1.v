`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Student: Tawseef Patel 101145333 & Saad Babur 101123210
// 
// Create Date: 10/14/2022
// Design Name: lab1_3_1.v 
// Module Name: lab1_3_1
// Project Name: Lab 1_3
//////////////////////////////////////////////////////////////////////////////////


module lab_1_3_1(
    input wire [1:0] x,
    input wire [1:0] y,
    input s,
    output reg [1:0] m
    );
    
    always @(*)
    begin
       if(s == 0) begin
            m[0] = x[0];
            m[1] = x[1];  
       end
       else begin
            m[0] = y[0];
            m[1] = y[1];
        end
    end
endmodule
