module johnson_tb;
reg clk,rst;
wire [3:0]q;
johnson dut(.clk(clk),.rst(rst),.q(q));
initial begin
	$monitor("clock = %d | reset = %d | count = %b | time = %0t |",clk,rst,q,$time);
	$dumpfile("johnson.vcd");
	$dumpvars(0);

	clk=0;rst=1;#10;


	rst=0;#160
	$finish;

end
always #5 clk=~clk;
endmodule

