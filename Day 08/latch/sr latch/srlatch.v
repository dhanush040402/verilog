module srlatch(input s,r, output reg q);
always @(*)begin
	if(s==0 && r==1) q=0;
	else if(s==1 && r==0)q=1;
	else if(s==1 && r==1)q=1'bx;
end
endmodule
