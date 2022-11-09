`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Student: Tawseef Patel 101145333
// 
// Create Date: 08/11/2022 
// Design Name: Lab 6_2_3
// Module Name: Parallel_in_serial_out_load_enable_behavior
// Project Name: Lab 6_2_3
//
//////////////////////////////////////////////////////////////////////////////////

module lab6_2_3 (
    input Load, Enable, Clear, clk,
    output Q
);
    reg [3:0] count; 
    wire cnt_done; 
        
    assign cnt_done = ~| count; 
    assign Q = count; 
    always @(posedge clk) 
        if (Clear) 
            count <= 0; 
        else if (Enable) 
            if (Load | cnt_done) 
                count <= 4'b1010; // decimal 10 
            else 
                count <= count - 1;
endmodule