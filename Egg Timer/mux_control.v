`timescale 1ns / 1ps

module mux_display(
    input select,
    
    input [3:0] min1_count,
    input [3:0] min2_count,
    input [3:0] sec1_count,
    input [3:0] sec2_count,
    
    input [3:0] min1_set,
    input [3:0] min2_set,
    input [3:0] sec1_set,
    input [3:0] sec2_set,
    
    output [3:0] min1,
    output [3:0] min2,
    output [3:0] sec1,
    output [3:0] sec2
    );
    
    assign {min2,min1,sec2,sec1} = select?{min2_set,min1_set,sec2_set,sec1_set}:{min2_count,min1_count,sec2_count,sec1_count};
    
endmodule
