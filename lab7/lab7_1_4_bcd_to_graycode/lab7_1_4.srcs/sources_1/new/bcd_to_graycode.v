`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2022 02:34:51 AM
// Design Name: 
// Module Name: bcd_to_graycode
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


module bcd_to_gray_code(
    input [3:0] bcd,
    input en,
    output reg [3:0] gray_code,
    output reg led_en
    );
    
    integer i;
    always @(*) begin
        if (en) begin
            led_en = 1;
            gray_code = 4'b1111;
        end else begin
            led_en  = 0;
            gray_code[3] = bcd[3];
            
            for (i = 3; i > 0; i=i-1) begin
                if (bcd[i] == bcd [i-1]) begin
                    gray_code[i-1] = 0;
                end else begin
                    gray_code[i-1] = 1;
                end
            end
            
        end
    end
    
endmodule
