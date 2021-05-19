

`include "define.v"
module zeropad(inp, outp);
	input [`extend9size-1:0] inp;
	output [`datasize-1:0] outp;
	
	assign outp = {inp, {7{1'b0}}};
endmodule
