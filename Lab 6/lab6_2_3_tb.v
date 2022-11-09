`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2022
// Design Name: 
// Module Name: lab6_2_33_tb
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


module lab6_2_3_tb(
    );

 reg clk;
 reg Load;
 reg Enable;
 reg Clear;
   
 wire [3:0] Q;
   
  
 lab6_2_33 DUT (.Load(Load),.Enable(Enable),.Clear(Clear),.clk(clk),.Q(Q));
   
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
