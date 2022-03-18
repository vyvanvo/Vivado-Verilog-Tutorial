`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2022 04:58:01 PM
// Design Name: D latch (removes metastability)
// Module Name: D_latch
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

//behavior
module D_latch(
    input D,
    input E,
    output reg Q,
    output reg Qbar
    );
    
    always @(D or E) begin
        if (E) begin
            Q = D;
            Qbar = ~D;
        end
    end
    
endmodule

//dataflow
module D_latch(
    input D,
    input E,
    output Q,
    output Qbar
    );
    
    assign #2 Q = ~( (~D & E) | Qbar);
    assign #2 Qbar = ~( (D & E) | Q);
    
endmodule