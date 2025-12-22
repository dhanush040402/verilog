module bishift_tb;
reg clk,rst,en,sin_l,sin_r,dir;
wire [3:0]q;
bishift dut(.clk(clk),.rst(rst),.en(en),.sin_l(sin_l),.sin_r(sin_r),.dir(dir),.q(q));
initial begin
	$monitor("|clock = %d | reset = %d | enable =%d | direction = %d | left serial in = %d | right serial in = %d |output = %b | time = %0t |",clk,rst,en,dir,sin_l,sin_r,q,$time);
       $dumpfile("bishift.vcd");
	$dumpvars(0);

clk=0;rst=1;en=0;dir=0;sin_l=0;sin_r=0;#10;

rst=0;en=1;

dir=1;sin_r=1;#10;
sin_r=0;#10;

dir=0;sin_l=1;#10;
sin_l=0;#10;
en=0;#10;
$finish;
end
always #5 clk=~clk;
endmodule
