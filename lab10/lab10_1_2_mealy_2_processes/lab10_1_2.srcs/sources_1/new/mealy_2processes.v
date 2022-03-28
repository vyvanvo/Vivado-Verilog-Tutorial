`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2022 07:55:59 PM
// Design Name: 
// Module Name: mealy_2processes
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

module mealy_2processes(
    input clk,
    input rst,
    input x,
    output reg parity
    );

    parameter S0 = 1'b0;
    parameter S1 = 1'b1;
    reg state, next_state;
    //sequential block - updating state
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= S0;
        end else begin
            state <= next_state;
        end
    end

    //combinational block - compute output and next state
    always @(state or x) begin //output depends on state and input change
        case (state)
            S0: begin
                if (x) begin
                    parity = 1;
                    next_state = S1;
                end else begin
                    parity = 0;
                    next_state = S1;
                end
            end

            S1: begin
                if (x) begin
                    parity = 0;
                    next_state = S0;
                end else begin
                    parity = 1;
                    next_state = S1;
                end
            end

            default:
                parity = 0;
                next_state = S0;
        endcase
    end

endmodule
