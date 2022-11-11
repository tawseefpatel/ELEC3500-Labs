module counter_8bit_T_Flip_Flop_tb();
    reg Clock;
    reg Clear_n;
    reg Enable;
    wire [7:0] Q;

    counter_8bit_T_Flip_Flop DUT(.Clock(Clock), .Clear_n(Clear_n), .Enable(Enable), .Q(Q));

    initial begin
        Clock = 0;
        Clear_n = 0;
        Enable = 0;

        #20 Enable = 1;
        #20 Clear_n = 1;
        #80 Enable = 0;
        #80 Enable = 1;
    end

    always #5 Clock = ~Clock;

endmodule