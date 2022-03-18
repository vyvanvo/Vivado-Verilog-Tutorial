`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2022 06:32:10 PM
// Design Name: 
// Module Name: modeling_latch_flipflop
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


module modeling_latch_flipflop(
    input clk,
    input D,
    output reg Qa,
    output reg Qb,
    output reg Qc
    );
    
    //Dlatch
    always @ (clk or D) begin
        if (clk) begin
            Qa = D;
        end
    end
    
    //D flip flop (rising edge)
    always @(posedge clk) begin
        if (clk) begin
            Qb <= D;
        end
    end
    
    //D flip flop (falling edge)
    always @(negedge clk) begin
        if (!clk) begin
            Qc <= D;
        end
    end
    
endmodule
