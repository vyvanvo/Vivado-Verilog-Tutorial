`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/07/2022 08:03:12 PM
// Design Name: Add two 4-bit input values -> 5 bit output sum using function
// Module Name: add_two_values
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


module add_two_values_func(
    input [3:0] a,
    input [3:0] b,
    output reg [4:0] sum
    );
    
    function [4:0] s;
        input [3:0] ain;
        input [3:0] bin;
        
        begin
            s = ain + bin;
        end
    endfunction
    
    always @(*) begin
        sum = s(.ain(a), .bin(b));
    end
endmodule
