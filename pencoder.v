
module pencoder(ina, inb, inc, ind, ine, out);
	input ina, inb, inc, ind, ine, stallpc;
	output reg [4:0] out;
	
	always @(*) begin
		if(ine == 1)
			out <= 5'b00000;
		else if(ind == 1)
			out <= 5'b10000;
		else if(inc == 1)
			out <= 5'b01000;
		else if(inb == 1)
			out <= 5'b00100;
		else if(ina == 1)
			out <= 5'b00010;
		else
			out <= 5'b00000;		
	end
endmodule
