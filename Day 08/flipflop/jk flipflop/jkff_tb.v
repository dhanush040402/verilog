module jkff_tb;
reg j,k,clk;
wire q;
jkff dut(.j(j),.k(k),.clk(clk),.q(q));
initial begin
$monitor("set = %d | reset = %d | output = %d | time = %0t |",j,k,q,$time);
$dumpfile("jkff.vcd");
$dumpvars(0);

clk=0;
j=1;k=0;#10;
j=0;k=1;#10;
j=0;k=0;#10;
j=1;k=1;#10;
$finish;
end
always #5 clk=~clk;
endmodule
