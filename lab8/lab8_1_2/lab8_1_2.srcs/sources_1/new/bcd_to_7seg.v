`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2022 09:33:41 PM
// Design Name: Binary Coded Decimal
// Module Name: lab2_2_1
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

module bcd_to_7seg(
    input clk,
    input rst,
    input [3:0] v,
    output z,
    output reg [6:0] seg,
    output reg [3:0] an
    );
    
    reg [3:0] led_bcd;
    reg [1:0] led_activating_display;
    reg [3:0] display_num;
    reg [19:0] counter; //refresh period 10.5 ms (2.6 ms digit period, each digit is displayed for 2.5 ms)
    
    //timer (refresh rate)
    always @(posedge clk or posedge rst) begin
        if (rst == 1) begin
            counter <= 0;
            display_num <= 0;
        end else begin
            display_num <= v; 
        end
    end
    
    //getting value at each lef seg
    always @(*) begin
        
    end
    
    //activating led display
    always @(*) begin
        case (led_activating_display)
            2'b00: an = 4'b1110;
            2'b01: an = 4'b1101;
            2'b10: an = 4'b1011;
            2'b11: an = 4'b0111;
        endcase
    end
    
    //7 seg led bcd decoder
    always @(*) begin
        case(led_bcd)
            4'b0000: seg = 7'b1000000;
            4'b0001: seg = 7'b1111001;
            4'b0010: seg = 7'b0100100;
            4'b0011: seg = 7'b0110000;
            4'b0100: seg = 7'b0011001;
            4'b0101: seg = 7'b0010010;
            4'b0110: seg = 7'b0000010;
            4'b0111: seg = 7'b1111000;
            4'b1000: seg = 7'b0000000;
            4'b1001: seg = 7'b0010000;
        endcase 
    end
    
endmodule
