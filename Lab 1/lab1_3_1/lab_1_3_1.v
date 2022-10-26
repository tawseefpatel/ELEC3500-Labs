`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2022 05:29:04 PM
// Design Name: 
// Module Name: lab_1_3_1
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
