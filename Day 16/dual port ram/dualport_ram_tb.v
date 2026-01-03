module dualport_ram_tb;
parameter width=4,location=16;
reg [width-1:0]indata;
reg [$clog2(location)-1:0]r_addr,w_addr;
reg clk,rw;
wire [width-1:0]outdata;
integer i;

dualport_ram #(width,location) dut(.clk(clk),.rw(rw),.indata(indata),.r_addr(r_addr),.w_addr(w_addr),.outdata(outdata));
initial begin
	$dumpfile("dualport_ram.vcd");
	$dumpvars(0);

	clk=0;rw=1;   
        w_addr=0;r_addr=0;indata=0;#20; 
        $display("\nWrite Mode:\n"); 
        for(i=0;i<location;i+=1) begin 
                w_addr = i;
                indata = $random;#20;
        end
        rw=0;
        $display("\nRead Mode:\n");
        for(i=0;i<location;i+=1) begin
                r_addr = i;#20;
        end
        
	$finish;
end

always #10 clk=~clk;

always @ (posedge clk)begin
	if(rw)
	$display("clk = %d | rw = %d | input = %b |  address = %b | time = %0t |",clk,rw,indata,w_addr,$time);
	else
	$display("clk = %d | rw = %d |  address = %b | output = %b | time = %0t |",clk,rw,r_addr,outdata,$time);

end
endmodule



