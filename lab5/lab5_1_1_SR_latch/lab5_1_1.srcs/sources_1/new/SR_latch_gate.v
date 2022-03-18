`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2022 01:12:20 AM
// Design Name: 
// Module Name: SR_latch_gate
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

/*module SR_latch_dataflow(
    input R,
    input S,
    output Q,
    output Qbar
    );
    
    assign #2 Q = ~(R | Qbar);
    assign #2 Qbar = ~(S | Q);
    
endmodule
*/


module SR_latch_gate(
    input R,
    input S,
    output Q,
    output Qbar
    );
    
    nor #2 (Q, R, Qbar);
    nor # 2 (Qbar, S, Q);
    
endmodule
