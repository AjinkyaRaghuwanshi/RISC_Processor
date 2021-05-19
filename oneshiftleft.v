`include "define.v"
module oneshiftleft(inp, setb, outp);
	input [`datasize-1:0] inp;
    input [0:0] setb;
	output [`datasize-1:0] outp;
	assign outp = (setb) ? (inp << 1) : inp;
endmodule