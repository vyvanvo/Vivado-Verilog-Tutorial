`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2022 08:29:52 PM
// Design Name: 
// Module Name: D_flipflop_with_synch_reset_tb
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


module D_flipflop_with_synch_reset_tb(
    );
    
    reg clk, rst, D;
    wire Q;
    
    D_flipflop_with_synch_reset DUT(.clk(clk), .rst(rst), .D(D), .Q(Q));
    
    initial begin
        clk = 1;
        forever begin
            clk = ~clk;
            #10;  
        end
    end
    
    initial begin
        D = 0; rst = 0;
        #20
        
        D = 1;
        #15
        
        rst = 1;
        #5;
        
        rst = 0;
        #5;
        
        rst = 1;
        #10;
        
        rst = 0;
        #30
        
        D = 0;
        #2
        
        rst = 1;
        #5
        
        rst = 0;
        #8
        
        $finish;
    end
    
endmodule
