`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2022 08:04:24 PM
// Design Name: 
// Module Name: down_counter_tb
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


module down_counter_tb(
    );
    
    reg clk, load, en;
    wire cnt_done;
    wire [3:0] Q;
    
    down_counter DUT (.clk(clk), .load(load), .en(en), .Q(Q), .cnt_done(cnt_done));
    
    initial begin
        clk = 1;
        forever begin
            clk = ~clk;
            #10;
        end
    end
    
    initial begin
        en = 0; load = 0;
        #10
        
        en = 1; load = 1;
        #10
        
        load = 0;
        #200
        
        en = 1;
        #100
        
        en = 0;
        #50
        
        load = 1;
        #40
        
        $finish;
        
    end
    
endmodule
