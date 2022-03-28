`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2022 08:25:43 PM
// Design Name: 
// Module Name: up_down_counter_fsm
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
    input [13:0] count,
    output reg [6:0] seg,
    output reg [3:0] an
    );

    //7 seg refresh rate
    //clk frequency = 100 MHz
    //refresh every 2.6 ms -> 100 MHz / (1/2.6 ms) = # of cycles
    reg [19:0] refresh_counter; //refresh each 7seg every 2.6 ms -> 2^18 cycles = 2.6 ms
    //reg [3:0] refresh_counter;
    wire [1:0] led_activating_seg;
    
    reg [3:0] led_bcd; //number displaying at each seg
    
    //counting for refresh rate
    always @(posedge clk or posedge rst) begin
        if (rst) begin 
            refresh_counter <= 0;
        end else begin
            refresh_counter <= refresh_counter + 1;
        end
    end
    
    assign led_activating_seg = refresh_counter[19:18];

    always @(*) begin
        case(led_activating_seg) 
            2'b00: begin
                an = 4'b1110;
                led_bcd = count % 10;
            end
            
            2'b01: begin
                an = 4'b1101;
                led_bcd = (count / 10) % 10;
            end
            
            2'b10: begin
                an = 4'b1011;
                led_bcd = (count / 100) % 10;
            end
            
            2'b11: begin
                an = 4'b0111;
                led_bcd = count / 1000;
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
            default: seg = 7'b1111111;
        endcase 
    end

endmodule

module timer (
    input clk,
    input rst,
    output quarter_sec_timer
    );
    
    //250 ms counter
    reg [31:0] quarter_sec_counter;
    parameter max_cnt = 25000000; //250000000 cycles = 250 ms) (100 MHz / (1/250 ms))
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            quarter_sec_counter <= 0; 
        end else begin
            if (quarter_sec_counter >= max_cnt) begin
                quarter_sec_counter <= 0;
            end else begin
                quarter_sec_counter <= quarter_sec_counter + 1;
            end
        end
    end
    
    assign quarter_sec_timer = (quarter_sec_counter >= max_cnt)? 1: 0;
    
endmodule

module up_down_counter_fsm(
    input clk,
    input rst,
    input up_btn,
    input down_btn,
    output [6:0] seg,
    output [3:0] an
    );
    
    //count
    reg [13:0] num, num_next; //max = 9999
    parameter max_num = 9999;
    
    //state
    reg [1:0] state, next_state;
    parameter start = 0, s_wait = 1;
    parameter up = 2, down = 3;
    
    //250 ms timer
    wire quarter_sec_timer; 
    timer timer (
        .clk(clk), 
        .rst(rst), 
        .quarter_sec_timer(quarter_sec_timer)
        );
    
    //sequential block
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= start;
            num <= 0;
        end else begin
            state <= next_state;
            num <= num_next;
        end
    
    end
    
    //combinational block - output and next_state
    always @(num or state or up_btn or down_btn or quarter_sec_timer) begin //sample every quarter second (250 ms)
        num_next = num;
        case (state) 
            start: begin
                next_state = s_wait;
            end
            
            s_wait: begin
                if(quarter_sec_timer) begin
                    if (up_btn == 1) begin
                        if (num < max_num) begin
                            num_next = num + 1;
                        end 
                    
                        next_state = up;
                    
                    end else if (down_btn == 1) begin
                        if (num > 0) begin
                            num_next = num - 1;
                        end
                    
                        next_state = down;
                    
                    end else begin
                        next_state = s_wait;
                    end
                    
                end else begin
                    next_state = state;
                end
                
            end
            
            up: begin
                if (quarter_sec_timer) begin
                    if(up_btn == 1) begin
                        next_state = up;
                    end else begin
                        next_state = s_wait;
                    end
                    
                end else begin
                    next_state = state;
                end
                
            end
            
            down: begin
                if (quarter_sec_timer) begin
                    if (down_btn == 1) begin
                        next_state = down;
                    end else begin
                        next_state = s_wait;
                    end
                    
                end else begin
                    next_state = state;
    
                end
               
            end
            
            default: begin
                next_state = state;
          
            end
            
        endcase
    end
    
    bcd_to_7seg bcd_to_7seg(
        .clk(clk),
        .rst(rst),
        .count(num),
        .seg(seg),
        .an(an)
    );
    
endmodule
