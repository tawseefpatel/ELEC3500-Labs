`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Student: Tawseef Patel 101145333
// 
// Create Date: 10/21/2022 
// Design Name: Lab3_2_1.v
// Module Name: lab3_2_1
// Project Name: Lab3_2_1
//
//////////////////////////////////////////////////////////////////////////////////

module lab3_2_1(
    input [7:0]x,
    input en_in_n,
    output reg [2:0]y,
    output reg en_out,
    output reg gs
    );

always@(*)
    begin
    if (!en_in_n)
        casex(x)
               8'b11111111 : begin  y = 3'b111 ; gs = 1; en_out = 0; end
               8'bxxxxxxx0 : begin  y = 3'b000 ; gs = 0; en_out = 1; end
               8'bxxxxxx01 : begin  y = 3'b001 ; gs = 0; en_out = 1; end
               8'bxxxxx011 : begin  y = 3'b010 ; gs = 0; en_out = 1; end     
               8'bxxxx0111 : begin  y = 3'b011 ; gs = 0; en_out = 1; end
               8'bxxx01111 : begin  y = 3'b100 ; gs = 0; en_out = 1; end
               8'bxx011111 : begin  y = 3'b101 ; gs = 0; en_out = 1; end
               8'bx0111111 : begin  y = 3'b110 ; gs = 0; en_out = 1; end
               8'b01111111 : begin  y = 3'b111 ; gs = 0; en_out = 1; end 
               default     : begin  y = 3'b000 ; gs = 0; en_out = 0; end
        endcase  
    else casex(x)
               8'bxxxxxxxx : begin  y = 3'b111 ; gs = 1; en_out = 1; end
               default     : begin  y = 3'b000 ; gs = 0; en_out = 0; end
        endcase
    end
         
endmodule
