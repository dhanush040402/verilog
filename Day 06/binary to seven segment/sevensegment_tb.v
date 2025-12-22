module sevensegment_tb;
reg [3:0] bin;
wire [6:0] seg;
integer i;
sevensegment dut(.bin(bin),.seg(seg));
initial begin
	$monitor("TIme = %t | binary = %d | seven segment = %b |",$time,bin,seg);
	$dumpfile("sevensegment.vcd");
	$dumpvars(0);
	for(i=0;i<10;i=i+1)begin
		bin=i;
		#1;
	end
end
endmodule


