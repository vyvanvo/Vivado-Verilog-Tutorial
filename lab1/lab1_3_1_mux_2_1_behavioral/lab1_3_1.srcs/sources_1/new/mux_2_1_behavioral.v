`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2022 02:02:03 PM
// Design Name: 2-to-1 mux using behavioral modeling
// Module Name: lab1_3_1
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


module mux_2_1_behavioral(
    input x,
    input y,
    input s,
    output reg m
    );
    
    always @(*) begin
        if (s == 0) begin
            m = x;
        end else begin
            m = y;
        end
    end
        
endmodule




