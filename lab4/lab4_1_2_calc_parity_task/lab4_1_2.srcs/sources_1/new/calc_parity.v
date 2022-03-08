`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/07/2022 07:27:48 PM
// Design Name: Calculate the parity (odd # of 1's= 1, even # of 1's = 0)
// Module Name: calc_even_parity
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


module calc_parity(
    input [7:0] a,
    output reg parity
    );
    
    task calc_parity_task;
        input [7:0] a;
        output parity;
        
        begin
            parity = ^a;
        
        end
    endtask
    
    always @(*) begin
        calc_parity_task(.a(a), .parity(parity));
    end
    
endmodule
