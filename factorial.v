module factorial(input [3:0] num , output reg [15:0] fact);
integer i;
always @(*) begin
	if (num ==0 | num ==1)begin
		fact=1;
	end
	else begin
	       fact=1;	
		for(i=2;i<=num;i=i+1)begin
			fact=fact*i;
		end
	end
end
endmodule

