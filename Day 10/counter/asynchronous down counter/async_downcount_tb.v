module async_downcount_tb;
reg clk,rst;
wire [3:0]q;
async_downcount dut(.clk(clk),.rst(rst),.q(q));
initial begin
	$monitor("clock = %d | reset = %d | output = %d | time = %0t",clk,rst,q,$time);
	$dumpfile("async_downcount.vcd");
	$dumpvars(0);

	clk=0;
	forever #5 clk=~clk;
end

initial begin
	rst=1;

	#10;rst=0;
	#200;$finish;
end
endmodule

