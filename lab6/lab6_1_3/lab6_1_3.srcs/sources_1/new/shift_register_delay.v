`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2022 04:28:13 PM
// Design Name: 
// Module Name: shift_register_1bit_delay
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

//100 bit delay
module shift_register_delay(
    input clk,
    input shiftin,
    output shiftout
    );
    
    reg shift_reg; //1-bit delay
    
    assign shiftout = shift_reg;
    always @(posedge clk) begin
        //shiftout <= shift_reg;
        shift_reg <= shiftin;
    end
    
endmodule

/*
module shift_register_32bit_delay(
    input clk,
    input shiftin,
    output reg shiftout
    );
    
    reg [31:0] shift_reg; //1-bit delay
    
    always @(posedge clk) begin
        shift_reg = {shift_reg[30:0], shiftin};
        shiftout = shift_reg[31];
    end
    
endmodule
*/
