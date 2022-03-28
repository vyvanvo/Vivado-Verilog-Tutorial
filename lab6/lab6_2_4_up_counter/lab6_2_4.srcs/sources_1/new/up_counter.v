`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2022 08:03:55 PM
// Design Name: 
// Module Name: up_counter
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


module up_counter(
    input clk,
    input clear,
    input en,
    output [3:0] Q,
    output cnt_done
    );
    
    reg [3:0] count;
    parameter max_cnt = 10;
    
    always @(posedge clk) begin
        if (clear | cnt_done) begin //reset counter to start at beginning
            count <= 4'b0000; //load 10
        end else if (en) begin
            count <= count + 1;
        end
    end
    
    /*always @(*) begin
        max_cnt = 4'b1010;
        if (count == max_cnt) begin
            cnt_done = 1;
        end else begin
            cnt_done = 0;
        end
    end*/

    assign cnt_done = (count >= max_cnt)? 1: 0;
    
    assign Q = count;
endmodule
