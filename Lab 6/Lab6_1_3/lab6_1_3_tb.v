
module shiftRegister_1bit_3delayLine_tb();
    reg Clk;
    reg ShiftIn;
    wire ShiftOut;

    shiftRegister_1bit_3delayLine test1(.Clk(Clk), .ShiftIn(ShiftIn), .ShiftOut(ShiftOut));

    initial begin
        Clk = 0;
        ShiftIn = 0;

        #20 ShiftIn = 1;
        #40 ShiftIn = 0;
        #20 ShiftIn = 1;
        #40 ShiftIn = 0;
        //#80;
    end

    always #10 Clk = ~Clk;

endmodule