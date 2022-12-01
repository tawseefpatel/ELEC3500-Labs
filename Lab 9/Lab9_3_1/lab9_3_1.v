`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Student: Tawseef Patel 101145333
// 
// Create Date: 11/30/2022
// Module Name: lab9_3_1
// Design Name: lab9_3_1.v
// Project Name: Lab9_3_1
//
//////////////////////////////////////////////////////////////////////////////////

module lab9_3_1(
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
    wire[3:0] ones_digit, tens_digit, hundreds_digit, thousands_digit; // outputs from binary counter feed into quad seven seg
    
    quad_sevenseg display(
        .clk(clk_500hz),
        .digit0(ones_digit),
        .digit1(tens_digit),
        .digit2(hundreds_digit),
        .digit3(thousands_digit),
        .cathodes(cathode),
        .anode(anode)
    );
    
    
    wire ones_thresh, tens_thresh, hundreds_thresh, thousands_thresh; //thresholds
    
    // enables
    assign ones_enable = enable & !thousands_thresh;
    assign tens_enable = ones_thresh & ones_enable;
    assign hundreds_enable = ones_thresh & tens_thresh & ones_enable;
    assign thousands_enable = ones_thresh & tens_thresh & hundreds_thresh & ones_enable;
    
    c_counter_binary_0  ones_counter(
        .CLK(clk_10Hz),
        .CE(ones_enable),
        .SCLR(reset),
        .THRESH0(tenths_thresh),
        .Q(ones_digit)
    );
    
    
    c_counter_binary_0  tens_counter(
        .CLK(clk_10Hz),
        .CE(tens_enable),
        .SCLR(reset),
        .THRESH0(tens_thresh),
        .Q(tens_digit)
    );
    
    
    c_counter_binary_0  hundreds_counter(
        .CLK(clk_10Hz),
        .CE(hundreds_enable),
        .SCLR(reset),
        .THRESH0(hundreds_thresh),
        .Q(hundreds_digit)
    );
    
    
    c_counter_binary_0  thousands_counter(
        .CLK(clk_10Hz),
        .CE(thousands_enable),
        .SCLR(reset),
        .THRESH0(thousands_thresh),
        .Q(thousands_digit)
    );
    
    
endmodule
