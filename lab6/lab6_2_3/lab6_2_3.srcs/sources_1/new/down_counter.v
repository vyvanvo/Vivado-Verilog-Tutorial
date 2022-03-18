`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2022 08:03:55 PM
// Design Name: 
// Module Name: down_counter
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


module down_counter(
    input clk,
    input load,
    input en,
    output [3:0] Q,
    output reg cnt_done
    );
    
    reg [3:0] count;
    reg cnt_done;
    reg [3:0] cnt_val;
    
    always @(posedge clk) begin
        cnt_val = 4'b1010;
        if (load | cnt_done) begin //reset counter to start at beginning
            count <= cnt_val; //load 10
        end else if (en) begin
            count <= count - 1;
        end
    end
    
    always @(*) begin
        if (count == 0) begin
            cnt_done = 1;
        end else begin
            cnt_done = 0;
        end
    end
    
    assign Q = count;
endmodule
