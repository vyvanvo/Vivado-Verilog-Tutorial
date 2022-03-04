`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2022 02:37:31 AM
// Design Name: 
// Module Name: ROM_4x2
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


module ROM_4x2 #(FILENAME = "ROM_data.txt")(
    output [1:0] ROM_data,
    input [1:0] ROM_addr
    );
    
    reg [1:0] ROM [3:0]; //defining 4x2 ROM
    
    assign ROM_data = ROM[ROM_addr]; //reading ROM content at the address
    
    initial begin 
        $readmemb(FILENAME, ROM, 0, 3); // load ROM content from ROM_data.txt file
    end
endmodule
