module tff (
    input clk,
    input rst,
    input t,
    output reg q,
    output reg q_bar
);
always @(negedge clk or posedge rst) begin
    if (rst) begin
        q <= 1'b0;
        q_bar <= 1'b1;
    end
    else begin
        q <= ~q;
        q_bar <= ~q_bar;
    end
end
endmodule



module updown_counter (
    input clk,
    input rst,
    input mode,          
    output [3:0] q,
    output [3:0] q_bar
);

wire c1, c2, c3;

assign c1 = mode ? q[0] : q_bar[0];
assign c2 = mode ? q[1] : q_bar[1];
assign c3 = mode ? q[2] : q_bar[2];

tff t0 (.clk(clk), .rst(rst), .t(1'b1), .q(q[0]), .q_bar(q_bar[0]));
tff t1 (.clk(c1),  .rst(rst), .t(1'b1), .q(q[1]), .q_bar(q_bar[1]));
tff t2 (.clk(c2),  .rst(rst), .t(1'b1), .q(q[2]), .q_bar(q_bar[2]));
tff t3 (.clk(c3),  .rst(rst), .t(1'b1), .q(q[3]), .q_bar(q_bar[3]));

endmodule

