`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2022 10:15:30 PM
// Design Name: Decoder (design and implement IC 74138)
// Module Name: decoder_74138
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

module decoder_3to8(
    input [2:0] x,
    output reg [7:0] y
    );
    
    always @(*) begin
        y = 8'h00;
        case (x)
            3'b000: y = 8'h01;
            3'b001: y = 8'h02;
            3'b010: y = 8'h04;
            3'b011: y = 8'h08;
            3'b100: y = 8'h10;
            3'b101: y = 8'h20;
            3'b110: y = 8'h40;
            3'b111: y = 8'h80;
            default: y = 8'h00;
        endcase
        
        y = ~y;
        
    end
    
endmodule

module decoder_74138(
    input g1,
    input g2a_n,
    input g2b_n,
    input [3:0] x,
    output reg [7:0] y
    );
    
    wire [7:0] y_out;
    decoder_3to8 decoder (
        .x(x),
        .y(y_out)
    );
    
    always @(*) begin
        case ({g1, g2a_n, g2b_n})
            3'b100: y = y_out;
            default: y = 8'hFF;
        endcase
    end
    
endmodule
