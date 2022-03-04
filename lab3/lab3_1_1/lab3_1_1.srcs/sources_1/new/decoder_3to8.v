`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2022 08:46:59 PM
// Design Name: 3 to 8 Decoder using dataflow
// Module Name: decoder_3to8
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
    end
    
endmodule
