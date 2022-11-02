`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Student: Tawseef Patel 101145333
// 
// Create Date: 10/31/2022 
// Design Name: Assigment 2 Q1
// Module Name: ass2_q1
// Project Name: Assignment 2
//
//////////////////////////////////////////////////////////////////////////////////

module ass2_q1 (
    input x, y, clk, reset,
    output reg z
);

reg [2:0] current_state, next_state;
parameter S00 = 0, S10 = 1, S11 = 2, S01 = 3;

  always @(current_state or x or y or reset) begin
    // assuming posedge reset
    if (reset) // if negedge reset: if (!reset)
        next_state = S00;

    case(current_state)
      S01 :                   next_state = S00; 
      
      S00 :   if(x)           next_state = S00;  
              else            next_state = S10; 
      
      S11 :   if(x & y)       next_state = S11; 
              else if(x & !y) next_state = S00; 
              else if(!x)     next_state = S01;
      
      S10 :   if(!y)          next_state = S00;  
              else            next_state = S11; 

      default : next_state = S00;
      
    endcase 
  end

  always @(posedge clk) begin
    current_state <= next_state;
  end

  always @(current_state) begin
    case 
      S00 : z = 0;
      S01 : z = 1;
      S10 : z = 1;
      S11 : z = 0; 

      default : z = 0;
    endcase
  end

endmodule