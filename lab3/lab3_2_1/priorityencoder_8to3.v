`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2022 12:27:18 AM
// Design Name: 8 to 3 priority encoder
// Module Name: priorityencoder_8to3
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


module priorityencoder_8to3(
    input [7:0] x,
    input en_in,
    output reg [2:0] y,
    output reg en_out,
    output reg gs
    );
    
    always@(*) begin
        case(en_in)
            1'b1: begin
                y = 3'b111;
                gs = 1'b1;
                en_out = 1'b1;
            end 
        
            1'b0: begin
                if(x == 8'hFF) begin
                    y = 3'b111;
                    gs = 1'b1;
                    en_out = 1'b0;
                end else if (x[0] == 1'b0) begin
                    y = 3'b000;
                    gs = 1'b0;
                    en_out = 1'b1;
                end else if (x[1:0] == 2'b01) begin
                    y = 3'b001;
                    gs = 1'b0;
                    en_out = 1'b1;
                end else if (x[2:0] == 3'b011) begin
                    y = 3'b010;
                    gs = 1'b0;
                    en_out = 1'b1;
                end else if (x[3:0] == 4'b0111) begin
                    y = 3'b011;
                    gs = 1'b0;
                    en_out = 1'b1;
                end else if (x[4:0] == 5'b01111) begin
                    y = 3'b100;
                    gs = 1'b0;
                    en_out = 1'b1;
                end else if (x[5:0] == 6'b011111) begin
                    y = 3'b101;
                    gs = 1'b0;
                    en_out = 1'b1;
                end else if (x[6:0] == 7'b0111111) begin
                    y = 3'b110;
                    gs = 1'b0;
                    en_out = 1'b1;
                end else if (x[7:0] == 8'b01111111) begin
                    y = 3'b111;
                    gs = 1'b0;
                    en_out = 1'b1;
                end
                    
            end
            
        endcase
    end
    
endmodule
