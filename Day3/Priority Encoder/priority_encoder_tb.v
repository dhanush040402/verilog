module priority_encoder_tb;
reg d0,d1,d2,d3;
wire a,b;
priority_encoder dut(.a(a),.b(b),.d0(d0),.d1(d1),.d2(d2),.d3(d3));
initial begin
	$monitor("Time = %t | d3 = %b |d2 = %b | d1 = %b | d0 = %b | a = %b | b = %b |",$time,d3,d2,d1,d0,a,b);
	$dumpfile("priority_encoder.vcd");
	$dumpvars(0);
	d3=0;d2=0;d1=0;d0=0;#10;
	d3=0;d2=0;d1=0;d0=1;#10;
	d3=0;d2=0;d1=1;d0=0;#10;
	d3=0;d2=0;d1=1;d0=1;#10;
	d3=0;d2=1;d1=0;d0=0;#10;
	d3=0;d2=1;d1=0;d0=1;#10;
	d3=0;d2=1;d1=1;d0=0;#10;
	d3=0;d2=1;d1=1;d0=1;#10;
	d3=1;d2=0;d1=0;d0=0;#10;
	d3=1;d2=0;d1=0;d0=1;#10;
	d3=1;d2=0;d1=1;d0=0;#10;
	d3=1;d2=0;d1=1;d0=1;#10;
	d3=1;d2=1;d1=0;d0=0;#10;
	d3=1;d2=1;d1=0;d0=1;#10; 
	d3=1;d2=1;d1=1;d0=0;#10;
	d3=1;d2=1;d1=1;d0=1;#10;
	$finish;
end
endmodule


