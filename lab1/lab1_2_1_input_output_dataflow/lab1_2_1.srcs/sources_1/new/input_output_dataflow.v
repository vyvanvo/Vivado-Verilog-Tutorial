`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2022 02:34:10 AM
// Design Name: Input Switches to Output LEDs using dataflow
// Module Name: lab1_2_1
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


module input_output_dataflow(
    input [7:0] swt,
    output [7:0] led
    );
    
   assign led = swt;    //assign leds output to switches input
   
endmodule
