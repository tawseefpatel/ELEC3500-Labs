`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Student: Tawseef Patel 101145333
// 
// Create Date: 11/30/2022
// Module Name: clock_divider
// Design Name: clock_divider.v
// Project Name: Lab9_3_1
//
//////////////////////////////////////////////////////////////////////////////////


module clock_divider(
    input clk_in, reset,
    input [22:0] divisor,
    output reg clk_out
    );

reg [22:0] count = 0;

always @( posedge clk_in, posedge reset ) begin

    if (reset) begin
        count <= divisor;
        clk_out <= 0;
    end

    else begin// not resetting
        if ( count == 0 ) begin
            // terminal count reached
            count <= divisor;
            clk_out <= ~clk_out;
        end
        else begin
            // normal decrement
            count <= count - 1;
        end
    end
    
end

endmodule