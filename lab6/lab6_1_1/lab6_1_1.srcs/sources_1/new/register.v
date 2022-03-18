`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2022 12:28:58 AM
// Design Name: 
// Module Name: register
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


module register(
    input clk,
    input rst,
    input load,
    input [3:0] D,
    output reg [3:0] Q
    );
    
    always @(posedge clk) begin
        if (rst) begin
            Q <= 4'b0000;
        end else if (load) begin
            Q <= D;
        end
    end
    
endmodule
