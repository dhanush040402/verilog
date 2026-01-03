module dualport_ram #(parameter width=4,location=16) (input clk,rw, input [$clog2(location)-1:0]r_addr,w_addr, input [width-1:0]indata, output reg[width-1:0]outdata);
reg [width-1:0]mem[location-1:0];
always @(posedge clk)begin
	if(rw)begin
		mem[w_addr]<=indata;
	end
	outdata<=mem[r_addr];
end
endmodule
