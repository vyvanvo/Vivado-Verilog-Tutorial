`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2022 06:04:46 PM
// Design Name: 
// Module Name: add_two_values
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


module add_two_values (
        input [3:0] a,
        input [3:0] b,
        output reg cout,
        output reg [3:0] s
    );

    task add_two_values_task;
        input [3:0] a;
        input [3:0] b;
        output cout;
        output [3:0] s;
        
        begin
            {cout, s} = a + b;
        end
        
    endtask
    
    always @(*) begin
        add_two_values_task(a, b, cout, s);
    end
    
endmodule
