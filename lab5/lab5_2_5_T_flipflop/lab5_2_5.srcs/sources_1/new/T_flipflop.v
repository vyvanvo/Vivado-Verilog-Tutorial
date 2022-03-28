`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2022 11:10:21 PM
// Design Name: T flip flop
// Module Name: T_flipflop
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


module T_flipflop(
    input clk,
    input rst,
    input T,
    output reg Q
    );
    
    always @(negedge clk) begin
        if (!rst) begin
            Q <= 1'b0;
        end else if (T) begin
            Q <= ~Q;
        end
    end
    
endmodule
