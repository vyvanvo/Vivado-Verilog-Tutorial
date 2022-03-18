`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2022 12:49:11 AM
// Design Name: 
// Module Name: fun_with_tb
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


module fun_with_tb(
    );
    
    reg a, g1, g2;
    
    initial begin
        a = 0; g1 = 0; g2 = 1; 
        #40
        
        a = 1;
        #20
        
        g1 = 1;
        #20
        
        g2 = 0;
        #20
        
        a = 0;
        #20
        
        g1 = 0;
        #20
        
        g2 = 1;
        #10;
        
        $finish;
    end
 
endmodule
