module pipo(
input rst,load,clk,
input[3:0]pi,
output reg [3:0]po
);
always @ (posedge clk)begin
	if(rst)
		po<=4'b0000;
	else if(load)
		po<=pi;
		
	end
	endmodule
			
