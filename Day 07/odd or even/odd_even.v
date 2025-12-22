module odd_even(input [7:0] num,output reg odd,even);
always @(*)begin
	if(num[0]==0)begin
		even=1;
		odd=0;
	end
	else begin
		odd=1;
		even=0;
	end
end
endmodule

