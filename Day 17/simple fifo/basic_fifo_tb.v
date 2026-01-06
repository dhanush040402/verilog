module basic_fifo_tb;
reg clk,rst,w_en,r_en;
reg [7:0]indata;
wire [7:0]outdata;
integer i;
basic_fifo dut(.clk(clk),.rst(rst),.w_en(w_en),.r_en(r_en),.indata(indata),.outdata(outdata));

initial begin
	$dumpfile("basic_fifo.vcd");
	$dumpvars(0);
	clk=0;
	rst=1;w_en=0;r_en=0;indata=0;#10;
	rst=0;w_en=1;
	for(i=0;i<4;i++)begin
		indata=$random;
		#10;
	end
	$display("");
	w_en=0;r_en=1;#50;
	$finish;
end

always #5 clk=~clk;

always @ (posedge clk)begin
	if(w_en)begin
		$display("write data = %b | time = %0t |",indata,$time);
	end
	if(r_en)begin
		$display("read data = %b  | time = %0t |",outdata,$time);
	end
end
endmodule


