

`include "define.v"
module adder(inp1, inp2, outp);
parameter datawidth = `datasize;
input [datawidth-1:0] inp1, inp2;
output [datawidth-1:0] outp;

assign outp = inp1 + inp2;
endmodule
