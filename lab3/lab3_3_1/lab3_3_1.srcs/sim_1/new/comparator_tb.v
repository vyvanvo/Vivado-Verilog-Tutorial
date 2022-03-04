`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2022 03:44:52 PM
// Design Name: 
// Module Name: comparator_tb
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


module comparator_tb(
    );
    
    reg [3:0] addra;
    reg [3:0] addrb;
    wire lt, gt, eq;
    
    comparator_2bit DUT (.addra(addra), .addrb(addrb), .lt(lt), .gt(gt), .eq(eq));
    
    initial begin
        addra = 4'b0000; addrb = 2'b0000;
        #10;
        addra = 4'b0001; addrb = 4'b0001;
        #10;
        addra = 4'b0010; addrb = 4'b0010;
        #10;
        addra = 4'b0011; addrb = 4'b0011;
        #10;
        addra = 4'b0100; addrb = 4'b0100;
        #10;
        addra = 4'b0101; addrb = 4'b0101;
        #10;
        addra = 4'b0110; addrb = 4'b0110;
        #10;
        addra = 4'b0111; addrb = 4'b0111;
        #10;
        addra = 4'b1000; addrb = 4'b1000;
        #10;
        addra = 4'b1001; addrb = 4'b1001;
        #10;
        addra = 4'b1010; addrb = 4'b1010;
        #10;
        addra = 4'b1011; addrb = 4'b1011;
        #10;
        addra = 4'b1100; addrb = 4'b1100;
        #10;
        addra = 4'b1101; addrb = 4'b1101;
        #10;
        addra = 4'b1110; addrb = 4'b1110;
        #10;
        addra = 4'b1111; addrb = 4'b1111;
        #10;
    end
    
endmodule
