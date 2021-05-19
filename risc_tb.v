

`include "risc.v"
module risc_tb;
reg clk, rst;

initial begin
	$dumpfile("wave.vcd");
	$dumpvars(0, risc_tb);
end

risc top(clk, rst);

initial begin
	rst <= 1;
	clk <= 0;
	#7 rst <= 0;
end

initial repeat(400) #5 clk <= ~clk;



initial begin 
$display("R0\tR1\tR2\tR3\tR4\tR5\tR6\tR7\tTIME");
$monitor("%4h\t%4h\t%4h\t%4h\t%4h\t%4h\t%4h\t%4h\t%4d", top.rfuut.rfile[0], top.rfuut.rfile[1], top.rfuut.rfile[2], top.rfuut.rfile[3], top.rfuut.rfile[4], top.rfuut.rfile[5], top.rfuut.rfile[6], top.rfuut.rfile[7], $time);
end
endmodule


//start clock from 0
//end reset between a previous posedge and next negedge
//      _____       _____
//     |     |     |     |
//     |     |     |     |
//     |     |     |     |
//     |     |     |     |
//_____|<--->|_____|<--->|_____
////////RESET///////RESET//////
/////////OFF/////////OFF///////
////////AERA////////AREA///////
