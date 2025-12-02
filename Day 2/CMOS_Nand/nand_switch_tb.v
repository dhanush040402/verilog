module nand_switch_tb;
reg A,B;
wire Y;
nand_gate_switch dut(.A(A),.B(B),.Y(Y));  
initial begin
	$monitor("Time = %t | A = %d | B = %d | Y=%d",$time,A,B,Y);
	$dumpfile("nand_switch.vcd");
	$dumpvars(0);
	A=0;B=0;#10;
	A=0;B=1;#10;
	A=1;B=0;#10;
	A=1;B=1;#10;
	$finish;
end
endmodule

