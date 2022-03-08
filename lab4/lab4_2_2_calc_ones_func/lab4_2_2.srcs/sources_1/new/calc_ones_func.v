`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/07/2022 08:59:06 PM
// Design Name: 
// Module Name: calc_ones_func
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


module calc_ones_func(
    input [7:0] a,
    output reg [3:0] count
    );
    
    function [4:0] c;
        input [7:0] ain;
        integer i;
        begin
            c = 0;
            for (i=0; i < 8; i=i+1) begin
                if (ain[i] == 1'b1) begin
                    c = c+1;
                end
            end 
        end 
    endfunction
    
    always @(*) begin
        count = c(.ain(a));
    end
    
endmodule
