module sipo_tb;
reg clk,rst,sin;
wire [3:0]pout;
sipo dut(.clk(clk),.rst(rst),.sin(sin),.pout(pout));
initial begin
	$monitor("reset = %d | serial input = %d | parallel out = %b | time = %0t |",rst,sin,pout,$time);
	$dumpfile("sipo.vcd");
	$dumpvars(0);
	 
    clk = 0;
    rst = 1;
    sin = 0;
    #5;


    rst = 0;

    // Apply serial data: 1 0 1 1
    #10 sin = 1;
    #20 sin = 0;
    #20 sin = 1;
    #20 sin = 1;


    #20 $finish;
end

always #10 clk = ~clk;

endmodule
