module fibonacci_tb;
reg [3:0]n;
wire [15:0] fib;
integer i;
fibonacci dut(.n(n),.fib(fib));
initial begin
	$monitor("Time = %0t | number = %d | fibonacci = %d |)",$time,n,fib);
	$dumpfile("fibonacci.vcd");
	$dumpvars(0);
	for(i=0;i<16;i=i+1)begin
		n=i;#10;
	end
end
endmodule

