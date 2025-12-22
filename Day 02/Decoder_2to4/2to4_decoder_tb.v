module a2to4_decoder_tb;
reg i0,i1;
wire y0,y1,y2,y3;
a2to4_decoder dut(.i0(i0),.i1(i1),.y0(y0),.y1(y1),.y2(y2),.y3(y3));
initial begin
	$monitor("Time = %t | i0 = %d | i1 = %d | y0 = %d | y1 = %d | y2 = %d | y3 = %d |",$time,i0,i1,y0,y1,y2,y3);
	$dumpfile("decoder.vcd");
	$dumpvars(0);
	i0=0;i1=0;#1;
	i0=0;i1=1;#1;
	i0=1;i1=0;#1;
	i0=1;i1=1;#1;
	$finish;
end
endmodule
/*Time =                  0 | i0 = 0 | i1 = 0 | y0 = 1 | y1 = 0 | y2 = 0 | y3 = 0 |
Time =                    1 | i0 = 0 | i1 = 1 | y0 = 0 | y1 = 1 | y2 = 0 | y3 = 0 |
Time =                    2 | i0 = 1 | i1 = 0 | y0 = 0 | y1 = 0 | y2 = 1 | y3 = 0 |
Time =                    3 | i0 = 1 | i1 = 1 | y0 = 0 | y1 = 0 | y2 = 0 | y3 = 1 |*/



