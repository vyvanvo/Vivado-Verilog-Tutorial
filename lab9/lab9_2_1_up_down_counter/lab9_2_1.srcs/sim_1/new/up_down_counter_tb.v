`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2022 05:51:48 PM
// Design Name: 
// Module Name: up_down_counter_tb
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


module up_down_counter_tb(
    );
    
    reg clk, rst, up_down, en, load, clr;
    wire [7:0] counter;
    wire cnt_up_done, cnt_down_done;
    
    up_down_counter DUT(.clk(clk), .rst(rst), .up_down(up_down), .en(en), .load(load), .clr(clr), .counter(counter), .cnt_down_done(cnt_down_done), .cnt_up_done(cnt_up_done));
    
    initial begin
        forever begin
            clk = 1;
            forever begin
                clk = ~clk;
                #10;
            end
        end
    end
    
    initial begin
        rst = 1; //rst counter to 0
        #10
        
        rst = 0; en = 1; // enable counter
        
        //test down counter
        up_down = 0;
        load = 1; //load max count
        clr = 0;
        #10
        load = 0;
        
        #10000000
        
        //test up counter
        up_down = 1;
        load = 0; //load max count
        clr = 1;
        #10000000
        
        $finish;
    end
    
endmodule
