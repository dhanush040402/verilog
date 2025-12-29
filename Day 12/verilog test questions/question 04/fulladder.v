/*Design configurable full adder using parameter construct (Test it for 8 bit
 and display using $strobe)*/







module nbit_full_adder #(
    parameter N = 8          // Number of bits
)(
    input  wire [N-1:0] A,
    input  wire [N-1:0] B,
    input  wire         Cin,
    output wire [N-1:0] Sum,
    output wire         Cout
);

    wire [N:0] carry;
    assign carry[0] = Cin;

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : FA
            assign Sum[i] = A[i] ^ B[i] ^ carry[i];
            assign carry[i+1] = (A[i] & B[i]) |
                                (A[i] & carry[i]) |
                                (B[i] & carry[i]);
        end
    endgenerate

    assign Cout = carry[N];

endmodule

