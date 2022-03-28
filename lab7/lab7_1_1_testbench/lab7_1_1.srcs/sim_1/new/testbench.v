`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2022 12:08:29 AM
// Design Name: 
// Module Name: testbench
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


/*module testbench(
    );
    
    reg [7:0] port_a;
    
    initial begin
        port_a = 8'h20;
        #5
        
        port_a = 8'hf2;
        #5
        
        port_a = 8'h41;
        #5
        
        port_a = 8'h0a;
        #5
        
        $finish;
    end
    
endmodule
*/

module testbench(
    );
    
    reg stream;
    
    initial begin
        stream <= #10 0;
        stream <= #12 1;
        stream <= #17 0;
        stream <= #20 1;
        stream <= #24 0;
        stream <= #26 1;
        stream <= #31 0;
        
        #50;
        
        $finish;
    end
    
endmodule
