`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: lab2_2_1_partA_tb
//////////////////////////////////////////////////////////////////////////////////

module bcd_tb(
    );
    
    reg [3:0] v;
	wire z;
	integer k;
    wire [3:0] m;
    
    bcd DUT(.v(v), .z(z), .m(m));
   
    initial
    begin
      v = 0;
	for(k=0; k < 16; k=k+1)
		#10 v = k;
	#20;
    end

endmodule
