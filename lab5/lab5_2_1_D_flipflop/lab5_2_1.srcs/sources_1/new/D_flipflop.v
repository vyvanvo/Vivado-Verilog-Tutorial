`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2022 06:00:30 PM
// Design Name: D flip flop (stores value of D on rising clock edge)
// Module Name: D_flipflop
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


module D_flipflop(
    input D,
    input clk,
    output reg Q
    );
    
    always @ (posedge clk) begin
        if (clk) begin
            Q <= D;
        end
    end
    
endmodule
