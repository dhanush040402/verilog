module clk_even_tb;
parameter N=3;
reg clk,rst;
wire clk_out;
clk_even #(N) dut(.clk(clk),.rst(rst),.clk_out(clk_out));
always #10 clk=~clk;
initial begin
	$dumpfile("clk_even.vcd");
	$dumpvars(0);
	clk=0;rst=1;
	#2;
	rst=0;
	#2000;
	$finish;
end
endmodule

