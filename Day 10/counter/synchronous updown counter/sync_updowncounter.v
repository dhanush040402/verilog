module sync_updowncounter(
input clk,rst,mode,
output reg [3:0]q
);
always @ (posedge clk or posedge rst)begin
	if(mode)begin
		if(rst)q<=4'b0000;
		else q<=q+1;
	end
	else if(!mode)begin
		if(rst)q<=4'b1111;
		else q<=q-1;
	end
end
endmodule
