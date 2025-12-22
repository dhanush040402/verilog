module moore_overlapping_tb;
reg clk,rst,data;
wire detected;

moore_overlapping dut(.clk(clk),.rst(rst),.data(data),.detected(detected));

initial begin
	$dumpfile("moore_overlapping.vcd");
	$dumpvars(0);

	clk=0;
	
	rst=1;
	data=0;#10

	rst=0;#10

	data=0;#10;
	data=1;#10;
	data=0;#10;
	data=0;#10;
	data=1;#10;
	data=0;#10;
        data=0;#10;
	data=1;#10;  
	data=1;#10;  
	data=1;#10; 
	data=1;#10;
	data=1;#10;  
	$finish;#12;

end

always @(posedge clk)begin
	$display(" | clk = %b | reset = %b | State = %b | data = %b | detected = %b", clk, rst, dut.state, data, detected);
end

always #5 clk=~clk;

endmodule
