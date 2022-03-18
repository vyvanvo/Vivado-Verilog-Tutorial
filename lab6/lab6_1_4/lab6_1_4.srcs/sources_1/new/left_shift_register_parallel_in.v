`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2022 05:15:26 PM
// Design Name: 
// Module Name: left_shift_register_parallel_in
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


module left_shift_register_parallel_in(
    input clk,
    input shift_in,
    input [3:0] parallel_in,
    input load,
    input shift_en,
    output shift_out,
    output [3:0] reg_content
    );
    
    reg [3:0] shift_reg;
    
    always @(posedge clk) begin
        if (load) begin
            shift_reg <= parallel_in;
        end else if (shift_en) begin
            //shift_out = shift_reg[3];
            shift_reg <= {shift_reg[2:0], shift_in};
        end
    end
    
    assign shift_out = shift_reg[3];
    assign reg_content = shift_reg;
    
endmodule
