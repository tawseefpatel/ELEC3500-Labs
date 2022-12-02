module mealy_fsm(
    input clk,
    input ain,
    input reset,
    output reg yout,
    output reg [3:0] count = 4'b0000
    );
    
    reg [3:0] state, next_state;
    reg maxCount = 0;
    parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3;
    
    always@ (state or ain or count) begin
        case(state)
            S0 : begin
                 if(ain) begin
                    next_state <= S1;
                 end
                 else next_state <= S0;
                 end
            S1 : begin
                 if(ain) next_state <= S2;
                 else next_state <= S1;
                 end
            S2 : begin
                 if(ain) next_state <= S3;
                 else next_state <= S2;
                 end
            S3 : begin
                 if(ain) next_state <= S1;
                 else next_state <= S3;
                 end
        endcase
    end
    
    always@ (posedge clk or posedge reset) begin
        if(reset) begin
            count <= 4'b0000;
            state <= S0;
            maxCount <= 0;
        end
        else if(count == 4'b1111) begin 
            count <= 4'b0000;
            state <= S0;
            maxCount <= 1;
        end
        else begin
            if(ain) begin
                state <= next_state;
                count <= count + 1;
                maxCount <= 0;
            end
        end
    end
    
    always@ (count) begin
        case(state)
            S0 : if(maxCount) yout <= 1;
                 else yout <= 0;
            S1 : yout <= 0;
            S2 : yout <= 0;
            S3 : if(count == 4'b0000 | count == 4'b0011 | count == 4'b0110 | count == 4'b1001 | count == 4'b1100 | count == 4'b1111 ) yout <= 1;
        endcase
    end
    
endmodule