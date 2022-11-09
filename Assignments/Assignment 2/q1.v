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

reg [1:0] current_state, next_state;
parameter S00 = 0, S01 = 1, S10 = 2, S11 = 3;

  always @(current_state or x or y) begin
    case(current_state)
      S01 :                  next_state = S00; 
      
      S00 :   if(!x)         next_state = S10;  
              else           next_state = S00; 
      
      S11 :   if(x & !y)     next_state = S00; 
              else if(!x)    next_state = S01;
              else           next_state = S11; // includes x=1,y=1
      
      S10 :   if(!y)         next_state = S00;  
              else           next_state = S11;
            
      default : next_state = S00;
    endcase 
  end
  
  always @(posedge clk or negedge reset) begin
    if (!reset)
      current_state <= S00;
    else
      current_state <= next_state;
  end
  
  always @(current_state) begin
    case (current_state)
      S00 : z = 0;
      S01 : z = 1;
      S10 : z = 1;
      S11 : z = 0; 

      default : z = 0;
    endcase
  end

endmodule