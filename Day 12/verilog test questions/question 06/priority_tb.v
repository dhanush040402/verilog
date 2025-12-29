module priority_tb;
reg [7:0]d;
wire [2:0]out;

priority dut(.d(d),.out(out));
initial begin
	$monitor("input = %b | output = %b | time = %0t ",d,out,$time);
	$dumpfile("priority.vcd");
	$dumpvars(0);

	d=8'b11111111;#10;
	d=8'b00000011;#10;
	d=8'b00001011;#10;

end
endmodule
