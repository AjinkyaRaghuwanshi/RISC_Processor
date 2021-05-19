

`include "define.v"
module alu(a, b, z, op, carry, zero);

input [`datasize-1:0] a, b;
output [`datasize-1:0] z;
input op;
output carry, zero;

assign {carry, z} = (op) ? ({1'b0, a} + {1'b0, b}) : {1'b0, ~(a & b)};
assign zero = ~|z;

endmodule
