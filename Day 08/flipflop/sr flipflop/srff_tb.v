module srff_tb;
reg s,r,clk;
wire q;
srff dut(.s(s),.r(r),.clk(clk),.q(q));
initial begin
$monitor("set = %d | reset = %d | output = %d | time = %0t |",s,r,q,$time);
$dumpfile("srff.vcd");
$dumpvars(0);

clk=0;
s=1;r=0;#10;
s=0;r=1;#10;
s=0;r=0;#10;
s=1;r=1;#10;
$finish;
end
always #5 clk=~clk;
endmodule
