module sync_fifo_tb;
parameter width=8, depth=4;

reg clk,rst,w_en,r_en;
reg[width-1:0]indata;
wire full,empty;
wire[width-1:0]outdata;
integer i;

sync_fifo #(width,depth) dut(.clk(clk),.rst(rst),.w_en(w_en),.r_en(r_en),.indata(indata),.outdata(outdata),.full(full),.empty(empty));

initial begin
	$dumpfile("sync_fifo.vcd");
	$dumpvars(0);

	clk=0;
	rst=1;indata=0;w_en=0;r_en=0;#10;

	rst=0;w_en=1;
	for(i=0;i<depth;i++)begin
		indata=$random;
		#10;
	end

	w_en=0;r_en=1;#50;

	$finish;

end

always #5 clk=~clk;

always @(posedge clk)begin
	if(w_en)
		$display("input data = %b | time = %0t ",indata,$time);
	else if(r_en)
		$display("output data = %b | time = %0t ",outdata,$time);
end
endmodule


