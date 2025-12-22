module mealy_tb;
reg clk,rst,data;
wire detected;

mealy dut(.clk(clk),.rst(rst),.data(data),.detected(detected));

initial begin
	$dumpfile("mealy.vcd");
	$dumpvars(0);

	clk=0;

	rst=1;data=0;

	rst=0;#10;

	data=1;#10;
	data=1;#10;
	data=0;#10;
	data=1;#10;
	data=1;#10;
	data=0;#10;
	data=1;#10;
	data=0;#10;
	data=0;#10;
	data=1;#10;
	data=1;#10;
	data=0;#10;
	data=0;#10;
	
	$finish;#12;

end

always @ (posedge clk)begin
	$display("clk = %d | reset = %d | state = %b | data = %b | detected = %d | time =%0t |",clk,rst,dut.state,data,detected,$time);
end

always #5 clk=~clk;

endmodule
