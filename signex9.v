

`include "define.v"
module signex9(inp, outp);
	input [`extend9size-1:0] inp;
	output [`datasize-1:0] outp;
	
	assign outp = {{7{inp[`extend9size-1]}}, inp};
endmodule
