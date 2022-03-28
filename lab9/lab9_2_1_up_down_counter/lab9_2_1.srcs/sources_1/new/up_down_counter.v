`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2022 02:29:02 AM
// Design Name: 
// Module Name: up_down_counter
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

module up_down_counter(
    input clk,
    input rst,
    input up_down, //up = 1, down = 0
    input en,
    input load,
    input clr,
    output reg [7:0] counter,
    output cnt_down_done,
    output cnt_up_done
    );

    parameter max_cnt = 100;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 0;
        end else if (en) begin
            if (up_down) begin // up counter
                if (clr | cnt_up_done) begin
                    counter <= 0;
                end else begin 
                    counter <= counter + 1;
                end 
            end else begin // down counter
                if (load | cnt_down_done) begin
                    counter <= max_cnt;
                end else begin
                    counter <= counter - 1;
                end
            end
        
        end

    end
       
    assign cnt_up_done = (counter >= max_cnt)? 1: 0;
    assign cnt_down_done = (counter <= 0)? 1: 0;

endmodule