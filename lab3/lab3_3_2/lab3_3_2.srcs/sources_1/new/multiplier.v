`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2022 02:43:37 AM
// Design Name: 
// Module Name: comparator_2bit
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

module ROM_16x2 #(FILENAME = "ROM_data.coe")(
    output [1:0] ROM_data,
    input [3:0] ROM_addr
    );
    
    reg [1:0] ROM [15:0]; //defining 16x2 ROM
    
    assign ROM_data = ROM[ROM_addr]; //reading ROM content at the address
    
    initial begin 
        $readmemb(FILENAME, ROM, 0, 15); // load ROM content from ROM_data.txt file
    end
endmodule

module multiplier(
    input [3:0] addra,
    input [3:0] addrb,
    output [3:0] product
    );
    
    wire [1:0] ROM_data_a;
    wire [1:0] ROM_data_b;
    
    ROM_16x2 #(.FILENAME("ROM_data_a.coe"))geta(
        .ROM_data(ROM_data_a),
        .ROM_addr(addra)
    );
    
    ROM_16x2 #(.FILENAME("ROM_data_b.coe")) getb(
        .ROM_data(ROM_data_b),
        .ROM_addr(addrb)
    );
    
    assign product = ROM_data_a * ROM_data_b;
    
endmodule
