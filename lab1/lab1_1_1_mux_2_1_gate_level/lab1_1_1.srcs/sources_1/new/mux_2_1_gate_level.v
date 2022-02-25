`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2022 03:32:58 PM
// Design Name: 2-to-1 multiplexer using gate-level modeling
// Module Name: lab1_1_1
// Project Name: 2-to-1 multiplexer using gate level modeling
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


module mux_2_1_gate_level(
    input x,
    input y,
    input s,
    output m
    );
    
    wire and1;
    wire and2;
    wire nots;
    
    not (nots, s);
    and (and1, x, nots);
    and (and2, y, s);
    or (m, and1, and2); 
    
endmodule
