module clk_div_tb;
reg clk,rst;
wire clk_out;
parameter N=3;
clk_div #(N) dut(.clk(clk),.rst(rst),.clk_out(clk_out));
always #10 clk=~clk;
initial begin
	$dumpfile("clk_div.vcd");
	$dumpvars(0);
	clk=0;rst=1;
	#2;
	rst=0;
	#2000;
	$finish;
end
endmodule

