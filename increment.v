

`include "define.v"
module increment(inp, outp);
parameter datawidth = `datasize;
input [datawidth-1:0] inp;
output [datawidth-1:0] outp;

assign outp = inp + 1;
endmodule
