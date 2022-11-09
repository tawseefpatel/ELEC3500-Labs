`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Student: Tawseef Patel 101145333
// 
// Create Date: 08/11/2022 
// Design Name: Lab 6_1_2
// Module Name: register_sync_reset_load
// Project Name: Lab 6_1_2
//
//////////////////////////////////////////////////////////////////////////////////


module register_sync_reset_load(
    input [3:0] D,
    input clk,reset,load,set,
    output reg [3:0] Q
    );

always @(posedge clk)

    if (reset) Q <= 4'b0000; 
    else if (set) Q <= 4'hF;
    else  Q <= D; 

endmodule