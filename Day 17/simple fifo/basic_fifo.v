module basic_fifo(
input clk,rst,w_en,r_en,
input [7:0]indata,
output reg[7:0]outdata);

reg [7:0]mem[3:0];
reg [1:0]w_ptr,r_ptr;

always @ (posedge clk)begin
	if(rst)begin
		w_ptr<=0;
		r_ptr<=0;
		
	end
	else if(w_en)begin
		mem[w_ptr]<=indata;
		w_ptr=w_ptr+1;
	end
	else if(r_en)begin
		outdata<=mem[r_ptr];
		r_ptr=r_ptr+1;
	end
end
endmodule
