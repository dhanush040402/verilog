module moore_tb;
reg clk,reset,data;
wire detected;

fsm dut(.clk(clk),.reset(reset),.data(data),.detected(detected));

initial begin
	$dumpfile("fsm.vcd");
	$dumpvars(0);

	clk=0;
	
	reset=1;
	data=0;#10

	reset=0;#10

	data=0;#10;
	data=0;#10;
	data=0;#10;
	data=0;#10;
	data=0;#10;
	data=1;#10;
        data=0;#10;
	data=1;#10;  
	data=1;#10;  
	data=1;#10; 
	data=1;#10;
	data=1;#10;  
	$finish;#12;

end

always @(posedge clk)begin
	$display(" | clk = %b | reset = %b | State = %d | data = %b | detected = %b", clk, reset, dut.state, data, detected);
end

always #5 clk=~clk;

endmodule
