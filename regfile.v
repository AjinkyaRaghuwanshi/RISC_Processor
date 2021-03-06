

`include "define.v"

module regfile(clk, rst, regwr, o_addr1, o_addr2, i_addr, o_data1, o_data2, i_data, i_pc, o_pc);

input clk, rst, regwr;
input [`regfileaddrsize-1:0] o_addr1, o_addr2, i_addr;
input [`datasize-1:0] i_data, i_pc;
output [`datasize-1:0] o_data1, o_data2, o_pc;

reg [`datasize-1:0] rfile [`regfilesize-1:0];


integer i;

always @(posedge clk or posedge rst) begin
	if(rst) begin
		for(i=0;i<`regfilesize;i=i+1)
			rfile[i] <= 0;	
		//rfile[0] = 16'h1234;
		//rfile[1] = 16'h5678;
		//rfile[2] = 16'h9ABC;
		//rfile[3] = 16'hDEF0;
		//rfile[4] = 16'h6791;
		//rfile[5] = 16'hAEF0;
		//rfile[6] = 16'hBCDD;
		//rfile[7] = 16'h0;
	end
	else begin
		if(regwr)
			rfile[i_addr] <= i_data;	
		rfile[`pcaddr] <= i_pc;
	end	
end

assign o_data1 = rfile[o_addr1];
assign o_data2 = rfile[o_addr2];

assign o_pc = rfile[`pcaddr];

endmodule
