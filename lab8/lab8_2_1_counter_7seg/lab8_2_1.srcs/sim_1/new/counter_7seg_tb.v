`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2022 04:50:02 PM
// Design Name: 
// Module Name: counter_7seg_tb
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


module counter_7seg_tb(
    );
    
    reg clk, rst;
    wire [6:0] seg;
    wire [3:0] an;
    
    counter_7seg DUT(.clk(clk), .rst(rst), .seg(seg), .an(an));
    
    initial begin
        clk = 1;
        forever begin
            clk = ~clk;
            #10;
        end
    end
    
    initial begin
        rst = 1;
        #10
        
        rst = 0;
        #100000;
    end
endmodule
