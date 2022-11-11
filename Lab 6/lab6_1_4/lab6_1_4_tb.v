module ParallelIn_left_shift_register_4bit_tb();
    reg Clk;
    reg [3:0] ParallelIn;
    reg load;
    reg ShiftEn;
    reg ShiftIn;
    wire [3:0] RegContent;
    wire ShiftOut;

    ParallelIn_left_shift_register_4bit test1(.Clk(Clk), .ParallelIn(ParallelIn), .load(load), .ShiftIn(ShiftIn), .RegContent(RegContent), .ShiftOut(ShiftOut));

    initial begin
        Clk = 0;
        load = 0;
        ShiftIn = 1;
        ShiftEn = 0;
        ParallelIn = 4'b0000;
        #20 ParallelIn = 4'b0101;
        #40 load = 1;
        #20 load = 0;
        #20 ShiftEn = 1;
        #80 ParallelIn = 4'b1001;
        #20 load = 1;
        #20 load = 0;
        #55 load = 1;
        #20 load = 0;
        #25 ShiftEn = 0;
        #40 load = 1;
        #20 load = 0;
    end

    always #10 Clk = ~Clk;

endmodule