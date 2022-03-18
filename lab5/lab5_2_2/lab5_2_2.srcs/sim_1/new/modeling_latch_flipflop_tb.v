`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2022 06:36:45 PM
// Design Name: 
// Module Name: modeling_latch_flipflop_tb
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


module modeling_latch_flipflop_tb(
    );
    
    reg clk, D;
    wire Qa, Qb, Qc;
    
    modeling_latch_flipflop DUT(.clk(clk), .D(D), .Qa(Qa), .Qb(Qb), .Qc(Qc));
    
    initial begin
        clk = 1;
        forever begin
            clk = ~clk;
            #30;
        end
    end
    
    initial begin
        D = 0; 
        #25
        
        D = 1;
        #10
        
        D = 0;
        #5
        
        D = 1;
        #10
        
        D = 0;
        #15
        
        D = 1;
        #10;
        
        D = 0;
        #5;
        
        D = 1;
        #5
        
        D = 0;
        #10
        
        D = 1;
        #5
        
        D = 0;
        #5
        
        D = 1;
        #20
        
        D = 0;
        #20
        
        $finish;
    end
    
endmodule
