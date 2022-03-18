`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2022 01:47:06 AM
// Design Name: 
// Module Name: register_tb
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


module register_tb(
    );
    
    reg clk, rst, load;
    reg [3:0] D;
    wire [3:0] Q;
    
    register DUT(.clk(clk), .rst(rst), .load(load), .D(D), .Q(Q));
    
    initial begin
        clk = 1;
        forever begin
            clk = ~clk;
            #10;
        end
    end
    
    initial begin
        load = 0; rst = 0; D = 4'b0000;
        #20
        
        D = 4'b0101;
        #40
        
        load = 1;
        #20
        
        load = 0; D = 4'b1001;
        #40
        
        load = 1;
        #20
        
        load = 0;
        #15
        
        rst = 1;
        #40
        
        load = 1;
        #20
        
        load = 0;
        #25
        
        rst = 0;
        #40
        
        load = 1;
        #20
        
        $finish;
        
    end
    
endmodule
