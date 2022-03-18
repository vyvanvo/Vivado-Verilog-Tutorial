`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2022 06:46:15 PM
// Design Name: 
// Module Name: gated_SR_latch
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


module gated_SR_latch(
    input R,
    input E,
    input S,
    output Q,
    output Qbar
    );
    
    assign #2 Q = ~( (R & E) | Qbar);
    assign #2 Qbar = ~ ( (S & E) | Q); 
    
endmodule
