
`include "define.v"
module register(clk, rst, wr, i_data, o_data);

parameter regsize = `datasize;

input clk, rst, wr;
input [regsize-1:0] i_data;
output reg [regsize-1:0] o_data;

always @(posedge clk or posedge rst) begin
	if(rst)
		o_data <= 0;
	else if(wr)
		o_data <= i_data;	
end

endmodule
