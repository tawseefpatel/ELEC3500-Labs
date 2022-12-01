`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2022 03:44:36 PM
// Design Name: 
// Module Name: up_down_counter
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


module up_down_counter(
    input wire clk, reset, enable, up,
    output reg [7:0] count 
    );
    
    always@(posedge clk or negedge reset) begin
        if (reset) count <= 0;
        else if (enable) begin
           if(up) count <= count + 1;
           else count <= count - 1;
        end
    end
endmodule
