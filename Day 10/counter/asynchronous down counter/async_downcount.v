module tff (input clk, input rst, input t, output reg q);
always @(posedge clk or posedge rst)begin
       	if (rst) q <= 1'b0;
       	else if (t) q <= ~q;
end
endmodule

module async_downcount(
	input clk,rst,
	output [3:0]q
);
tff t0(.clk(clk),.rst(rst),.t(1'b1),.q(q[0]));
tff t1(.clk(q[0]),.rst(rst),.t(1'b1),.q(q[1]));
tff t2(.clk(q[1]),.rst(rst),.t(1'b1),.q(q[2]));
tff t3(.clk(q[2]),.rst(rst),.t(1'b1),.q(q[3]));
endmodule
