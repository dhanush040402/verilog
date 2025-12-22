module sr_ff (
    input  wire clk,
    input  wire rst,
    input  wire s,
    input  wire r,
    output reg  q
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 1'b0;
        else begin
            case ({s, r})
                2'b10: q <= 1'b1;   // Set
                2'b01: q <= 1'b0;   // Reset
                2'b00: q <= q;      // Hold
                2'b11: q <= q;      // Invalid for SR, avoided in JK logic
            endcase
        end
    end
endmodule


module jk_ff_using_sr (
    input  wire clk,
    input  wire rst,
    input  wire j,
    input  wire k,
    output wire q
);
    wire s, r;

    assign s = j & ~q;
    assign r = k &  q;

    sr_ff u1 (
        .clk(clk),
        .rst(rst),
        .s(s),
        .r(r),
        .q(q)
    );
endmodule

