

`include "define.v"

module dmemory(clk, rst, wr, datain, dataout, addr);

input clk, rst, wr;
input [`memaddrsize-1:0] addr;
input [`datasize-1:0] datain;
output [`datasize-1:0] dataout;

reg [`datasize-1:0] mem [0:65535];

always @(posedge clk or posedge rst) begin
	if(rst)
		$readmemh("dmemory.h", mem);
	else if(wr)
		mem[addr] <= datain;
end

assign dataout = mem[addr];

endmodule
