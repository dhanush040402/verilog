module clk_odd_tb;
reg clk,rst;
wire clk_out;
parameter N=3;
clk_odd #(N) dut(.clk(clk),.rst(rst),.clk_out(clk_out));
always #10 clk=~clk;
initial begin
	$dumpfile("clk_odd.vcd");
	$dumpvars(0);
	clk=0;rst=1;
	#2;
	rst=0;
	#2000;
	$finish;
end
endmodule

