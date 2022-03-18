`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2022 06:01:25 PM
// Design Name: 
// Module Name: D_flipflop_tb
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


module D_flipflop_tb(
    );
    
    reg clk, D;
    wire Q;
    
    D_flipflop DUT(.D(D), .clk(clk), .Q(Q));
    
    initial begin
        clk = 1; 
        forever begin
            clk = ~clk; 
            #10;
        end    
    end
    
    initial begin
        D = 0; 
        #30
        
        D = 1;
        #30
        
        D = 0;
        #40
        
        D = 1;
        #20
        
        D = 0; 
        #30
        
        $finish;
    end
    
endmodule
