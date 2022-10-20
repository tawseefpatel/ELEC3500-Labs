`timescale 1ns/1ps


module fulladder_dataflow(
    input a, b, cin,
    output s, p, g
);

s = ^{a, b, cin};
p = a + b;
g = a | b; 
    
endmodule