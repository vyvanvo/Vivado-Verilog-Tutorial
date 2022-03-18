`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2022 04:29:17 PM
// Design Name: 
// Module Name: shift_register_1bit_delay_tb
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


module shift_register_1bit_delay_tb(
    );
    
    reg clk, shiftin;
    wire shiftout;
    
    shift_register_delay DUT (.clk(clk), .shiftin(shiftin), .shiftout(shiftout));
    
    initial begin
        clk = 1;
        forever begin
            clk = ~clk;
            #10;
        end
    end
    
    initial begin
        shiftin = 0;
        #20
        
        shiftin = 1;
        #40
        
        shiftin = 0;
        #20
        
        shiftin = 1;
        #20
        
        shiftin = 0;
        #80
        
        $finish;
    end
endmodule
