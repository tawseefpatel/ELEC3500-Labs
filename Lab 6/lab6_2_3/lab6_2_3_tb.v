module downCounter_4bit_tb();
    reg Clock;
    reg Clear;
    reg Enable;
    reg Load;
    wire [3:0] Q;

    downCounter_4bit DUT(.Clock(Clock), .Clear(Clear), .Enable(Enable), .Load(Load), .Q(Q));

    initial begin
        Clock = 0;
        Clear = 0;
        Enable = 0;
        Load = 0;

        #20 Enable = 1;
        #20 Clear = 1;
        #20 Clear = 0;
        #20 Load = 1;
        #10 Load = 0;
        #80 Enable = 0;
        #40 Enable = 1;
    end

    always #5 Clock = ~Clock;

endmodule