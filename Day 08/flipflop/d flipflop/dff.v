module dff(
input rst,en,d,clk,
output reg q
);
always @(posedge clk)begin
if(rst==1)q<=1'b0;
else if(en==1)q<=d;
end
endmodule
