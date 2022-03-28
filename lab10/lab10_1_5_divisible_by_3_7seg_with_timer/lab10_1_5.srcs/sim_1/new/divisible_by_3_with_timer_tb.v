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


module divisible_by_3_with_timer_tb(
    );
    
    reg clk, rst, ain;
    wire yout;
    wire [6:0] seg;
    wire [3:0] an;
    //wire [7:0] one_sec_counter;
    //wire one_sec_timer;
    
    divisible_by_3_with_timer DUT(.clk(clk), .rst(rst), .ain(ain), .yout(yout), .seg(seg), .an(an)); 
    
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
        
        #100
        
        /*ain = 0;
        #60
        
        ain = 1;
        #40
        
        ain = 0;
        #20
        
        ain = 1;
        #40
        
        ain = 0;
        #40
        */
       $finish; 
    end
    
endmodule
