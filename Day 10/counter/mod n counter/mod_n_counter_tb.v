module mod_n_counter_tb;
parameter N=12;
reg clk,rst;
wire [$clog2(N)-1:0] q;
mod_n_counter #(.N(N)) dut(.clk(clk),.rst(rst),.q(q));
initial begin
	clk=0;
	forever #5 clk=~clk;
end
initial begin
	$dumpfile("mod_n_counter.vcd");
	$dumpvars(0);
	rst=1;#10;
	rst=0;
	#200;
	$finish;
end
always @(posedge clk) begin
	$display("Reset=%b | Count=%d",rst,q);
end
endmodule
