`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Student: Tawseef Patel 101145333
// 
// Create Date: 1/11/2022 
// Design Name: Lab 6_1_1.v
// Module Name: register_sync_res_load
// Project Name: Lab 6_1_1
//
//////////////////////////////////////////////////////////////////////////////////

module register_sync_res_load (
    input [3:0] D,
    input clk, load, reset,
    output reg [3:0] Q
);
    always @(posedge clk) begin
        if(reset)
            begin
                Q <= 4'b0;
            end 
        else if (load) 
            begin
                Q <= D;
            end
    end
endmodule