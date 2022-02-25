`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2022 02:41:22 PM
// Design Name: 3-to-1 using 2-to-1 mux
// Module Name: lab1_4_1
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
`include "mux_2_1_behavioral.v"

module mux_3_1(
    input u,
    input v,
    input w,
    input s0,
    input s1,
    output m
    );
    
    wire m1;
    
    mux_2_1_behavioral mux1 ( 
        .x(u),
        .y(v),
        .s(s0),
        .m(m1)
    );   
    
    mux_2_1_behavioral mux2 ( 
        .x(m1),
        .y(w),
        .s(s1),
        .m(m)
    );   
    
    
endmodule
