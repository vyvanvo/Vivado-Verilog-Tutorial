`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2022 08:32:32 PM
// Design Name: 
// Module Name: up_down_counter_fsm_tb
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


module up_down_counter_fsm_tb(
    );
    
    reg clk, rst, up_btn, down_btn;
    wire [6:0] seg;
    wire [3:0] an;
    
    up_down_counter_fsm DUT(.clk(clk), .rst(rst), .up_btn(up_btn), .down_btn(down_btn), .seg(seg), .an(an));
    
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
        #10
        
        //test up btn
        up_btn = 1; down_btn = 0;
        //#20
        #200
        
        up_btn = 0; down_btn = 0;
        //#80
        #800
        
        up_btn = 1; down_btn = 0;
        //#40
        #400
        
        up_btn = 0; down_btn = 0;
        //#80
        #800
        
        up_btn = 1; down_btn = 0;
        //#40
        #400
        
        up_btn = 0; down_btn = 0;
        //#80
        #800
        
        //test down btn
        up_btn = 0; down_btn = 1;
        //#40
        #400
        
        up_btn = 0; down_btn = 0;
        //#80
        #800
        
        up_btn = 0; down_btn = 1;
        //#40
        #400
        
        up_btn = 0; down_btn = 0;
        //#80
        #800
        
        up_btn = 0; down_btn = 1;
        //#40
        #400
        
        up_btn = 0; down_btn = 0;
        //#80
        #800
        
        $finish;
    end
    
endmodule
