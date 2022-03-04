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

module comparator_2bit(
    input [3:0] addra,
    input [3:0] addrb,
    output reg lt,
    output reg gt,
    output reg eq
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
    
    always @(*) begin
            lt = 1'b0;
            gt = 1'b0;
            eq = 1'b0;
        if (ROM_data_b == ROM_data_a) begin
            eq = 1'b1;
        end else if (ROM_data_b > ROM_data_a) begin
            gt = 1'b1;
        end else if (ROM_data_b < ROM_data_a) begin
            lt = 1'b1;
        end
    end
    
endmodule
