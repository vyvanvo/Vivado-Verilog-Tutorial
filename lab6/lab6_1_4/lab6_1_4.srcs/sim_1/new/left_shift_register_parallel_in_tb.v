`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2022 05:36:48 PM
// Design Name: 
// Module Name: left_shift_register_parallel_in_tb
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


module left_shift_register_parallel_in_tb(
    );
    
    reg clk, shift_in, load, shift_en;
    reg [3:0] parallel_in;
    wire shift_out;
    wire [3:0] reg_content;
    
    left_shift_register_parallel_in DUT(.clk(clk), .shift_in(shift_in), .load(load), .shift_en(shift_en), 
                                        .parallel_in(parallel_in), .shift_out(shift_out), .reg_content(reg_content));
                                        
    initial begin
        clk = 1;
        forever begin
            clk = ~clk;
            #10;
        end
    end
    
    initial begin
        load = 0; shift_in = 1; shift_en = 0; parallel_in = 4'b0000;
        #20
        
        parallel_in = 4'b0101;
        #40
        
        load = 1;
        #20
        
        load = 0; 
        #20
        
        shift_en = 1;
        #80
        
        parallel_in = 4'b1001;
        #20
        
        load = 1;
        #20
        
        load = 0;
        #55
        
        load = 1;
        #20
        
        load = 0;
        #25
        
        shift_en = 0;
        #40
        
        load = 1;
        #20
        
        load = 0;
        #20
        
        $finish;
    end
    
endmodule
