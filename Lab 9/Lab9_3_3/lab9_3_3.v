`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Student: Tawseef Patel 101145333
// 
// Create Date: 11/30/2022
// Module Name: lab9_3_3
// Design Name: lab9_3_3.v
// Project Name: Lab9_3_3
//
//////////////////////////////////////////////////////////////////////////////////

module lab9_3_3(
    input wire clk_100MHz, reset, enable,
    output [6:0] cathode,
    output [7:0] anode
    );
    
    wire clk_5MHz;
    wire clk_10Hz; // for counter 
    wire clk_500Hz; // for display
    
    clk_wiz_0 fiveMHZ_clk(
        .clk_in1 (clk_100MHz),
        .clk_out1 (clk_5MHz),
        .locked (locked)
    );
    
    clock_divider tenHZ_clk (
        .clk_in(clk_5MHz), 
        .reset(reset),
        .divisor(500000),
        .clk_out(clk_10Hz)
    );
    
    clock_divider five00HZ_clk (
        .clk_in(clk_5MHz), 
        .reset(reset),
        .divisor(10000),
        .clk_out(clk_500Hz)
    );
    
    // outputs from binary counter feed into quad seven seg
    wire[3:0] ones_digit, tens_digit, hundreds_digit, thousands_digit; 
    
    quad_sevenseg display(
        .clk(clk_500hz),
        .digit0(ones_digit),
        .digit1(tens_digit),
        .digit2(hundreds_digit),
        .digit3(thousands_digit),
        .cathodes(cathode),
        .anode(anode)
    );
    
    // thresholds
    wire ones_thresh, tens_thresh, hundreds_thresh, thousands_thresh;

    // clears 
    assign ones_clear = ones_thresh | reset;
    assign tens_clean = (ones_thresh & tens_thresh) | reset;
    assign hundreds_clear = (ones_thresh & tens_thresh & hundreds_thresh) | reset;
    assign thousands_clear = (ones_thresh & tens_thresh & hundreds_thresh & thousands_thresh) | reset

    c_counter_binary_0  ones_counter(
        .CLK(clk_10Hz),
        .CE(enable),
        .SCLR(ones_clear),
        .THRESH0(ones_thresh),
        .Q(ones_digit)
    );
    
    
    c_counter_binary_0  tens_counter(
        .CLK(clk_10Hz),
        .CE(enable),
        .SCLR(tens_clean),
        .THRESH0(tens_thresh),
        .Q(tens_digit)
    );
    
    
    c_counter_binary_0  hundreds_counter(
        .CLK(clk_10Hz),
        .CE(enable),
        .SCLR(hundreds_clear),
        .THRESH0(hundreds_thresh),
        .Q(hundreds_digit)
    );
    
    
    c_counter_binary_0  thousands_counter(
        .CLK(clk_10Hz),
        .CE(enable),
        .SCLR(thousands_clear),
        .THRESH0(thousands_thresh),
        .Q(thousands_digit)
    );
    
    
endmodule
