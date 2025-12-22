module sync_updowncounter_tb;
reg clk,rst,mode;
wire [3:0]q;
sync_updowncounter dut(.clk(clk),.rst(rst),.mode(mode),.q(q));
initial begin
	$monitor("clock = %d | reset = %d | mode = %d | count = %d | time = %0t |",clk,rst,mode,q,$time);
	$dumpfile("sync_updowncounter.vcd");
	$dumpvars(0);

	clk=0;rst=1;mode=1;#10;


	rst=0;#160;

	rst=1;mode=0;#10;

	rst=0;#160;


	$finish;

end
always #5 clk=~clk;
endmodule
