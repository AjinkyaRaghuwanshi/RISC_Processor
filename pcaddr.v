`include "define.v"
module pcaddr(branch, decision, waddrIDRR, waddrRREX, waddrEXMM, opcodeID, opcodeIDRR, opcodeRREX, opcodeEXMM, inc_pc, pcppIDRR, exID, exIDRR, pcexID, pcexIDRR, rddataRREX, aluoutEX, flagEX, condRREX, memrdMM, flushIFID, flushIDRR, flushRREX, flushEXMM, data, stall, nowr);

input			branch;
input      [ 1:0]	flagEX, condRREX, decision;
input      [ 2:0]	waddrIDRR, waddrRREX, waddrEXMM;
input      [ 3:0]	opcodeID, opcodeIDRR, opcodeRREX, opcodeEXMM;
input      [15:0]	exID, exIDRR, pcexID, pcexIDRR, aluoutEX, memrdMM, inc_pc, rddataRREX, pcppIDRR;
output reg       	flushIFID, flushIDRR, flushRREX, flushEXMM, stall, nowr;
output reg [15:0]	data;

always @(*) begin
	if(waddrIDRR == 3'd7 & opcodeIDRR == `lhi) begin
		data <= exIDRR;
		flushIFID <= 1;
		flushIDRR <= 1;
		flushRREX <= 0;
		flushEXMM <= 0;
		stall <= 0;
		nowr <= 0;
	end
	else if(opcodeID == `jal) begin
		data <= pcexID;
		flushIFID <= 1;
		flushIDRR <= 0;
		flushRREX <= 0;
		flushEXMM <= 0;
		stall <= 0;
		nowr <= 0;
	end
	else if(opcodeIDRR == `jlr & (opcodeRREX == `add || opcodeRREX == `ndu) & condRREX == 2'b0) begin
		data <= aluoutEX;
		flushIFID <= 1;
		flushIDRR <= 1;
		flushRREX <= 0;
		flushEXMM <= 0;
		stall <= 0;
		nowr <= 0;
	end
	else if(opcodeIDRR == `jlr & (opcodeRREX == `add || opcodeRREX == `ndu) & condRREX == 2'b01 & flagEX[0]) begin
		data <= aluoutEX;
		flushIFID <= 1;
		flushIDRR <= 1;
		flushRREX <= 0;
		flushEXMM <= 0;
		stall <= 0;
		nowr <= 0;
	end
	else if(opcodeIDRR == `jlr & (opcodeRREX == `add || opcodeRREX == `ndu) & condRREX == 2'b10 & flagEX[1]) begin
		data <= aluoutEX;
		flushIFID <= 1;
		flushIDRR <= 1;
		flushRREX <= 0;
		flushEXMM <= 0;
		stall <= 0;
		nowr <= 0;
	end
	else if(opcodeIDRR == `jlr & opcodeRREX == `adi) begin
		data <= aluoutEX;
		flushIFID <= 1;
		flushIDRR <= 1;
		flushRREX <= 0;
		flushEXMM <= 0;
		stall <= 0;
		nowr <= 0;
	end
	else if(opcodeIDRR == `jlr & opcodeRREX == `lhi) begin
		data <= exIDRR;
		flushIFID <= 1;
		flushIDRR <= 1;
		flushRREX <= 0;
		flushEXMM <= 0;
		stall <= 0;
		nowr <= 0;
	end
	else if(opcodeID == `jlr & opcodeIDRR == `lw) begin
		data <= 16'bz;
		flushIFID <= 0;
		flushIDRR <= 0;
		flushRREX <= 0;
		flushEXMM <= 0;
		stall <= 1;
		nowr <= 0;
	end
	else if(opcodeIDRR == `jlr & opcodeRREX == `lw) begin
		data <= 16'bz;
		flushIFID <= 0;
		flushIDRR <= 0;
		flushRREX <= 0;
		flushEXMM <= 0;
		stall <= 1;
		nowr <= 0;
	end
	else if(opcodeIDRR == `jlr & opcodeEXMM == `lw) begin
		data <= memrdMM;
		flushIFID <= 1;
		flushIDRR <= 0;
		flushRREX <= 0;
		flushEXMM <= 0;
		stall <= 0;
		nowr <= 1;
	end
	else if(opcodeID == `beq & branch) begin
		data <= pcexID;
		flushIFID <= 0;
		flushIDRR <= 0;
		flushRREX <= 0;
		flushEXMM <= 0;
		stall <= 0;
		nowr <= 1;
	end
	else if(opcodeID == `beq & ~branch) begin
		data <= inc_pc;
		flushIFID <= 0;
		flushIDRR <= 0;
		flushRREX <= 0;
		flushEXMM <= 0;
		stall <= 0;
		nowr <= 0;
	end
	else if(opcodeIDRR == `beq & decision == 2'b01 & opcodeRREX != `lw) begin
		data <= exIDRR;
		flushIFID <= 1;
		flushIDRR <= 0;
		flushRREX <= 0;
		flushEXMM <= 0;
		stall <= 0;
		nowr <= 0;
	end
	else if(opcodeIDRR == `beq & decision == 2'b10 & opcodeRREX != `lw) begin
		data <= pcppIDRR;
		flushIFID <= 1;
		flushIDRR <= 0;
		flushRREX <= 0;
		flushEXMM <= 0;
		stall <= 0;
		nowr <= 1;
	end
	else if(opcodeIDRR == `beq & (decision == 2'b11 || decision == 2'b00) & opcodeRREX != `lw) begin
		data <= inc_pc;
		flushIFID <= 0;
		flushIDRR <= 0;
		flushRREX <= 0;
		flushEXMM <= 0;
		stall <= 0;
		nowr <= 0;
	end
	else if(opcodeIDRR == `beq & opcodeRREX == `lw) begin
		data <= exIDRR;
		flushIFID <= 1;
		flushIDRR <= 0;
		flushRREX <= 0;
		flushEXMM <= 0;
		stall <= 1;
		nowr <= 1;
	end
	else if(opcodeIDRR == `beq & decision == 2'b01 & opcodeEXMM == `lw) begin
		data <= exIDRR;
		flushIFID <= 1;
		flushIDRR <= 0;
		flushRREX <= 0;
		flushEXMM <= 0;
		stall <= 0;
		nowr <= 0;
	end
	else if(opcodeIDRR == `beq & decision == 2'b10 & opcodeEXMM == `lw) begin
		data <= pcppIDRR;
		flushIFID <= 1;
		flushIDRR <= 0;
		flushRREX <= 0;
		flushEXMM <= 0;
		stall <= 0;
		nowr <= 0;
	end
	else if(opcodeIDRR == `beq & (decision == 2'b11 || decision == 2'b00) & opcodeEXMM == `lw) begin
		data <= inc_pc;
		flushIFID <= 0;
		flushIDRR <= 0;
		flushRREX <= 0;
		flushEXMM <= 0;
		stall <= 0;
		nowr <= 0;
	end
	else if(waddrRREX == 3'd7 & (opcodeRREX == `add || opcodeRREX == `ndu) & condRREX == 2'b0) begin
		data <= aluoutEX;
		flushIFID <= 1;
		flushIDRR <= 1;
		flushRREX <= 1;
		flushEXMM <= 0;
		stall <= 0;
		nowr <= 0;
	end
	else if(waddrRREX == 3'd7 & (opcodeRREX == `add || opcodeRREX == `ndu) & condRREX == 2'b01 & flagEX[0]) begin
		data <= aluoutEX;
		flushIFID <= 1;
		flushIDRR <= 1;
		flushRREX <= 1;
		flushEXMM <= 0;
		stall <= 0;
		nowr <= 0;
	end
	else if(waddrRREX == 3'd7 & (opcodeRREX == `add || opcodeRREX == `ndu) & condRREX == 2'b10 & flagEX[1]) begin
		data <= aluoutEX;
		flushIFID <= 1;
		flushIDRR <= 1;
		flushRREX <= 1;
		flushEXMM <= 0;
		stall <= 0;
		nowr <= 0;
	end
	else if(waddrRREX == 3'd7 & opcodeRREX == `adi) begin
		data <= aluoutEX;
		flushIFID <= 1;
		flushIDRR <= 1;
		flushRREX <= 1;
		flushEXMM <= 0;
		stall <= 0;
		nowr <= 0;
	end
	else if(waddrEXMM == 3'd7 & opcodeEXMM == `lw) begin
		data <= memrdMM;
		flushIFID <= 1;
		flushIDRR <= 1;
		flushRREX <= 1;
		flushEXMM <= 1;
		stall <= 0;
		nowr <= 0;
	end
	else begin
		data <= inc_pc;
		flushIFID <= 0;
		flushIDRR <= 0;
		flushRREX <= 0;
		flushEXMM <= 0;
		stall <= 0;
		nowr <= 0;
	end
end


endmodule
