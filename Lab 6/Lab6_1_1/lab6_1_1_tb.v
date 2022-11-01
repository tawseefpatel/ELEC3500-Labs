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
        forever #1 clk = ~clk; // clock generation
    end

    initial begin
        reset = 1'b1;
        #5 reset = 1'b0;
    end

    initial begin
        D = 0; 
        load = 0;

        // set the data word to B and load
        #10 D = 4'b1001;
        $display("Reset = 1: Expected: 0x0000. Recieved: %b", Q);
        #2  load = 1;
        #2  load = 0;
        $display("Reset = 0: Expected: 0x1001. Recieved: %b", Q);

        
        $finish;
    end
endmodule