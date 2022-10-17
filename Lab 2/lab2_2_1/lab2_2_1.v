`timescale 1ns / 1ps

module lab2_2_1_partA(
    input [3:0] v,
    output z, 
    output [3:0] m
);

z = (v > 1'd9); // 1 if V greater than 9

m = z? v-1'd10:v; // if z=1 -> v-10 ( m goes back to 0000), else m = v

endmodule

