module fulladder_tb;
reg a,b,cin;
wire S,C;
fulladder dut(.a(a),.b(b),.cin(cin),.S(S),.C(C));
initial begin
	$monitor("Time = %t | A = %d | B = %d| Cin = %d | S = %d | C = %d ",$time,a,b,cin,S,C);
        $dumpfile("fulladder.vcd");
	$dumpvars(0,fulladder_tb);
	a=0;b=0;cin=0;#1;
	a=0;b=0;cin=1;#1;
	a=0;b=1;cin=0;#1;
	a=0;b=1;cin=1;#1;
	a=1;b=0;cin=0;#1;
	a=1;b=0;cin=1;#1;
	a=1;b=1;cin=0;#1;
	a=1;b=1;cin=1;#1;
$finish;
end
endmodule


