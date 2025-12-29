`timescale 1s/1ms

module shiftled_tb;
reg clk,rst,shift_in;
wire [3:0]led;
shiftled dut(.clk(clk),.rst(rst),.shift_in(shift_in),.led(led));
initial begin
	$monitor("reset = %d | shift input = %d | led out = %b | time = %0t |",rst,shift_in,led,$time);
	$dumpfile("shiftled.vcd");
	$dumpvars(0);
	 
    clk = 0;
    rst = 1;
    shift_in = 0;
    #5;


    rst = 0;

   
    #1 shift_in = 1;
    #1 shift_in = 0;
    #1 shift_in = 1;
    #1 shift_in = 1;


    #5 $finish;
end

always #0.5 clk = ~clk;

endmodule

