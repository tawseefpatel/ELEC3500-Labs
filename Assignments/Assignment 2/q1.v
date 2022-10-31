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
    output z
);

reg [2:0] current_state, next_state;
// parameter S00 = 0; S10 = 1; S11 = 2; S01 = 3;

  always @(*) begin
    // assuming posedge reset
    if (reset): // if negedge reset: if (!reset)
        next_state = S00
    
    if (clk):
        current_state <= next_state;

    case(current_state)
    S01 : begin z=1; next_state = S00; end
        if (x == 1)
            S00 : begin z=0; next_state = S00; end
            if (y == 1)
                S11 : begin z=0; next_state = S11; end
            else: 
                s11 : begin z=0; next_state = S00; end

        else if (x == 0)
            S00 : begin z=0; next_state = S10; end
            S11 : begin z=0; next_state = S01; end

        else if (y == 0)
            S10 : begin z=1; next_state = S00; end

        else if (y == 1)
            S10 : begin z=1; next_state = S11; end
    endcase 
  end

    // always @(posedge clk ) begin
    //     current_state <= next_state;
    // end

endmodule