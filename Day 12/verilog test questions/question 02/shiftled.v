/* Implement a 4-bit shift register that shifts a pattern across 4 LEDs.
Requirements:
Input: clk, rst, shift_in
Output: led[3:0]
Shift every 0.5 seconds */

module shiftled(
input clk,rst,shift_in,
output [3:0] led
);
reg [3:0]shift_reg;
always @(posedge clk or negedge clk)begin
	if(rst)
		shift_reg<=4'b0000;
	else
		shift_reg<={shift_reg[2:0],shift_in};
end
assign led=shift_reg;
endmodule
