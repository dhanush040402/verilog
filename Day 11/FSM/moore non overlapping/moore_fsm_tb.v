module moore_fsm_tb;
reg clk, rst, data;
wire detected;

	// instantiation
	moore_fsm morfsm(.clk(clk), .rst(rst), .data(data), .detected(detected));

	// clocl generation
	initial begin
		clk = 1'b0;
		forever #5 clk = ~clk;
	end

	// Display and test cases
	always @(posedge clk) begin
		$display(" | clk = %b | reset = %b | State = %b | data = %b | detected = %b", clk, rst, morfsm.state, data, detected);
	end

	initial begin
		$dumpfile("moore_fsm.vcd");
		$dumpvars;

		// reset
		rst = 1'b1;
		data = 1'b0; #10;

		
		// De-assert reset		
		rst = 1'b0; #10;

		// test case
		data = 1'b1; #10;
	       	data = 1'b0; #10;
		data = 1'b1; #10;
		data = 1'b0; #10;
		data = 1'b1; #10;
		data = 1'b0; #10;
		data = 1'b1; #10;
		data = 1'b0; #10;
		data = 1'b1; #10;
		data = 1'b0; #10;
		data = 1'b1; #10;
		data = 1'b0; #10;
		data = 1'b1; #10;
		data = 1'b0; #10;

		#12 $finish;
	end

endmodule
