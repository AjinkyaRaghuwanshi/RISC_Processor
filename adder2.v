`include "define.v"
// `include "oneshiftleft.v"
module adder(inp1, inp2,,setb outp);
parameter datawidth = `datasize;
input [datawidth-1:0] inp1, inp2;
input setb;
output [datawidth-1:0] outp;
// oneshiftleft uut1(inp2,setb,outp2);
assign inp2 = (setb) ? (inp2 << 1) : inp2;
assign outp = inp1 + inp2;
endmodule