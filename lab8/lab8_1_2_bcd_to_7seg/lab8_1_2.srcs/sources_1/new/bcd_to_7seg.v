`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2022 09:33:41 PM
// Design Name: Binary Coded Decimal
// Module Name: lab8_1_2
// Project Name: display two digit bcd on 7 segment
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
    input [3:0] display_num,
    output reg [6:0] seg,
    output reg [3:0] an
    );
    
    reg [3:0] led_bcd;
    wire led_activating_display;
    reg [18:0] counter; //refresh period 
    //internal clock = 100 MHz = 100 * 2^20 Hz
    //pulse every 2.5 ms = 2.5 * 10^-3 -> 1/(2.6*10^-3) = 384.625 Hz
    //time interval = 100*2^20 Hz / 384.625 Hz -> (2.6 ms digit period, each digit is displayed for 2.6  ms)
    
    //timer (refresh rate)
    always @(posedge clk or posedge rst) begin
        if (rst == 1) begin
            counter <= 0;
        end else begin
            counter <= counter + 1; //overflow resets back to 00000...
        end
        //led_output = display_num;
    end
    
    assign led_activating_display = counter[18];
    
    //activating led display
    //getting value at each seg (use only two segments)
    always @(*) begin
        case (led_activating_display)
            1'b0: begin
                an = 4'b1110;
                led_bcd = display_num  % 10;
            end
               
            1'b1: begin
                an = 4'b1101;
                led_bcd = (display_num / 10) % 10;
            end
                    
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
    
    //assign led_output = display_num;
    
endmodule
