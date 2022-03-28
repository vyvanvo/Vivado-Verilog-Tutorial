`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2022 02:46:45 AM
// Design Name: 
// Module Name: bcd_to_gray_code_tb
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


module bcd_to_gray_code_tb(
    );
    
    reg [3:0] bcd;
    reg en;
    wire [3:0] gray_code;
    
    bcd_to_gray_code DUT(.bcd(bcd), .en(en), .gray_code(gray_code));
    
    initial begin
        en = 0;
        
        //0
        bcd = 4'b0000;
        #10
        if (gray_code == 4'b0000) begin
            $display("Test passed: gray_code = %b", gray_code);
        end else begin
            $display("Test failed: got gray_code = %b, expected gray_code = 0000", gray_code);
        end
        
        //1
        bcd = 4'b0001;
        #10
        if (gray_code == 4'b0001) begin
            $display("Test passed: gray_code = %b", gray_code);
        end else begin
            $display("Test failed: got gray_code = %b, expected gray_code = 0001", gray_code);
        end
        
        //2
        bcd = 4'b0010;
        #10 
        if (gray_code == 4'b0011) begin
            $display("Test passed: gray_code = %b", gray_code);
        end else begin
            $display("Test failed: got gray_code = %b, expected gray_code = 0011", gray_code);
        end
        
        //3
        bcd = 4'b0011;
        #10
        if (gray_code == 4'b0010) begin
            $display("Test passed: gray_code = %b", gray_code);
        end else begin
            $display("Test failed: got gray_code = %b, expected gray_code = 0010", gray_code);
        end
        
        //4
        bcd = 4'b0100;
        #10
        if (gray_code == 4'b0110) begin
            $display("Test passed: gray_code = %b", gray_code);
        end else begin
            $display("Test failed: got gray_code = %b, expected gray_code = 0110", gray_code);
        end
        
        //5
        bcd = 4'b0101;
        #10
        if (gray_code == 4'b0111) begin
            $display("Test passed: gray_code = %b", gray_code);
        end else begin
            $display("Test failed: got gray_code = %b, expected gray_code = 0111", gray_code);
        end
        
        //6
        bcd = 4'b0110;
        #10
        if (gray_code == 4'b0101) begin
            $display("Test passed: gray_code = %b", gray_code);
        end else begin
            $display("Test failed: got gray_code = %b, expected gray_code = 0101", gray_code);
        end
        
        //7
        bcd = 4'b0111;
        #10
        if (gray_code == 4'b0100) begin
            $display("Test passed: gray_code = %b", gray_code);
        end else begin
            $display("Test failed: got gray_code = %b, expected gray_code = 0100", gray_code);
        end
        
        //8
        bcd = 4'b1000;
        #10
        if (gray_code == 4'b1100) begin
            $display("Test passed: gray_code = %b", gray_code);
        end else begin
            $display("Test failed: got gray_code = %b, expected gray_code = 1100", gray_code);
        end
        
        //9
        bcd = 4'b1001;
        #10
        if (gray_code == 4'b1101) begin
            $display("Test passed: gray_code = %b", gray_code);
        end else begin
            $display("Test failed: got gray_code = %b, expected gray_code = 1101", gray_code);
        end
        
        //10
        bcd = 4'b1010;
        #10
        if (gray_code == 4'b1111) begin
            $display("Test passed: gray_code = %b", gray_code);
        end else begin
            $display("Test failed: got gray_code = %b, expected gray_code = 1111", gray_code);
        end
        
        //11
        bcd = 4'b1011;
        #10
        if (gray_code == 4'b1011) begin
            $display("Test passed: gray_code = %b", gray_code);
        end else begin
            $display("Test failed: got gray_code = %b, expected gray_code = 1011", gray_code);
        end
        
        //12
        bcd = 4'b1100;
        #10
        if (gray_code == 4'b1010) begin
            $display("Test passed: gray_code = %b", gray_code);
        end else begin
            $display("Test failed: got gray_code = %b, expected gray_code = 1010", gray_code);
        end
        
        //13
        bcd = 4'b1101;
        #10
        if (gray_code == 4'b1011) begin
            $display("Test passed: gray_code = %b", gray_code);
        end else begin
            $display("Test failed: got gray_code = %b, expected gray_code = 1011", gray_code);
        end
        
        //14
        bcd = 4'b1110;
        #10
        if (gray_code == 4'b1001) begin
            $display("Test passed: gray_code = %b", gray_code);
        end else begin
            $display("Test failed: got gray_code = %b, expected gray_code = 1001", gray_code);
        end
        
        //15
        bcd = 4'b1111;
        #10
        if (gray_code == 4'b1000) begin
            $display("Test passed: gray_code = %b", gray_code);
        end else begin
            $display("Test failed: got gray_code = %b, expected gray_code = 1000", gray_code);
        end
        
        $finish;
        
    end
    
endmodule
