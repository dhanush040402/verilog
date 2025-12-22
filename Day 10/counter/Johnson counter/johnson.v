module johnson(input clk,rst, output reg [3:0] q);
always @(posedge clk) begin
	if(rst) begin 
		q<=4'b0000;
	end
	else begin
		if ((!q[3] && !q[0]) | (q[3] && !q[0])) 
			q<={1'b1,q[3:1]};
		else if ((q[3] && q[0]) | (!q[3] && q[0]))
			q<={1'b0,q[3:1]};
	end
end
endmodule
