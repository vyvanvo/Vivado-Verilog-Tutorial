`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2022 09:32:53 PM
// Design Name: 
// Module Name: mealy_fsm
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

module timer (
    input clk,
    input rst,
    output one_sec_timer
    );
    
    //1 second sampler
    reg [31:0] one_sec_counter; //count to 100MHz
    //count up number each second
    //clock frequency = 100 MHz
    //time period = 1 s
    //time cycle = 100 MHz / 1 Hz
    parameter max_cnt = 100000000; //one second 
    
    //timer
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            one_sec_counter <= 0;
        end else begin
            if (one_sec_counter >= max_cnt) begin
                one_sec_counter <= 0;
            end else begin
                one_sec_counter <= one_sec_counter + 1;
            end       
        end
    end
    
    assign one_sec_timer = (one_sec_counter >= max_cnt)? 1: 0;
    
endmodule

module divisible_by_3_with_timer(
    input clk,
    input rst,
    input ain,
    output reg yout,
    output reg [6:0] seg,
    output reg [3:0] an
    //output reg [7:0] one_sec_counter,
    //output one_sec_timer
    );

    parameter S0 = 1'b0;
    parameter S1 = 1'b1;
    reg state, next_state;
    
    reg [7:0] count;
    reg [3:0] num_of_ones;
    
    //1 second sampler
    wire one_sec_timer;
    
    //7seg
    reg [3:0] led_bcd; // number displayed at each segment
    reg [19:0] refresh_counter;//2.6 ms digit period for each segment
    reg [1:0] led_activiating_seg;
    
    //function for calculting the number of 1s
    function [3:0] count_ones;
        input [7:0] count;
        integer i;
        begin
            count_ones = 0;
            for (i=0; i < 8; i=i+1) begin
                if (count[i] == 1'b1) begin
                    count_ones = count_ones + 1;
                end
            end 
        end 
    endfunction


    //sequential block
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 0;
            num_of_ones = count_ones(.count(count));
            if (num_of_ones % 3 == 0) begin
                yout <= 1;
            end else begin
                yout <= 0;
            end
        end else begin 
            num_of_ones = count_ones(.count(count));
            if (num_of_ones % 3 == 0) begin
                yout <= 1;
            end else begin
                yout <= 0;
            end
            
            if (ain && one_sec_timer) begin
                count <= count + 1;
            end
        end
    end

    //timer
    timer timer(.clk(clk), .rst(rst), .one_sec_timer(one_sec_timer));
    
    //led segment to display
    //refresh rate for displaying at each of the 4 segments (2.6 ms per digit)
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            refresh_counter <= 0;
        end else begin
            refresh_counter <= refresh_counter + 1;
        end
    end
    
    assign led_activating_seg = refresh_counter[19:18];
    
    //display led for each seg
    always @(*) begin
        case (led_activating_seg) 
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
                led_bcd = (count / 1000);
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
