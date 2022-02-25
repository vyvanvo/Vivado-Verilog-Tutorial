`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2022 01:30:06 PM
// Design Name: 2-bit wide 2-to-1 mux using dataflow modeling
// Module Name: lab1_2_2
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


module mux_2bit_2_1_dataflow(
    input [1:0] x,
    input [1:0] y,
    input s,
    output [1:0] m
    );
    
    assign #3 m[0] = (~s & x[0]) | (s & y[0]);
    assign #3 m[1] = (~s & x[1]) | (s & y[1]);
    
endmodule
