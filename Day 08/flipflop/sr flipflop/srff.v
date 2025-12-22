module srff(
input s,r,clk,
output reg q
);
always @ (posedge clk)begin
if(s && !r) q=1;
else if (!s && r) q=0;
else if(s && r) q=1'bx;
end
endmodule
