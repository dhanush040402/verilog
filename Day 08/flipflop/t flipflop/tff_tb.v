module tff_tb;
reg rst,en,clk,t;
wire q;
tff dut(.rst(rst),.en(en),.clk(clk),.t(t),.q(q));
initial begin
$monitor("reset = %d | enable = %d | data = %d | output = %d | time = %0t |",rst,en,t,q,$time);
$dumpfile("tff.vcd");
$dumpvars(0);

clk=0;
rst=0;en=1;t=1;#10;
rst=0;en=1;t=0;#10;
rst=0;en=0;t=1;#10;
rst=0;en=0;t=1;#10;
rst=1;en=0;t=1;#10;
$finish;
end
always #5 clk=~clk;
endmodule
