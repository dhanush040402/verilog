module bishift(
input clk,rst,en,sin_l,sin_r,dir,
output reg [3:0]q
);
always @(posedge clk)begin
if(rst)
	q<=4'b0000;
else if(en)
	if(dir)
		q<={q[2:0],sin_r};
	else
		q<={sin_l,q[3:1]};
end
endmodule
