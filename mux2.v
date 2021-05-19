

`include "define.v"
module mux2(inp0, inp1, sel, outp);
	parameter muxsize = `datasize;
	input [muxsize-1:0] inp0, inp1;
	input sel;
	output [muxsize-1:0] outp;
	
	assign outp = (sel) ? inp1 : inp0;
endmodule
