`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2022 03:57:22 PM
// Design Name: 
// Module Name: register_with_set
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


module register_with_set(
    input clk,
    input rst,
    input set,
    input load,
    input [3:0] D,
    output reg [3:0] Q
    );
    
    always @(posedge clk) begin
        if (rst) begin
            Q <= 4'b0000;
        end else if (set) begin
            Q <= 4'b1111;
        end else if (load) begin
            Q <= D;
        end
    end
    
endmodule
