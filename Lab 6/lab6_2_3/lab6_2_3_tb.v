`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Student: Tawseef Patel 101145333
// 
// Create Date: 08/11/2022 
// Design Name: Lab 6_1_3
// Module Name: lab6_2_3_tb
// Project Name: Lab 6_1_3
//
//////////////////////////////////////////////////////////////////////////////////

module lab6_2_3_tb(
    );

 reg clk;
 reg Load;
 reg Enable;
 reg Clear;
   
 wire [3:0] Q;
   
  
 lab6_2_3 DUT (.Load(Load),.Enable(Enable),.Clear(Clear),.clk(clk),.Q(Q));
   
    initial 
    begin
         clk = 1'b0;
         Load = 1'b0;
         #80;
         Load = 1'b1;
         #10;
         Load = 1'b0;
     end
   
   initial 
   begin
       Enable = 1'b0;
       #20;
       Enable = 1'b1;
       #150;
       Enable = 1'b0;
       #40;
       Enable = 1'b1;
   end
   
   initial 
   begin
       Clear = 1'b0;
       #40;
       Clear = 1'b1;
       #20;
       Clear = 1'b0;
   end
   
   always #5 clk = ~clk;        
    
endmodule