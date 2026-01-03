module singleport_ram #(parameter width = 4 , location = 8) (input clk,rw, input [$clog2(location)-1:0]addr, input [width-1:0]indata, output reg[width-1:0]outdata);
reg [width-1:0]mem[location-1:0];
always @ (posedge clk)begin
		if(rw) begin
			mem[addr] <= indata;   
			outdata   <= 0;
		end
		outdata <= mem[addr];
	end
	endmodule	
