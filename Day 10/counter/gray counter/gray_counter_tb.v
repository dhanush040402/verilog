module gray_counter_tb;
reg clk,rst;
wire [3:0]gray;
gray_counter dut(.clk(clk),.rst(rst),.gray(gray));
initial begin
	$monitor("clock = %d | reset = %d | count = %d | time = %0t |",clk,rst,gray,$time);
	$dumpfile("gray_counter.vcd");
	$dumpvars(0);

	clk=0;rst=1;#10;


	rst=0;#160
	$finish;

end
always #5 clk=~clk;
endmodule

