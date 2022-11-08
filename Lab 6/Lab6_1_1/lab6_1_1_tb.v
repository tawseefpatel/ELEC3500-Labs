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
        load = 0;
        forever #2 load = ~load;
    end
    integer i;
    initial begin
        D = 0;
        for (i=0; i<31; i= i + 1) begin
            #10 
            D = i;
        end

        $finish;
    end
endmodule