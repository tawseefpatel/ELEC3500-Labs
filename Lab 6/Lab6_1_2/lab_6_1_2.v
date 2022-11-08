`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2022 08:15:31 PM
// Design Name: 
// Module Name: register_sync_reset_load
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