module mux_2x1_tb;
reg g1,g2,g3,S0,I0,I1;
wire y;
mux_2x1 dut(.g1(g1),.g2(g2),.g3(g3),.S0(S0),.I0(I0),.I1(I1),.y(y));
initial begin
	$monitor("Time = %t | S0 = %b | I0 = %b | I1 = %b |",$time,S0,I0,I1);
	$dumpfile("mux_2x1.vcd");
	$dumpvars(0);
	S0=0;I0=1;I1=0;#10;
	S0=1;I0=0;I1=1;#10;
	$finish;
end
endmodule
	

