`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2022 10:13:09 PM
// Design Name: 
// Module Name: D_flipflop_with_ce
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


module D_flipflop_with_ce(
    input clk,
    input rst,
    input ce,
    input D,
    output reg Q
    );
    
    always @(posedge clk) begin
        if (rst) begin
            Q <= 1'b0;
        end else if (ce) begin
            Q <= D;
        end
    end
    
endmodule
