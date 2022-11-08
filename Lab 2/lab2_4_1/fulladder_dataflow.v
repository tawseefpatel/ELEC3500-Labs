`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Student: Tawseef Patel 101145333
// 
// Create Date: 10/20/2022 
// Design Name: fulladder_dataflow.v
// Module Name: fulladder_dataflow
// Project Name: Lab2_4_1
//
//////////////////////////////////////////////////////////////////////////////////


module fulladder_dataflow(
    input a, b, cin,
    output s, p, g
);

assign s = ^{a, b, cin};
assign p = a + b;
assign g = a | b; 
    
endmodule
