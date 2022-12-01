`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Student: Tawseef Patel 101145333
// 
// Create Date: 10/20/2022 
// Design Name: Lab2_4_1.v
// Module Name: fulladder_dataflow
// Project Name: Lab2_4_1
//
//////////////////////////////////////////////////////////////////////////////////



module cla_dataflow (
    input [3:0]a,
    input [3:0]b,
    input cin,
    output [3:0] s,
    output cout
    
    );
    wire [3:0] p;
    wire [3:0] g;
    wire [3:0] c;
    assign c[0] = cin;
    assign c[1] = g[0] + p[0] & cin;  //g[0] | (p[0] & cin); 
    assign c[2] = g[1] + p[1] & c[1]; //g[1] | (g[0] & p[1]) | (cin & p[0] & p[1]);
    assign c[3] = g[2] + p[2] & c[2]; //g[2] | (g[1] & g[2]) | (g[0] & g[1] & g[2]) | (cin & p[0] & p[1] & p[2]) ;
    assign cout = g[3] + p[3] & c[3]; //g[3] | (g[2] & g[3]) | (g[1] & p[2] & p[3]) | (g[0] & p[1] & p[2] & p[3]) | (cin & p[0] & p[1] & p[2] & p[2]);
    
    fulladder_dataflow #(3,4,1) fad_1(
        .a(a[0]),
        .b(b[0]),
        .cin(c[0]),
        .s(s[0]),
        .p(p[0]),
        .g(g[0])
    );
    
    fulladder_dataflow #(3,4,1) fad_2(
        .a(a[1]),
        .b(b[1]),
        .cin(c[1]),
        .s(s[1]),
        .p(p[1]),
        .g(g[1])
    );
    
    fulladder_dataflow #(3,4,1) fad_3(
        .a(a[2]),
        .b(b[2]),
        .cin(c[2]),
        .s(s[2]),
        .p(p[2]),
        .g(g[2])
    );
    
    fulladder_dataflow #(3,4,1) fad_4(
        .a(a[3]),
        .b(b[3]),
        .cin(c[3]),
        .s(s[3]),
        .p(p[3]),
        .g(g[3])
    );
    
    

endmodule