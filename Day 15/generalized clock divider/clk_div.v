module clk_div #(parameter N=5) (
	input clk,rst, 
	output reg clk_out);
reg [$clog2(N)-1:0] count;
generate
	if(!(N%2)) begin : even
		always @(posedge clk or posedge rst) begin
			if(rst) begin
				count<=0;
				clk_out<=0;
			end
			else if (count == (N/2)-1) begin
				count<=0;
				clk_out<=~clk_out;
			end
			else
				count<=count+1;
		end
	end
	else begin : odd
		always @(posedge clk or negedge clk or posedge rst) begin
			if (rst) begin
				count<=0;
				clk_out<=0;
			end
			else if (count == (N-1)) begin
				count<=0;
				clk_out<=~clk_      
			end
			else
				count<=count+1;
		end
	end
endgenerate
endmodule
