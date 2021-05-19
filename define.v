
`define datasize 16
`define memsize 1024
`define memaddrsize 16
`define regfileaddrsize 3
`define regfilesize 8
`define pcaddr 7
`define statesize 6
`define countersize 3
`define extend6size 6
`define extend9size 9
`define flagregsize 2
`define opcodesize 4

//states

`define rst 6'h0
`define of 6'h1
`define od 6'h2
`define rr 6'h4
`define ex 6'h8
`define mem 6'h10
`define wb 6'h20

//instructions

`define add 4'h1
`define adi 4'h0
`define ndu 4'h2
`define lhi 4'h3
`define lw 4'h4
`define sw 4'h5
`define lm 4'hc
`define sm 4'hd
`define jal 4'h9
`define jlr 4'ha
`define beq 4'hc
`define la 4'he
`define sa 4'hf
`define jri 4'hb