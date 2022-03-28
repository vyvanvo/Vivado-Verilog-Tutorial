`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2022 09:49:18 PM
// Design Name: 
// Module Name: moore_fsm
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


module moore_fsm(
    input clk,
    input rst,
    input [1:0] ain,
    output reg yout
    );
    
    parameter start = 0;
    parameter S_wait1 = 1, S_wait2 = 8;
    parameter S1_1 = 2, S1_2 = 3;
    parameter S2_1 = 4, S2_2 = 5;
    parameter S3_1 = 6, S3_2 = 7;
     
    reg [3:0] state, next_state;
    
    //sequential block
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= start;
        end else begin
            state <= next_state;
        end
    end
    
    //combinational block - compute output;
    always @(state) begin
        case (state)
            //start: yout = 0;
            S1_2: yout = 0;
            S2_2: yout = 1;
            S3_2: yout = ~yout;
        endcase
    end
    
    //combinational block - compute next_state
    always @(state or ain) begin
        case (state) 
            start: begin
                next_state = S_wait1;
            end
            
            S_wait1: begin
                if (ain == 2'b01) begin
                    next_state = S1_1;
                end else if (ain == 2'b11) begin
                    next_state = S2_1;
                end else if (ain == 2'b10) begin
                    next_state = S3_1;
                end else begin
                    next_state = S_wait1;
                end
            end
            
            S1_1: begin
                if (ain == 2'b00) begin
                    next_state = S1_2;
                end else if (ain == 2'b01) begin
                    next_state = S1_1;    
                end else begin
                    next_state = S_wait2;
                end 
            end
            
            S1_2: begin
                next_state = S_wait1;
            end
            
            S2_1: begin
                if (ain == 2'b00) begin
                    next_state = S2_2;
                end else if (ain == 2'b11) begin
                   next_state = S2_1;     
                end else begin
                    next_state = S_wait2;
                end 
            end
            
            S2_2: begin
                next_state = S_wait1;
            end
            
            S3_1: begin
                if (ain == 2'b00) begin
                    next_state = S3_2;
                end else if (ain == 2'b10) begin
                    next_state = S3_1;
                end else begin
                    next_state = S_wait2;
                end 
            end
            
            S3_2: begin
                next_state = S_wait1;
            end
            
            S_wait2: begin
                if (ain == 2'b00) begin
                    next_state = S_wait1;
                end else begin
                    next_state = S_wait2;
                end
            end
            
        endcase
    end
    
endmodule
