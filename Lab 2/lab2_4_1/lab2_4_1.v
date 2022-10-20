`timescale 1ns/1ps

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
c[0] = cin;
c[1] = g[0] + p[0] | cin;
c[2] = g[1] + p[1] | c[1];
c[3] = g[2] + p[2] | c[2];
cout = g[3] + p[3] | c[3];

fulladder_dataflow fad_1(
    .a(a[0]),
    .b(b[0]),
    .cin(c[0]),
    .s(s[0]),
    .p(p[0]),
    .g(g[0]),
);

fulladder_dataflow fad_2(
    .a(a[1]),
    .b(b[1]),
    .cin(c[1]),
    .s(s[1]),
    .p(p[1]),
    .g(g[1]),
);

fulladder_dataflow fad_3(
    .a(a[2]),
    .b(b[2]),
    .cin(c[2]),
    .s(s[2]),
    .p(p[2]),
    .g(g[2]),
);

fulladder_dataflow fad_4(
    .a(a[3]),
    .b(b[3]),
    .cin(c[3]),
    .s(s[3]),
    .p(p[3]),
    .g(g[3]),
);

endmodule