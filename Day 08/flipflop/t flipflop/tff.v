module tff(
input rst,en,clk,t,
output reg q
);
always @(posedge clk)begin
if(rst)q<=0;
else if(en)q<=~t;
end
endmodule
