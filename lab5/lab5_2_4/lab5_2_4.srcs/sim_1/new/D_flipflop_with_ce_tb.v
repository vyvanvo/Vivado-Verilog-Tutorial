`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2022 10:18:36 PM
// Design Name: 
// Module Name: D_flipflop_with_ce_tb
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


module D_flipflop_with_ce_tb(
    );
    
    reg clk, rst, ce, D;
    wire Q;
    
    D_flipflop_with_ce DUT (.clk(clk), .rst(rst), .ce(ce), .D(D), .Q(Q));
    
    initial begin
        clk = 1;
        forever begin
            clk = ~clk;
            #10;
        end
    end
    
    initial begin
        D = 0; ce = 0; rst = 0;
        #20
        
        D = 1;
        #40
        
        ce = 1;
        #20
        
        ce = 0;
        #20
        
        D = 0;
        #20
        
        rst = 1;
        #20
        
        rst = 0;
        #40
        
        ce = 1;
        #20
        
        ce = 0;
        #20
        
        D = 1;
        #40
        
        ce = 1;
        #20
        
        ce = 0;
        #20
        
        $finish;
    end
    
endmodule
