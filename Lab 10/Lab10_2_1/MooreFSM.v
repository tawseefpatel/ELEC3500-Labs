`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2022 10:01:14 AM
// Design Name: 
// Module Name: MooreFSM
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


module MooreFSM(
    input [1:0] ain,
    input reset,
    input clk,
    output reg yout
    );
    reg [2:0]state, nextstate;
    parameter S0=0, S1=1, S2=2, S3=3, S4=4, S5=5, S6=6;
    
    
    //reset case
    always @(posedge clk or posedge reset)
    begin
        if (reset)
            state <= S0;
        else    
            state <= nextstate;
    end
    
    //////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////
    //nextstate code
    always @(state or ain) 
    begin
        case(state)
            S0: begin
                if(ain==2'b01) 
                    nextstate = S1; 
                 else if(ain==2'b10) 
                    nextstate = S2;
                 else if(ain==2'b11) 
                    nextstate = S3;
                 else 
                    nextstate = S0;            
             end 
            S1: begin
             if(ain==2'b00) 
                  nextstate = S0; 
             else if(ain==2'b10) 
                 nextstate = S2;
              else if(ain==2'b11) 
                 nextstate = S3;
              else 
                 nextstate = S1;  
            end 
            S2: begin
               if(ain==2'b00) 
                    nextstate = S4; 
                else if(ain==2'b01) 
                   nextstate = S1;
                else if(ain==2'b11) 
                   nextstate = S3;
                else 
                   nextstate = S2;  
            end 
            S3: begin
                 if(ain==2'b00) 
                      nextstate = S5; 
                 else if(ain==2'b01) 
                     nextstate = S1;
                  else if(ain==2'b10) 
                     nextstate = S2;
                  else 
                     nextstate = S3;  
              end  
            S4: begin 
                if(ain==2'b01) 
                    nextstate = S1; 
                else if(ain==2'b11) 
                    nextstate = S3;
                else if(ain==2'b10) 
                    nextstate = S2;
                else 
                    nextstate = S6;         
                 end
            S5: begin 
                if(ain==2'b01) 
                    nextstate = S1; 
                else if(ain==2'b11) 
                    nextstate = S3;
                else if(ain==2'b10) 
                    nextstate = S2;
                else 
                    nextstate = S5;         
                end       
            S6: begin 
                      if(ain==2'b01) 
                          nextstate = S1; 
                      else if(ain==2'b11) 
                          nextstate = S3;
                      else if(ain==2'b10) 
                          nextstate = S2;
                      else 
                          nextstate = S6;         
                      end       
            default: nextstate = S0;
        endcase            
    end  
    
    //////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////
    // output assignments 
    always @(state) 
    begin 
        case(state)
        S0: yout=0;    
        S1: yout=yout;
        S2: yout=yout;
        S3: yout=yout;
        S4: yout=~yout;
        S5: yout=1;
        S6: yout=yout;
        default: yout=0;
        endcase
    end
endmodule