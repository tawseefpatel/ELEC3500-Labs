`timescale 1ns / 1ps

module db_pulse(
    input clk, //this clock must be slow enough to allow for button to settle ie few miliseconds
    input rst,
    input press,
    output press_db
    );
    
    reg q1,q2;
    wire valid;

    always@(posedge clk)q1<=press; //2 F-F (double-flopped) to synchronize to clk_5mhz
    always@(posedge clk)q2<=q1;
    assign valid = ~(q1 ^ q2); //XNOR gate to generate 'valid' signal
    assign press_db = valid & q2;
    
endmodule
