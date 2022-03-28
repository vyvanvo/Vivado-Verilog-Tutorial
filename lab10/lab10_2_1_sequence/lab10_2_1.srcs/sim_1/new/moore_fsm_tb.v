`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2022 02:28:36 AM
// Design Name: 
// Module Name: moore_fsm_tb
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


module moore_fsm_tb(
    );
    
    reg clk, rst;
    reg [1:0] ain;
    wire yout;
    
    moore_fsm DUT(.clk(clk), .rst(rst), .ain(ain), .yout(yout));
    
    initial begin
        clk = 1;
        forever begin
            clk = ~clk;
            #10;
        end 
    end
    
    initial begin
        ain = 2'b00;
        rst = 1;
        #10
        
        rst = 0;
        #10
        
        //test wait1 state
        ain = 2'b00; //stay at wait1 
        #40
        
        //test sequence 1
        ain = 2'b01; //go to S1_1
        #40
        
        ain = 2'b00; //go to S1_2 -> back to wait1
        #80
        
        //test failed sequence 1
        ain = 2'b01; //go to S1_1
        #40
        
        ain = 2'b10; //go to wait2
        #80
        
        ain = 2'b00; //go to wait1
        #40
        
        //test sequence 2
        ain = 2'b11; //go to S2_1
        #40
        
        ain = 2'b00; //go to S2_2 -> back to wait1;
        #80
        
        //test failed sequence 2
        ain = 2'b11; //go to S2_1
        #40
        
        ain = 2'b10; //go to wait2
        #80
        
        ain = 2'b00; //go to wait1
        #40
        
        //test sequence 3
        ain = 2'b10; //go to S3_1
        #40
        
        ain = 2'b00; //go to S3_2 -> back to wait1
        #80
        
        //test failed sequence 3
        ain = 2'b10; //go to S3_1
        #40
        
        ain = 2'b01; //go to wait 2
        #80
        
        ain = 2'b00; //got to wait1
        #100
        
        
        $finish;
    end
    
endmodule
