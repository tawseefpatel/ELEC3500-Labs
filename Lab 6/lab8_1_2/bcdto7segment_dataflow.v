`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Student: Tawseef Patel 101145333
// 
// Create Date: 10/19/2022 
// Design Name: bcdto7segment_dataflow.v
// Module Name: bcdto7segment_dataflow
// Project Name: Lab2_2_1
//
//////////////////////////////////////////////////////////////////////////////////

module bcdto7segment_dataflow (
    input [3:0] x,
    output [7:0] an,
    output reg [6:0] seg
);

assign an = 8'b11111110; // enable only the left most segment display

always@(*)
begin
    case(x)
        4'b0000 : seg = 7'b1000000;
        4'b0001 : seg = 7'b1111001;
        4'b0010 : seg = 7'b0100100;
        4'b0011 : seg = 7'b0110000;
        4'b0100 : seg = 7'b0011001;
        4'b0101 : seg = 7'b0010010;
        4'b0100 : seg = 7'b0000010;
        4'b0110 : seg = 7'b0000010;
        4'b0111 : seg = 7'b1111000;
        4'b1000 : seg = 7'b0000000;
        4'b1001 : seg = 7'b0010000;
        default : seg = 7'b1111001; // letter E for error
    endcase 
end

endmodule