`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2022 01:57:48 AM
// Design Name: 
// Module Name: counter_7seg
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


module counter_7seg(
    input clk,
    input rst, //btn
    output reg [6:0] seg,
    output reg [3:0] an
    //output reg [3:0] led_bcd
    );
    
    reg [26:0] one_sec_counter; //count to 100MHz
    //count up number each second
    //clock frequency = 100 MHz
    //time period = 1 s
    //time cycle = 100 MHz / 1 Hz
    wire enable_increment_display_num; // equals to 1 when we have counted 1 second
    parameter max_count = 100 * (2**20); //100 * 2^20 cycles = 1 second, 
    //maximum count = 100 * 2^20 -> count up to max count = 1 second

    reg [19:0] refresh_counter; //2.6 ms digit period for each segment
    wire [1:0] led_activating_seg; //segment that is currently displaying (based on refresh rate)

    reg [14:0] display_num; //number to display on 7 segment
    reg [3:0] led_bcd; //number displayed at each segment
    
    //refresh rate for displaying at each of the 4 segments (2.6 ms per digit)
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            refresh_counter <= 0;
        end else begin
            refresh_counter = refresh_counter + 1;
        end
    end
    
    //display counter, count to 100 * 20^20 = 1 second
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            one_sec_counter <= 0;
        end else begin
            if (one_sec_counter < max_count) begin
                one_sec_counter <= one_sec_counter + 1;
            end else begin
                one_sec_counter <= 0;
            end
        end
    end
    
    assign enable_increment_display_num = (one_sec_counter >= max_count)? 1: 0;
    
    //increment display number per second
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            display_num <= 0;
        end else if (enable_increment_display_num) begin 
            if (display_num < 9999) begin
                display_num <= display_num + 1;
            end else begin
                display_num <= 0;
            end
        end
    end
    
    //led segment to display
    assign led_activating_seg = refresh_counter[19:18];
    
    //display led for each seg
    always @(*) begin
        case (led_activating_seg) 
            2'b00: begin
                an = 4'b1110;
                led_bcd = display_num % 10; 
            end

            2'b01: begin
                an = 4'b1101;
                led_bcd = (display_num / 10) % 10;
            end

            2'b10: begin
                an = 4'b1011;
                led_bcd = (display_num / 100) % 10;
            end

            2'b11: begin
                an = 4'b0111;
                led_bcd = (display_num / 1000);
            end

        endcase 
    end

    //bcd to 7seg decoder
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
