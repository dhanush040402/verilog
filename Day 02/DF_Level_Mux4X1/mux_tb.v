module mux_tb;
reg S0,S1,I0,I1,I2,I3;
wire y;
mux dut(.S0(S0),.S1(S1),.I0(I0),.I1(I1),.I2(I2),.I3(I3),.y(y));
initial begin
	$monitor("time = %t | S0 = %d |  S1 = %d | I0 = %d | I1 = %d | I2 = %d | I3 = %d | y = %d |",$time,S0,S1,I0,I1,I2,I3,y);
	$dumpfile("mux.vcd");
	$dumpvars(0);
	S0=0;S1=0;I0=1;I1=0;I2=0;I3=0;#1;
	S0=1;S1=0;I0=0;I1=1;I2=0;I3=0;#1;
	S0=0;S1=1;I0=0;I1=0;I2=1;I3=0;#1;
	S0=1;S1=1;I0=0;I1=0;I2=0;I3=1;#1;
     	$finish;
end
endmodule
