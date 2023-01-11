`timescale 1ns / 1ps

module start_FF(
    input start,//debounced start button
    input clk,//5 MHz clk
    input set_time,// if user is setting time, we don't want timer starting
    input rst,//reset
    output reg pulse //hold output high or low, as control signal
    );
    
    always @ (posedge clk)begin
        if (rst) begin //reset the output register
            pulse <= 0;
        end else if(start) begin //toggle start innovation #2, we can start and stop time during countdown without using cooktime swithc
            pulse <= ~pulse;
        end else if (set_time) begin //if user is setting time, don't allow countdown
            pulse <= 0;
        end else begin //keep output value constant so count time module can continue running
            pulse <= pulse;
        end
    end
endmodule
