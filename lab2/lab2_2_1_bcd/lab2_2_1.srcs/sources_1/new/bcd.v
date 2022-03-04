`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2022 09:33:41 PM
// Design Name: Binary Coded Decimal
// Module Name: lab2_2_1
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

module comparator(
    input [3:0] v, 
    output z
    );
    
    assign z = v > 4'b1001;
    
endmodule
    
module circuitA(
    input [3:0] v,
    output reg [3:0] r
    );
    
    always @(*) begin
        case(v)
            4'b1010: r = 4'b0000;
            4'b1011: r = 4'b0001;
            4'b1100: r = 4'b0010;
            4'b1101: r = 4'b0011;
            4'b1110: r = 4'b0100;
            4'b1111: r = 4'b0101;
            default: r = v;
        endcase
    end
    
endmodule

module mux_2_1(
    input x,
    input y,
    input s,
    output reg m
    );
    
    always @(*) begin
        if (s == 0) begin
            m = x;
        end else begin
            m = y;
        end
    end
        
endmodule

module bcd_to_7segment(
    input [3:0] x,
    output [3:0] an,
    output reg [6:0] seg
    );
    
    always @(*) begin
        case(x)
            4'b0000: seg = 7'b1000000;
            4'b0001: seg = 7'b1111001;
            4'b0010: seg = 7'b0100100;
            4'b0011: seg = 7'b0110000;
            4'b0100: seg = 7'b0011001;
            4'b0101: seg = 7'b0010010;
            4'b0110: seg = 7'b0000010;
            4'b0111: seg = 7'b1111000;
            4'b1000: seg = 7'b0000000;
            4'b1001: seg = 7'b0010000;
        endcase 
    end
    
    assign an = 4'b1110; //rightmost is on
    
endmodule

module bcd(
    input [3:0] v,
    output z,
    output [3:0] m,
    output [6:0] seg,
    output [3:0] an
    );
    
    comparator comparator(
        .v(v),
        .z(z)
    );
    
    wire [3:0] r;
    circuitA circuitA(
        .v(v),
        .r(r)
    );
    
    mux_2_1 mux0(
        .x(v[0]),
        .y(r[0]),
        .s(z),
        .m(m[0])
    );
    
    mux_2_1 mux1(
        .x(v[1]),
        .y(r[1]),
        .s(z),
        .m(m[1])
    );
    
    mux_2_1 mux2(
        .x(v[2]),
        .y(r[2]),
        .s(z),
        .m(m[2])
    );
    
    mux_2_1 mux3(
        .x(v[3]),
        .y(r[3]),
        .s(z),
        .m(m[3])
    );
    
    bcd_to_7segment bcd_to_7segment(
        .x(m),
        .an(an),
        .seg(seg)
    );
    
endmodule
