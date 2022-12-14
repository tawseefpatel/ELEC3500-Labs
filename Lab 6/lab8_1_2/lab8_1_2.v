`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2021 09:57:19 PM
// Design Name: 
// Module Name: top
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


module top(
    input wire clk_100MHz, // clock input to DCM
    input wire [3:0] val,
    output wire [6:0] cathodes, // seven segment display cathodes
    output wire [7:0] anodes
    );

// main clock divider from clocking wizard
wire clk_5MHz;
clk_wiz_0 clocky(
    // Clock out ports
    .clk_out1(clk_5MHz),     // output clk_out1
    // Status and control signals
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1(clk_100MHz)
);      // input clk_in1

// divide 5MHz clock down to 500Hz
parameter divisor = 10000;
reg [15:0] count = 0;
reg clk_500Hz = 0;

always @(posedge clk_5MHz) begin
    if (count == 0) begin
        count <= divisor - 1;
        clk_500Hz <= ~clk_500Hz;
    end
    else count <= count - 1;
end

/*  BLOCK DIAGRAM              ############                 Anodes   8
#################     ten      # Mux      #             |------------/-----------------------------------|
# Number Thing  # ------------ # 1 if ten #---          |                                             DISPLAY
#               #              # 0 if not #  |    ##############          ###############                a   .....
#               #  bcd_digit   ############   ----# Kinda-mux  #     4    # BCD-to-7s   #  cathodes    f   b .....
#               # -----/--------------------------# bcd_digit  #-----/----# decoder     # ---/---------  g   .....
#################      4                          # | ten?     #   digit  #             #    7         e   c .....
                                                  ##############          ###############                d   .....
                                                [ this thing is 
                                                 driven by the FSM
                                                 but I don't want to 
                                                 draw that ]
*/

// somewhere for the digit to transfer over
wire [3:0] bcd_digit; // input to the mux
reg [3:0] digit; // input to the decoder
// need to transfer the decoded digit into the logic too now
wire ten;

lab2_2_1_partA numberthing(
    .v (val),
    .z (ten),
    .m (bcd_digit)
);

wire [3:0] decode_digit;
assign decode_digit = digit;
bcdto7segment_dataflow decoder (
    .x (decode_digit),
    .seg (cathodes)
);

// Simple FSM for the anode driver
// state definition
parameter lsd = 8'b1;
parameter msd = 8'b10;

// next state logic, encoded like anodes
reg [7:0] next_state;
reg [7:0] state = lsd;

// next state logic
always @(state, bcd_digit) begin
    case (state)
    // we just want to switch between digits
        lsd: begin
            next_state <= msd;
            digit <= bcd_digit;
        end
        msd: begin
            next_state <= lsd;
            digit <= ten? 4'b1:4'b0; // actual mux
        end
        default: next_state <= 0; // trap broken state
    endcase
end

// change state machine at 500Hz
always @(posedge clk_500Hz) begin
    // advance the state machine
    state <= next_state;
end

// output decoding from state machine
assign anodes = ~state;

endmodule