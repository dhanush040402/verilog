module ram(
input [7:0]indata,
input [3:0]addr,
input clk,rw,
output reg [7:0]outdata);

reg [7:0]mem[15:0];

always @ (posedge clk)begin
	if(rw)begin
		mem[addr]<=indata;
	end
	outdata<=mem[addr];
end
endmodule

