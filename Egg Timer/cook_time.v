`timescale 1ns / 1ps

module cook_time(
    input clk,//5 MHz clk
    input enable,//enable
    input rst,//reset
    input inc_sec,//debounced button pulse
    input inc_min,//debounced button pulse
    input up_down,//Innovation #1, increment or decrement numbers
    output reg [3:0] sec_out1,//Binary number outputs
    output reg [3:0] min_out1,
    output reg [3:0] sec_out2,
    output reg [3:0] min_out2
    );
    
    always @ (posedge clk)begin
        if (rst) begin//syncrhonous reset
            sec_out1 <= 0;
            sec_out2 <= 0;
            min_out1 <= 0;
            min_out2 <= 0;
       
        end else if (inc_sec && enable && up_down) begin //decrease seconds
           sec_out1 <= sec_out1 - 1;
           if (sec_out1 <= 0) begin
               sec_out1 <= 9;
               sec_out2 <= sec_out2 - 1;
               if(sec_out2 <= 0) begin
                   sec_out2 <= 5;
               end
           end 
                   
       end else if (inc_min && enable && up_down) begin //decrease minutes
           min_out1 <= min_out1 - 1;
           if (min_out1 <= 0) begin
               min_out1 <= 9;
               min_out2 <= min_out2 - 1;
               if(min_out2 <= 0) begin
                   min_out2 <= 5;
               end
           end            
        
        end else if (inc_sec && enable) begin //increase seconds
            sec_out1 <= sec_out1 + 1;
            if (sec_out1 >= 9) begin
                sec_out1 <= 0;
                sec_out2 <= sec_out2 + 1;
                if(sec_out2 >= 5) begin
                    sec_out2 <= 0;
                end
            end 
            
        end else if (inc_min && enable) begin //increase minutes
            min_out1 <= min_out1 + 1;
            if (min_out1 >= 9) begin
                min_out1 <= 0;
                min_out2 <= min_out2 + 1;
                if(min_out2 >= 5) begin
                    min_out2 <= 0;
                end
            end 
            
        end else begin
           sec_out1 <= sec_out1;
           sec_out2 <= sec_out2;
           min_out1 <= min_out1;
           min_out2 <= min_out2;
        end
    end
    
endmodule