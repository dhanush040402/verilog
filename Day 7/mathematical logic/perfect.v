module perfect(
input [15:0]num,
output reg perfect
);
integer i;
reg [15:0]I;
always @(*) begin
	I=0;
for(i=0;i<=(num/2);i=i+1)begin
	if (num%i==0)begin
		I=I+i;
	end
		else begin
			I=I+0;

	end
end
if(num==I)begin
perfect=1;
end
else begin
perfect=0;
end
end
endmodule

