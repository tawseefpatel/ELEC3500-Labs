`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Student: Tawseef Patel 101145333
// 
// Create Date: 10/31/2022 
// Design Name: Assigment 2 Q2a
// Module Name: ass2_q2a_6_to_1_mux
// Project Name: Assignment 2
//
//////////////////////////////////////////////////////////////////////////////////

module ass2_q2a_6_to_1_mux (
    input [2:0] sel,
    input [5:0] in,
    output reg out
);
  always @(*) begin
    case(sel) 
        3'b000  : out=in[0];
        3'b001  : out=in[1];
        3'b010  : out=in[2];
        3'b011  : out=in[3];
        3'b100  : out=in[4];
        3'b101  : out=in[5];
        default : out=0;
    endcase
  end
endmodule
