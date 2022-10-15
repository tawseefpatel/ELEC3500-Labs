`timescale 1ns / 1ps

module bcdto7segment_dataflow (
    input [3:0] x,
    output [7:0] an,
    output reg [6:0] seg
);

an = 7'b1111110
seg = 7'b0000000

always@(*):
begin
    case(x)
        4'b0000 : seg = 7'b100 0000;
        4'b0001 : seg = 7'b111 1001;
        4'b0010 : seg = 7'b010 0100;
        4'b0011 : seg = 7'b011 0000;
        4'b0100 : seg = 7'b001 1001;
        4'b0101 : seg = 7'b001 0010;
        4'b0100 : seg = 7'b000 0010;
        4'b0110 : seg = 7'b000 0010;
        4'b0111 : seg = 7'b111 1000;
        4'b1000 : seg = 7'b000 0000;
        4'b1001 : seg = 7'b001 0000;
    endcase 
end

endmodule