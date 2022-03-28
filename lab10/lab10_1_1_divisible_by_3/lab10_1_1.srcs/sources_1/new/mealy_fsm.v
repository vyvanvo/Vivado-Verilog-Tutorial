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


module mealy_fsm(
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
    
    //function for calculting the number of 1s
    function [2:0] count_ones;
        input [3:0] count;
        integer i;
        begin
            count_ones = 0;
            for (i=0; i < 8; i=i+1) begin
                if (count[i] == 1'b1) begin
                    count_ones = count_ones + 1;
                end
            end 
        end 
    endfunction


    //sequential/combinational block - one state
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 0;
            num_of_ones = count_ones(.count(count));
            if (num_of_ones % 3 == 0) begin
                yout <= 1;
            end else begin
                yout <= 0;
            end
        end else begin
            num_of_ones = count_ones(.count(count));
                if (num_of_ones % 3 == 0) begin
                    yout = 1;
                end else begin
                    yout = 0;
                end
                     
                if (ain) begin
                    count = count + 1;
                end
        end
    end
    
endmodule
