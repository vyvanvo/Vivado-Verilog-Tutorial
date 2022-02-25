`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2022 02:52:22 AM
// Design Name: 2-bit wide 2-to-1 mux using gate level modeling
// Module Name: lab1_1_2
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


module mux_2bit_2_1_gate_level(
    input [1:0] x,
    input [1:0] y,
    input s,
    output [1:0] m
    );
    
    wire nots;
    wire and1, and2, and3, and4;
    
    not(nots, s);
    
    and(and1, x[0], nots);
    and(and2, y[0], s);
    or (m[0], and1, and2);
    
    and(and3, x[1], nots);
    and(and4, y[1], s);
    or (m[1], and3, and4);
   
endmodule
