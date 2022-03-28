`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2022 11:08:42 PM
// Design Name: 
// Module Name: moore_3processes
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


module moore_3processes(
    input clk,
    input rst,
    input x,
    output reg parity
    );

    parameter S0 = 1'b0;
    parameter S1 = 1'b1;

    reg state, next_state;

    //sequential block
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= S0;
        end else begin
            state <= next_state;
        end
    end 

    //combinational block - compute output
    always @(state) begin
        case (state)
            S0: parity = 0;
            S1: parity = 1;
            default = 0;
        endcase
    end

    //combinational block - compute next state
    always @(state or x) begin
        case (state)
            S0: begin
                if (x) begin
                    next_state = S1;
                end else if begin
                    next_state = S0;
                end

            end

            S1: begin
                if (x) begin
                    next_state = S0;
                end else begin
                    next_state = Sl;
                end
            end

            default: begin
                next_state = S0;
            end

        endcase

    end


endmodule
