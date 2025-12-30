module vending_tb;
reg clk,rst,c5,c10;
wire dispense,balance5;
vending dut(.clk(clk),.rst(rst),.c5(c5),.c10(c10),.dispense(dispense),.balance5(balance5));
initial begin
	$dumpfile("vending.vcd");
	$dumpvars(0);

	clk = 0;
        rst = 1;
        c5  = 0;
        c10 = 0;

        #10 rst = 0;

        #10 c5 = 1;
        #10 c5 = 0;

        #10 c5 = 1;
        #10 c5 = 0;

        #10 c5 = 1;
        #10 c5 = 0;

        #20 c5 = 1;
        #10 c5 = 0;

        #10 c10 = 1;
        #10 c10 = 0;

        #20 c10 = 1;
        #10 c10 = 0;

        #10 c5 = 1;
        #10 c5 = 0;

        #20 c10 = 1;
        #10 c10 = 0;

        #10 c10 = 1;
        #10 c10 = 0;

        #50 $finish;
    end

always #5 clk=~clk;

always @(posedge clk && rst==0) begin
        $display("| c5=%b | c10=%b | dispense=%b | balance5=%b | TIme = %0t |", c5, c10, dispense, balance5,$time);
    end
endmodule
