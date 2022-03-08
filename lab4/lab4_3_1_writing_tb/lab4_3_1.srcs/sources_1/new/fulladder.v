`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2022 01:56:06 AM
// Design Name: 
// Module Name: full_adder
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
    output cout,
    output s
    );
    
    assign s = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);
    
endmodule

module fulladder_4bit(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output cout,
    output [3:0] s
    );
    
    wire [2:0] c;
    
    fulladder fa0(
        .a(a[0]),
        .b(b[0]),
        .cin(cin),
        .cout(c[0]),
        .s(s[0])
    );
    
    fulladder fa1(
        .a(a[1]),
        .b(b[1]),
        .cin(c[0]),
        .cout(c[1]),
        .s(s[1])
    );
    
    fulladder fa2(
        .a(a[2]),
        .b(b[2]),
        .cin(c[1]),
        .cout(c[2]),
        .s(s[2])
    );
    
    fulladder fa3(
        .a(a[3]),
        .b(b[3]),
        .cin(c[2]),
        .cout(cout),
        .s(s[3])
    );
    
endmodule

/*module full_adder_4bit(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output cout,
    output [3:0] s
    );
    
    assign {cout, s} = a + b + cin;
        
endmodule 
*/