`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2022 11:56:25 PM
// Design Name: 
// Module Name: bcd_to_7seg_tb
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


module bcd_to_7seg_tb(
    );
    
    reg clk, rst;
    reg [3:0] display_num;
    
    wire [6:0] seg;
    wire [3:0] an;
    
    bcd_to_7seg DUT (.clk(clk), .rst(rst), .display_num(display_num), .seg(seg), .an(an));
    
    initial begin
        clk = 1;
        forever begin
            clk = ~clk;
            #10;
        end
    end
    
    initial begin
        rst = 1; display_num = 4'b1100;
        #10
        
        rst = 0;
        #1000000;
        
        $finish;
    end
    
endmodule
