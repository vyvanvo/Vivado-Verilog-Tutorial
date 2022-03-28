`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2022 09:46:22 PM
// Design Name: 
// Module Name: mealy_3processes
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


module mealy_3processes(
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

    //combinational block - compute parity output
    always (state or x) begin
        case (state) begin
            S0: begin
                if (x) begin
                    parity = 1;
                end else begin
                    parity = 0;
                end
            end

            S1: begin
                if (x) begin
                    parity = 0;
                end else begin
                    parity = 1;
                end
            end

            default: begin
                parity = 0;
            end
        endcase
    end

    //combinational block - compute next_state
    always @(state or x) begin
        S0: begin
            if (x) begin
                next_state = S1;
            end else begin
                next_state = S0;
            end
        end

        S1: begin
            if (x) begin
                next_state = S0;
            end else begin
                next_state = S1;
            end
        end

        default: begin
            next_state = S0;
        end
    end


endmodule
