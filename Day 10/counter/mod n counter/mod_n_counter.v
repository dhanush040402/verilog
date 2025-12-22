module mod_n_counter #(
	parameter integer N=5,
	parameter integer width=$clog2(N)
	)(
	input clk,rst, 
	output reg [width-1:0] q);

always @(posedge clk) begin
	if (rst) q<={width{1'b0}};
	else if (q==N-1) q<={width{1'b0}};
	else q<=q+1'b1;
end
endmodule
