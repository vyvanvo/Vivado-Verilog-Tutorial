`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2022 05:09:29 PM
// Design Name: 
// Module Name: D_latch_tb
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


module D_latch_tb(
    );
    
    reg D, E;
    wire Q, Qbar;
    
    D_latch DUT(.D(D), .E(E), .Q(Q), .Qbar(Qbar));
    
    initial begin
        D = 0; E = 0;
        #10
        
        D = 1;
        #10;
        
        E = 1;
        #10
        
        D = 0;
        #10;
        
        D = 1;
        #10;
        
        E = 0;
        #10
        
        D = 0;
        #10
        
        D = 1;
        #10
        
        D = 0;
        #10
        
        E = 1;
        #10
        
        D = 1;
        #10
        
        D = 0;
        #40;
        
        $finish;
        
    end
    
endmodule
