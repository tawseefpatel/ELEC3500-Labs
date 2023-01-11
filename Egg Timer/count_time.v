`timescale 1ns / 1ps

module count_time(
    input [3:0] sec_in1, //load value inputs
    input [3:0] min_in1,
    input [3:0] sec_in2,
    input [3:0] min_in2,
    //input clk,
    input clk_1hz,
    input enable,//enable
    input start_pulse,//start pulse
    input set_time,//load active
    input rst,//reset
    output reg [3:0] sec_out1,//segment ouputs
    output reg [3:0] min_out1,
    output reg [3:0] sec_out2,
    output reg [3:0] min_out2,
    output reg count_done //count done signal
    );

always @ (posedge rst or posedge clk_1hz)begin //posedge clk or or posedge start_pulse
    if (rst) begin//async reset
        count_done <= 1;
        sec_out1 <= 0;
        sec_out2 <= 0;
        min_out1 <= 0;
        min_out2 <= 0;
        
    end else if(set_time)begin//if load is active, we load output registers with input values
        count_done <= 0;
        sec_out1 <= sec_in1;
        sec_out2 <= sec_in2;
        min_out1 <= min_in1;
        min_out2 <= min_in2;
        
    end else if (min_out2 == 0 && min_out1 == 0 && sec_out2 == 0 && sec_out1 ==0) begin
        count_done <= 1;//if the count is done or reset, we signal master controller
        sec_out1 <= 0;
        sec_out2 <= 0;
        min_out1 <= 0;
        min_out2 <= 0;
        
    end else if(enable && start_pulse && clk_1hz)begin //else we countdown until 0
        sec_out1 <= sec_out1 - 1;
        if (sec_out1 < 1) begin
            sec_out2 <= sec_out2 - 1;
            sec_out1 <= 9;
            if (sec_out2 < 1) begin
                min_out1 <= min_out1 - 1;
                sec_out2 <= 5;
                if (min_out1 < 1) begin
                    min_out2 <= min_out2 - 1;
                    min_out1 <= 9;
                    if (min_out2 < 1) begin
                        min_out2 <= 0;
                    end
                end 
            end
        end
    end 
//    else begin
//        sec_out1 <= sec_out1;
//        sec_out2 <= sec_out2;
//        min_out1 <= min_out1;
//        min_out2 <= min_out2;
//    end
end
    
endmodule
