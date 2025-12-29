//Design 8:3 priority encoder using casez statements.

module priority(output reg[2:0]out, input [7:0]d);
always @(*)begin
	casez(d)
		8'b00000001:out=0;
		8'b0000001z:out=1;
		8'b000001zz:out=2;
		8'b00001zzz:out=3;
		8'b0001zzzz:out=4;
		8'b001zzzzz:out=5;
		8'b01zzzzzz:out=6;
		8'b1zzzzzzz:out=7;
	endcase
end

endmodule
