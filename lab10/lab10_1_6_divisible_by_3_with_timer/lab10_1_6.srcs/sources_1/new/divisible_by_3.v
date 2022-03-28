`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2022 09:32:53 PM
// Design Name: 
// Module Name: mealy_fsm
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

module timer (
    input clk,
    input rst,
    output one_sec_timer
    );
    
    //1 second sampler
    reg [31:0] one_sec_counter; //count to 100MHz
    //count up number each second
    //clock frequency = 100 MHz
    //time period = 1 s
    //time cycle = 100 MHz / 1 Hz
    parameter max_cnt = 100000000; //one second 
    
    //timer
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            one_sec_counter <= 0;
        end else begin
            if (one_sec_counter >= max_cnt) begin
                one_sec_counter <= 0;
            end else begin
                one_sec_counter <= one_sec_counter + 1;
            end       
        end
    end
    
    assign one_sec_timer = (one_sec_counter >= max_cnt)? 1: 0;
    
endmodule

module divisible_by_3_with_timer(
    input clk,
    input rst,
    input ain,
    output reg yout,
    output reg [3:0] count,
    output reg [2:0] num_of_ones
    );

    parameter S0 = 1'b0;
    parameter S1 = 1'b1;
    reg state, next_state;
    
    wire one_sec_timer;
    
    //function for calculting the number of 1s
    function [2:0] count_ones;
        input [3:0] count;
        integer i;
        begin
            count_ones = 0;
            for (i=0; i < 4; i=i+1) begin
                if (count[i] == 1'b1) begin
                    count_ones = count_ones + 1;
                end
            end 
        end 
    endfunction

    //timer
    timer timer(.clk(clk), .rst(rst), .one_sec_timer(one_sec_timer));

    //with timer
    //sequential and combinational block - compute output (only one state)
    always @(posedge clk or posedge rst) begin
        if (rst) begin 
            count <= 0;
        end else begin
            num_of_ones <= count_ones(.count(count));
            if (num_of_ones % 3 == 0) begin
                yout <= 1;
            end else begin
                yout <= 0;
            end
                     
            if (ain && one_sec_timer) begin
                count <= count + 1;
            end
            
       end 
    end 
    
endmodule
