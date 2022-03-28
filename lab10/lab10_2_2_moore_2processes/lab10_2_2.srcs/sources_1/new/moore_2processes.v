`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2022 10:12:35 PM
// Design Name: 
// Module Name: moore_2processes
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


module moore_2processes(
    input clk,
    input rst,
    input x,
    output reg parity
    );

    parameter S0 = 1'b0;
    parameter S1 = 1'b1;

    reg state, next_state;

    //sequential block
    always @(posedge clk or rst) begin
        if (rst) begin
            state <= S0;
        end else begin
            state <= next_state;
        end
    end

    //combinational block - compute output and next_state
    always @(state or x) begin
        case (state)
            S0: begin
                parity = 0;
                if (x) begin
                    next_state = S1;
                end else begin
                    next_state = S0;
                end
            end

            S1: begin
                parity = 1;
                if (x) begin
                    next_state = S0;
                end else begin
                    next_state = S1;
                end
            end

            default: begin
                parity = 0;
                next_state = S0;
            end

        endcase
    end
endmodule
