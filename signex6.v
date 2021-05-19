

`include "define.v"
module signex6(inp, outp);
	input [`extend6size-1:0] inp;
	output [`datasize-1:0] outp;
	
	assign outp = {{10{inp[`extend6size-1]}}, inp};
endmodule
