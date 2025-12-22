module tlatch(
input  rst,en,t,
output reg q
);
always @(*) begin
if(rst)
q=0;
else if(en)
	q=~t;
end
endmodule

