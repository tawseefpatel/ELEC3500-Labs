`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Student: Tawseef Patel 101145333
// 
// Create Date: 1/11/2022 
// Design Name: Lab 6_1_1_tb
// Module Name: register_sync_res_load_testbench
// Project Name: Lab 6_1_1
//
//////////////////////////////////////////////////////////////////////////////////


module register_sync_res_load_testbench ();

    reg [3:0] D ;
    reg clk, reset, load;
    wire [3:0] Q;
    
    register_sync_res_load dut1(
        .D(D), 
        .clk(clk),
        .reset(reset),
        .load(load),
        .Q(Q)
    );

    initial begin
        clk = 1'b0;
        forever #1 clk = !clk; // clock generation
    end

    initial begin
        reset = 1'b1;
        #5 reset = 1'b0;
    end

    initial begin
        load = 0;
        forever #2 load = !load;
    end

    initial begin
        D = 0; 
        load = 0;

        // set the data word to B and load
        #10 D = 4'b0001;
        #10 D = 4'b0010;
        #10 D = 4'b0000;
        #10 D = 4'b0001;
        #10 D = 4'b0010;
        #10 D = 4'b0011; 
        #10 D = 4'b0100;
        #10 D = 4'b0101; 
        #10 D = 4'b0110;
        #10 D = 4'b0111;
        #10 D = 4'b1000;
        #10 D = 4'b1001;
        #10 D = 4'b1010;
        #10 D = 4'b1011;
        #10 D = 4'b1100;
        #10 D = 4'b1101;
        #10 D = 4'b1110;
        #10 D = 4'b1111;

        $finish;
    end
endmodule