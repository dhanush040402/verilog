module dlatch(
input d,en,rst,
output reg q
);
always @(*)begin
	if(rst==1)
		q=0;
	else if (en==1)
		q=d;
end
endmodule

