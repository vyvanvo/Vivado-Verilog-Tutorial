`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2022 06:56:05 PM
// Design Name: 
// Module Name: gated_SR_latch_tb
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


module gated_SR_latch_tb(
    );
    
    reg R, E, S;
    wire Q, Qbar;
    
    gated_SR_latch DUT(.R(R), .E(E), .S(S), .Q(Q), .Qbar(Qbar));
    
    initial begin
        R = 0; S = 0; E = 0;
        #10
        
        S = 1;
        #10
        
        E = 1;
        #10
        
        S = 0;
        #10
        
        R = 1;
        #10
        
        E = 0;
        #10
        
        R = 0; S = 1;
        #10
        
        R = 1; S = 0;
        #10
        
        R = 0; S = 1;
        #10;
        
        E = 1;
        #10
    
        $finish;
    end
endmodule
