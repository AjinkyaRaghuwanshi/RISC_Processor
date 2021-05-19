

`include "define.v"

module imemory(addr, data);

input [`memaddrsize-1:0] addr;
output [`datasize-1:0] data;

reg [`datasize-1:0] mem [0:30];

initial $readmemh("imemory.h", mem);

assign data = mem[addr];

endmodule
