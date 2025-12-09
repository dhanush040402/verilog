module adder_subtractor (
    input  [3:0] A,
    input  [3:0] B,
    input  op,
    output [3:0] result,
    output carry
);
assign {carry, result} = A + (B ^ {4{op}}) + op;
endmodule

