module rc_adder_tb;
reg [3:0] a,b;
reg cin;
wire [3:0] sum;
wire cout;
rca dut(.A(a),.B(b),.Cin(cin),.Sum(sum),.Cout(cout));
initial begin
	$monitor("Time = %t | A = %b | B = %b | Cin = %b | S = %b | C = %b ",$time,a,b,cin,sum,cout);
        $dumpfile("rca.vcd");
	$dumpvars(0);
	a=4'b0001;b=4'b1000;cin=1;#10;
	a=4'b0011;b=4'b1100;cin=0;#10;
	a=4'b0111;b=4'b1110;cin=1;#10;
	a=4'b1111;b=4'b1111;cin=0;#10;
	$finish;
end
endmodule
