`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2022 07:30:00 PM
// Design Name: 4-bit Full Adder with Carry Look Ahead using dataflow modeling 
// Module Name: fulladder_4bit_carrylookahead
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

module fulladder(
    input a,
    input b,
    input cin,
    output s
    );
    
    assign s = a ^ b ^ cin;
 
endmodule

module carry_lookahead(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [4:0] cout
    );
    
    wire [3:0] g;
    wire [3:0] p;
    
    assign cout[0] = cin;
    
    assign g[0] = a[0] & b[0];
    assign g[1] = a[1] & b[1];
    assign g[2] = a[2] & b[2];
    assign g[3] = a[3] & b[3];
    
    assign p[0] = a[0] | b[0];
    assign p[1] = a[1] | b[1];
    assign p[2] = a[2] | b[2];
    assign p[3] = a[3] | b[3];
    
    assign cout[1] = g[0] | (p[0] & cout[0]);
    assign cout[2] = g[1] | (p[1] & cout[1]);
    assign cout[3] = g[2] | (p[2] & cout[2]);
    assign cout[4] = g[3] | (p[3] & cout[3]);
 
endmodule

module fulladder_4bit_carrylookahead(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output cout,
    output [3:0] s
    );
    
    wire [4:0] c;
    
    carry_lookahead carry_lookahead(
        .a(a),
        .b(b),
        .cin(cin),
        .cout(c)
        );
    
    fulladder fa0(
        .a(a[0]),
        .b(b[0]),
        .cin(c[0]),
        .s(s[0])
        );
        
    fulladder fa1(
        .a(a[1]),
        .b(b[1]),
        .cin(c[1]),
        .s(s[1])
        );
        
    fulladder fa2(
        .a(a[2]),
        .b(b[2]),
        .cin(c[2]),
        .s(s[2])
        );
        
    fulladder fa3(
        .a(a[3]),
        .b(b[3]),
        .cin(c[3]),
        .s(s[3])
        );
        
    assign cout = c[4];
    
endmodule
