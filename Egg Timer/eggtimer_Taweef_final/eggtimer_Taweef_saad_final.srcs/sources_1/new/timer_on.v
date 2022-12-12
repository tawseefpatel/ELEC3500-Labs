`timescale 1ns / 1ps

module timer_on(
    input clk,
    input enable,
    input stop,
    output reg timer_on
);

always @ (posedge clk) begin
    if(stop)begin
        timer_on <= 0;
    end else if(enable) begin
        timer_on <= ~timer_on;
    end else begin
        timer_on <= 0;
    end
end
endmodule