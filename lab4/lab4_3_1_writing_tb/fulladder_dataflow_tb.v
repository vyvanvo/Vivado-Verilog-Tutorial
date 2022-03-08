`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: fulladder_dataflow_tb
//////////////////////////////////////////////////////////////////////////////////

module fulladder_dataflow_tb(
    );
    
    reg a, b, cin;
	wire cout, s;
    
    fulladder DUT (.a(a), .b(b), .cin(cin), .cout(cout), .s(s));
    
 
    initial
    begin
        a = 0; b = 0; cin = 0;
        #10
        if (cout == 1'b0 && s == 1'b0) begin
            $display("Test passed: %b%b", cout, s);
        end else begin
            $display("Test failed: got %b%b, expected 00", cout, s);
        end
      
	   a = 1;
	   #10
	   if (cout == 1'b0 && s == 1'b1) begin
            $display("Test passed: %b%b", cout, s);
       end else begin
            $display("Test failed: got %b%b, expected 01", cout, s);
       end
	   
	   b = 1; a = 0;
	   #10
	   if (cout == 1'b0 && s == 1'b1) begin
            $display("Test passed: %b%b", cout, s);
       end else begin
            $display("Test failed: got %b%b, expected 01", cout, s);
       end
	   
	   a = 1;
	   #10
	   if (cout == 1'b1 && s == 1'b0) begin
            $display("Test passed: %b%b", cout, s);
       end else begin
            $display("Test failed: got %b%b, expected 10", cout, s);
       end
       
	   cin = 1; a = 0; b = 0;
	   #10
	   if (cout == 1'b0 && s == 1'b1) begin
            $display("Test passed: %b%b", cout, s);
       end else begin
            $display("Test failed: got %b%b, expected 01", cout, s);
       end
       
	   a = 1;
	   #10
	   if (cout == 1'b1 && s == 1'b0) begin
            $display("Test passed: %b%b", cout, s);
       end else begin
            $display("Test failed: got %b%b, expected 10", cout, s);
       end
	   
	   b = 1; a = 0;
	   #10
	   if (cout == 1'b1 && s == 1'b0) begin
            $display("Test passed: %b%b", cout, s);
       end else begin
            $display("Test failed: got %b%b, expected 10", cout, s);
       end
	   
	   a = 1;
	   #10
	   if (cout == 1'b1 && s == 1'b1) begin
            $display("Test passed: %b%b", cout, s);
       end else begin
            $display("Test failed: got %b%b, expected 11", cout, s);
       end
	   
    end

endmodule
