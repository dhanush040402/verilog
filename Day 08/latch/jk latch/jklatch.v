module jklatch(
input j,k,
output reg q
);
always @(*)begin
	if(j==1 && k==0)q=1;
	else if (j==0 && k==1)q=0;
	else if (j==1 && k==1)q=~q;
end
endmodule
