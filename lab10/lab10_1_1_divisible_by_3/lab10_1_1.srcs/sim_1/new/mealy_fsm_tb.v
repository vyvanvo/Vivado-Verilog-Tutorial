`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2022 07:23:12 PM
// Design Name: 
// Module Name: mealy_fsm_tb
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


module mealy_fsm_tb(
    );
    
    reg clk, rst, ain;
    wire yout;
    wire [3:0] count;
    wire [2:0] num_of_ones;
    
    mealy_fsm DUT(.clk(clk), .rst(rst), .ain(ain), .yout(yout), .count(count), .num_of_ones(num_of_ones)); 
    
    initial begin
        clk = 1;
        forever begin
            clk = ~clk;
            #5;
        end
    end
    
    initial begin
        rst = 1; ain = 0;
        #20
        
        rst = 0;
        #40
        
        ain = 1;
        #20
        
        ain = 0;
        #60
        
        ain = 1;
        #40
        
        ain = 0;
        #20
        
        ain = 1;
        #40
        
        ain = 0;
        #40
        
       $finish; 
    end
    
endmodule
