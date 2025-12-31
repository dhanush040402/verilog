module clk_even #(parameter N = 4)(
input clk,rst,
output reg clk_out);

reg [$clog2(N)-1:0]count;

always @ (posedge clk or posedge rst)begin
        if(rst)begin
                count<=0;
                clk_out<=0;
        end
        else if(count==(N/2-1))begin
                count<=0;
                clk_out<=~clk_out;
        end
        else count<=count+1;
end
endmodule

