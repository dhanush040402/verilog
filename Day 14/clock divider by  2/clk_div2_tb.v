module clk_div2_tb;
reg clk,rst;
wire clk_out;
clk_div2 dut(.clk(clk),.rst(rst),.clk_out(clk_out));
always #10 clk=~clk;
initial begin
	$dumpfile("clk_div2.vcd");
	$dumpvars(0);
	clk=0;rst=1;
	#2;
	rst=0;
	#200;
	$finish;
end
endmodule

