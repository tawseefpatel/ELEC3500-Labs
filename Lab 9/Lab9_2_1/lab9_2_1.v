`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2022 03:27:07 PM
// Design Name: 
// Module Name: lab9_2_1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

(* use_dsp48 = "no" *)
module lab9_2_1(
    input clk_100MHz, reset, enable, up,
    output wire [7:0] count
    );
    
    wire clk_1Hz;
    wire clk_5MHz;
    // clocking wizard DCM
    clk_wiz_0 clockgen_5MHz(
        // Clock out ports
        .clk_out1 (clk_5MHz),     // output clk_5MHz
        // Status and control signals
        .locked(locked),       // output locked
       // Clock in ports
        .clk_in1(clk_100MHz)
    );      // input clk_100MHz
    
    
    clock_divider one_sec_clock (
        .clk_in(clk_5MHz),
        .reset(reset),
        .divisor(5000000),
        .clk_out(clk_1Hz)
    );
    
    up_down_counter counter(
        .clk(clk_1Hz), 
        .reset(reset),
        .enable(enable),
        .up(up),
        .count(count)
    );
    
    
endmodule
