module pipo_tb;
reg rst,load,clk;
reg [3:0]pi;
wire [3:0]po;
pipo dut(.rst(rst),.load(load),.clk(clk),.pi(pi),.po(po));
initial begin
$monitor("reset = %d | load = %b | Parallel in = %b | Parallel out = %b | time = %0t |",rst,load,pi,po,$time);
$dumpfile("pipo.vcd");
$dumpvars(0);

clk=0;rst=1;pi=4'b0000;load=0;#10;
rst=0;load=1;pi=4'b1010;#20;
load=0;pi=4'b0101;#20;
load=1;pi=4'b1111;#20;
$finish;
end
always #5 clk=~clk;
endmodule



