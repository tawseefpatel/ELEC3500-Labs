`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Student: Tawseef Patel 101145333
// 
// Create Date: 10/21/2022 
// Design Name: Lab3_1_1.v
// Module Name: decoder_3to8_dataflow
// Project Name: Lab3_1_1
//
//////////////////////////////////////////////////////////////////////////////////



module decoder_3to8_dataflow(
    input [2:0] x,
    output reg [7:0] y
 );
    
always@(*)
begin
    case(x)
        3'b000 : y = 8'b00000001;
        3'b001 : y = 8'b00000010;
        3'b010 : y = 8'b00000100;
        3'b011 : y = 8'b00001000;
        3'b100 : y = 8'b00010000;
        3'b101 : y = 8'b00100000;
        3'b110 : y = 8'b01000000;
        3'b111 : y = 8'b10000000;
        default: y = 8'b00000001;
   endcase
end
endmodule
