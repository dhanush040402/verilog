module universal_shift_register (
    input clk,
    input rst,
    input [1:0] sel,
    input shift_r,
    input shift_l,
    input [3:0] d,
    output reg [3:0] q
);

always @(posedge clk) begin
    if (rst)
        q <= 4'b0000;
    else begin
        case (sel)
            2'b00: q <= q;
            2'b01: q <= {shift_r, q[3:1]};
            2'b10: q <= {q[2:0], shift_l};
            2'b11: q <= d;
            default: q <= q;
        endcase
    end
end

endmodule

