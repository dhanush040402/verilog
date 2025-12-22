module even_parity_checker (
    input  [3:0] data,
    input parity,
    output error
);
assign error = ^{data, parity};
endmodule

