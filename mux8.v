

`include "define.v"
module mux8(inp0, inp1, inp2, inp3, inp4, inp5, inp6, inp7, sel, outp);
	parameter muxsize = `datasize;
	input [muxsize-1:0] inp0, inp1, inp2, inp3, inp4, inp5, inp6, inp7;
	input [2:0] sel;
	output [muxsize-1:0] outp;
	
	assign outp = (sel == 3'b000) ? inp0 : {muxsize{1'bz}};
	assign outp = (sel == 3'b001) ? inp1 : {muxsize{1'bz}};
	assign outp = (sel == 3'b010) ? inp2 : {muxsize{1'bz}};
	assign outp = (sel == 3'b011) ? inp3 : {muxsize{1'bz}};
	assign outp = (sel == 3'b100) ? inp4 : {muxsize{1'bz}};
	assign outp = (sel == 3'b101) ? inp5 : {muxsize{1'bz}};
	assign outp = (sel == 3'b110) ? inp6 : {muxsize{1'bz}};
	assign outp = (sel == 3'b111) ? inp7 : {muxsize{1'bz}};
endmodule
