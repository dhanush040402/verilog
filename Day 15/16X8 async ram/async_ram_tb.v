module async_ram_tb;
reg [7:0]indata;
reg [3:0]addr;
reg clk,rw;
wire [7:0]outdata;
integer i;


async_ram dut(.clk(clk),.rw(rw),.indata(indata),.addr(addr),.outdata(outdata));
initial begin
	$dumpfile("async_ram.vcd");
	$dumpvars(0);

	clk=0;rw=1;   
        addr=0;indata=0;#20; 
        $display("\nWrite Mode:\n"); 
        for(i=0;i<16;i+=1) begin 
                addr = i;
                indata = $random;#20;
        end
        rw=0;
        $display("\nRead Mode:\n");
        for(i=0;i<16;i+=1) begin
                addr = i;#20;
        end
        
	$finish;
end

always #5 clk=~clk;

always @ (posedge clk)begin
	$display("clk = %d | rw = %d | input = %b |  address = %b | output = %b | time = %0t |",clk,rw,indata,addr,outdata,$time);
end
endmodule



