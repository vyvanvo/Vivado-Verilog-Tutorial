`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2022 01:14:05 AM
// Design Name: 
// Module Name: SR_latch_tb
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


module SR_latch_tb(
    );
    
    reg S, R;
    wire Q, Qbar;
    
    SR_latch_gate DUT(.R(R), .S(S), .Q(Q), .Qbar(Qbar));
    
    initial begin
        R = 0; S = 0;
        #10
        
        S = 1;
        #10
        
        S = 0;
        #10
        
        R = 1;
        #10
        
        R = 0; S = 1;
        #10
        
        R = 1; S = 0;
        #10
        
        R = 0; S = 1;
        #10
        
        R = 1; S = 0;
        #10
        
        S = 1;
        #20;
        
        $finish;
    end
    
endmodule
