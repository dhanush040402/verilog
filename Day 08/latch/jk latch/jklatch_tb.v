module jklatch_tb;
reg j,k;
wire q;
jklatch dut(.j(j),.k(k),.q(q));
initial begin
$monitor("set = %d | reset = %d | output =%d | time = %0t |",j,k,q,$time);
$dumpfile("jklatch.vcd");
$dumpvars(0);
j=1;k=0;#10;
j=1;k=0;#10;
j=0;k=1;#10;
j=0;k=0;#10;
j=1;k=1;#10;
end
endmodule
