

`include "define.v"
module mux3(inp0, inp1, inp2, sel, outp);
	parameter muxsize = `datasize;
	input [muxsize-1:0] inp0, inp1, inp2;
	input [1:0] sel;
	output [muxsize-1:0] outp;
	
	assign outp = (sel == 2'b00) ? inp0 : {muxsize{1'bz}};
	assign outp = (sel == 2'b01) ? inp1 : {muxsize{1'bz}};
	assign outp = (sel[1] == 1) ? inp2 : {muxsize{1'bz}};
endmodule
