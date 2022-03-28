`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2022 11:15:31 PM
// Design Name: 
// Module Name: counter_fsm_using_ROM_tb
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


module counter_fsm_using_ROM_tb(
    );
    
    reg clk, rst;
    wire [2:0] count;
    
    counter_fsm_using_ROM DUT(.clk(clk), .rst(rst), .count(count));
    
    initial begin
        clk = 1;
        forever begin
            clk = ~clk;
            #10;
        end
    end
    
    initial begin
        rst = 1;
        #10;
        
        rst = 0;
        #10
        
        #100000
        
        $finish;
    end
    
endmodule
