`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2022 08:15:31 PM
// Design Name: 
// Module Name: fulladder_dataflow
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

module lab3_3_1(
    input [1:0] a, 
    input [1:0] b,
    output lt, gt, eq
);
reg [2:0] rom[15:0];
wire [2:0] rom_data;

assign rom_data = rom[{a, b}];
initial $readmemb("ROM_data.txt", rom, 0, 15);

assign gt = rom_data[1];
assign eq = rom_data[0];
assign lt = rom_data[2];

endmodule