`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Student: Tawseef Patel 101145333
// 
// Create Date: 10/20/2022 
// Design Name: Lab3_3_1.v
// Module Name: lab3_3_1
// Project Name: Lab3_3_1
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