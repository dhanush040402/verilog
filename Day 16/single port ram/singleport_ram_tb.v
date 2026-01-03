module singleport_ram_tb;
parameter width=4,location=16;
reg [width-1:0]indata;
reg [$clog2(location)-1:0]addr;
reg clk,rw;
wire [width-1:0]outdata;
integer i;

singleport_ram #(width,location) dut(.clk(clk),.rw(rw),.indata(indata),.addr(addr),.outdata(outdata));
initial begin
	$dumpfile("singleport_ram.vcd");
	$dumpvars(0);

	clk=0;rw=1;   
        addr=0;indata=0;#20; 
        $display("\nWrite Mode:\n"); 
        for(i=0;i<location;i+=1) begin 
                addr = i;
                indata = $random;#20;
        end
        rw=0;
        $display("\nRead Mode:\n");
        for(i=0;i<location;i+=1) begin
                addr = i;#20;
        end
        
	$finish;
end

always #10 clk=~clk;

always @ (posedge clk)begin
	$display("clk = %d | rw = %d | input = %b |  address = %b | output = %b | time = %0t |",clk,rw,indata,addr,outdata,$time);
end
endmodule



