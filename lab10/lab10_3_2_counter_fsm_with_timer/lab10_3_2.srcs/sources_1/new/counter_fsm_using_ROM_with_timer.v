`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2022 10:06:41 PM
// Design Name: 
// Module Name: mealy_fsm_using_ROM
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

module timer(
    input clk,
    input rst,
    output one_sec_timer
    );
    
    reg [31:0] one_sec_counter; //count to 100MHz
    //count up number each second
    //clock frequency = 100 MHz
    //time period = 1 s
    //time cycle = 100 MHz / 1 Hz
    parameter max_cnt = 100000000; //100000000 cycles = 100 MHz/1Hz 
    
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

module counter_fsm_using_ROM(
    input clk,
    input rst,
    output reg [2:0] count
    );
    
    parameter S0 = 0;
    reg state, next_state;
    reg [2:0] ROM [5:0];
    integer i;
    
    wire one_sec_timer;
    //timer
    timer timer(.clk(clk), .rst(rst), .one_sec_timer(one_sec_timer));
    
    //initializing ROM
    initial begin
        ROM[0] = 3'b000;
        ROM[1] = 3'b001;
        ROM[2] = 3'b011;
        ROM[3] = 3'b101;
        ROM[4] = 3'b111;
        ROM[5] = 3'b010;
    end
    
    //sequential/combinational block - one state 
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            i = 0;
            count = ROM[i];
        end else begin
            count = ROM[i];   
        
            //update i each one second
            if (one_sec_timer) begin
                if (i < 5 ) begin
                    i = i + 1;
                end else begin
                    i = 0;
                end 
            end  
            
        end
    end          
    
endmodule
