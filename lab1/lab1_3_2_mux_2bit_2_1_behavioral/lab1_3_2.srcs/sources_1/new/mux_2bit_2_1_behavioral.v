`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2022 02:22:52 PM
// Design Name: 2-bit wide 2-to-1 mux using behavioral model
// Module Name: lab1_3_2
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


module mux_2bit_2_1_behavioral(
    input [1:0] x,
    input [1:0] y,
    input s,
    output reg [1:0] m
    );
    
    always @(*) begin
        if (s == 0) begin
            m = x;
        end else begin
            m = y;
        end
      
    end
    
endmodule
