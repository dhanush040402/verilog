module srlatch_tb;
reg s,r;
wire q;
srlatch dut(.s(s),.r(r),.q(q));
initial begin
$monitor("set = %d | reset = %d | output =%d | time = %0t |",s,r,q,$time);
$dumpfile("srlatch.vcd");
$dumpvars(0);
s=1;r=0;#10;
s=1;r=0;#10;
s=0;r=1;#10;
s=0;r=0;#10;
s=1;r=1;#10;
end
endmodule
