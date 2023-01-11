`timescale 1ns / 1ps

module master_control(
    input clk, //100 MHz board clock
    input min, // BTNU minutes input
    input sec, // BTND seconds input
    input start, // BTNR start input
    input rst, // SW15 reset input
    input set_time, // BTNL since we can't hold down button
    input count_enable,//SW0 enable counter
    input up_down,// innovation #1 SW2 Up-down set time function
    output enabled,// Lights up when SW0 on
    output t_on,// Lights up when counter is counting and active, turns off when done
    output reg [6:0] seg,// 7 segment output
    output reg [7:0] an,// anode for 7 segment displays
    output led0,led1
    );
    
    //wires to carry intermediary signals
    
    wire [3:0] int_min1;
    wire [3:0] int_min2;
    wire [3:0] int_sec1;
    wire [3:0] int_sec2;
    
    wire [3:0] cnt_min1;
    wire [3:0] cnt_min2;
    wire [3:0] cnt_sec1;
    wire [3:0] cnt_sec2;
    
    wire [3:0] m1,m2,s1,s2;
    
    wire [6:0] seg_out1,seg_out2,seg_out3,seg_out4;
    
    wire count_done;
    //Signify if counter is at 00:00
    reg stop;
    //Signify wether to display counter time or cook time
    reg count_or_cook;
    
    wire db_min;
    wire db_sec;
    
    
    wire clk_5mhz, clk_1hz, clk_500hz, clk_100hz;
    //IP generated clock wizard, 10 MHz clock down to 5 MHz
    clk_wiz_0 wiz1(.clk_out1(clk_5mhz),.clk_in1(clk));
    
    //clock divider modules, 5 MHz -> 1 Hz (counter) and 500 Hz (display refresh)
    clk_div_5mhzto1hz div1(.clk_in(clk_5mhz),.rst(rst),.en(1),.clk_out(clk_1hz));
    clk_div_5mhzto500hz div2(.clk_in(clk_5mhz),.rst(rst),.en(1),.clk_out(clk_500hz));
    clk_div_5mhzto100hz div3(.clk_in(clk_5mhz),.rst(rst),.en(1),.clk_out(clk_100hz));
    
    //Button pulse generator, so numbers don't go crazy
    db_pulse deb1(.clk(clk_5mhz),.rst(rst),.press(sec),.press_db(db_sec));
    db_pulse deb2(.clk(clk_5mhz),.rst(rst),.press(min),.press_db(db_min));
    db_pulse deb3(.clk(clk_5mhz),.rst(rst),.press(start),.press_db(p_start));
    
    assign led0 = db_sec;
    assign led1 = db_min;
    
    //cook time module
    cook_time ct1(.clk(clk_100hz),.enable(set_time),.rst(rst),
                  .inc_sec(db_sec),.inc_min(db_min),.up_down(up_down),
                  .sec_out1(int_sec1),.min_out1(int_min1),.sec_out2(int_sec2),.min_out2(int_min2));
    
    //count time module              
    count_time count1(.sec_in1(int_sec1),.min_in1(int_min1),.sec_in2(int_sec2),.min_in2(int_min2),
                      .clk_1hz(clk_1hz),.enable(count_enable),
                      .start_pulse(start_pulse),.set_time(set_time),.rst(rst),
                      .sec_out1(cnt_sec1),.min_out1(cnt_min1),.sec_out2(cnt_sec2),.min_out2(cnt_min2),
                      .count_done(count_done));
    
    //converts start button into a flopped signal, ie stays high until button pressed again
    start_FF thing(.start(p_start),.clk(clk_5mhz),.set_time(set_time),.rst(rst),.pulse(start_pulse));
    
    //timer on module for blinking light
    timer_on ton(.clk(clk_1hz),.enable(start_pulse),.timer_on(t_on),.stop(count_done));
    
    //enabled LED on when count is enabled
    assign enabled = count_enable;
    
    //logic to decide what numbers to output from MUX
    always @ (posedge clk_5mhz) begin
        if ( set_time | ~count_enable) begin
            count_or_cook <= 1;
        end else if ( ~set_time | count_enable) begin
            count_or_cook <= 0;
        end else begin
            count_or_cook <= count_or_cook;
        end   
    end
    
    mux_display mux1(.select(count_or_cook),
                .min1_count(cnt_min1),.min2_count(cnt_min2),.sec1_count(cnt_sec1),.sec2_count(cnt_sec2),
                .min1_set(int_min1),.min2_set(int_min2),.sec1_set(int_sec1),.sec2_set(int_sec2),
                .min1(m1),.min2(m2),.sec1(s1),.sec2(s2));
    
    //display logic 
    reg [3:0] count;          
    always @(posedge clk_500hz or posedge rst) begin
       if (rst) begin
           count <= 3'b000;
           seg <= 0;
           an <= 8'b11111111;
       end else begin
           case(count)
               3'b000:begin
                   seg <= seg_out1;
                   an <= 8'b11111110;
                   count <= count + 1;
               end
               3'b001:begin
                   seg <= seg_out2;
                   an <= 8'b11111101;
                   count <= count + 1;
               end
               3'b010:begin
                   seg <= seg_out3;
                   an <= 8'b11111011;
                   count <= count + 1;
               end
               3'b011:begin
                   seg <= seg_out4;
                   an <= 8'b11110111;
                   count <= count + 1;
               end
               3'b100:begin
                    an <= 8'b11111111;
                    count <= count + 1;
                end
                3'b101:begin
                    an <= 8'b11111111;
                    count <= count + 1;
                end
                3'b110:begin
                    an <= 8'b11111111;
                    count <= count + 1;
                end
                3'b111:begin
                    an <= 8'b11111111;
                    count <= 3'b000;
                end
                default:begin
                    count <= 3'b000;
                end
           endcase
       end
    end 
    
    bcdto7seg d1(.x(s1),.seg(seg_out1));
    bcdto7seg d2(.x(s2),.seg(seg_out2));
    bcdto7seg d3(.x(m1),.seg(seg_out3));
    bcdto7seg d4(.x(m2),.seg(seg_out4));
       
endmodule
