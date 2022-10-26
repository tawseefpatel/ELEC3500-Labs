`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2022 12:15:55 PM
// Design Name: 
// Module Name: lab2_2_2
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


module two_to_five(
    input [3:0] x,
    output reg [4:0] y
);

always@(*)
begin
    case(x) // case assignment
        4'b0000 : y = 5'b00011 ;
        4'b0001 : y = 5'b00101 ;
        4'b0010 : y = 5'b00110 ;
        4'b0011 : y = 5'b01001 ; 
        4'b0100 : y = 5'b01010 ;
        4'b0101 : y = 5'b01100 ; 
        4'b0110 : y = 5'b10001 ;
        4'b0111 : y = 5'b10010 ; 
        4'b1000 : y = 5'b10100 ;
        4'b1001 : y = 5'b11000 ;
        default : y = 5'000000 ;
    endcase
end

// bitwise assignment 
// y[4] = x > 1'd5;
// y[3] = (x > 2 & x < 6) | x==9 ;
// y[2] = x == 2 | x == 3 | x == 5 | x == 8 ;
// y[1] = x == 0 | x == 2 | x == 4 | x == 7 ;
// y[0] = x == 0 | x == 1 | x == 3 | x == 6 ;

endmodule