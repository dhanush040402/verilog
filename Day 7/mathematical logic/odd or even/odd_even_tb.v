module odd_even_tb;
reg [7:0]num;
wire odd;
wire even;
odd_even dut(.num(num),.odd(odd),.even(even));
initial begin
	$monitor("Time = %t | number = %d | odd = %d | even = %d |",$time,num,odd,even);
	$dumpfile("odd_even.vcd");
	$dumpvars(0);
	num=0;#1;
	num=5;#1;
	num=88;#1;
	num=255;#1;
	$finish;
end
endmodule

