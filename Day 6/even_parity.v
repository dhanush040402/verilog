module even_parity(
    input  [3:0] data,
    output       parity
);

assign parity = ^data;

endmodule

