`timescale 1ns / 1ps

module clk_div_5mhzto500hz(
    input clk_in,
    input rst,
    input en, 
    output reg clk_out
    );
    reg [23:0] counter;
        
        always @ (posedge rst, posedge clk_in)
        begin
        
            if(rst)
            begin
                clk_out <= 0;
                counter <= 0;
            end
            else
            begin
                counter <= counter + en;
                if(counter == 5000)//5mhz to 500 hz (5 MHz / 2* desired frequency)
                begin
                    counter <= 0;
                    clk_out = ~clk_out;
                end
            end
        end
endmodule

