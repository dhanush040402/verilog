module perfect_tb;
reg [15:0]num;
wire perfect;
integer i;
perfect dut(.num(num),.perfect(perfect));
initial begin
	$monitor("number = %d | perfect = %b | time = %t",num,perfect,$time);
	$dumpfile("perfect.vcd");
	$dumpvars(0);

num=6;#1;
num=15;#1;
num=28;#1;
num=1000;#1;
num=8128;#1;
end
endmodule
