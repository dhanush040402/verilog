module alu(
input [7:0]a,
input [7:0]b,
input [3:0]alu_select,
output [7:0]alu_out
);
reg [7:0]alu_result;
assign alu_out=alu_result;
always @(*) begin
	case(alu_select)
		4'b0000://addition
			alu_result=a+b;

		4'b0001://subraction
                        alu_result=a-b;
		4'b0010://multiplication
                        alu_result=a*b;
		4'b0011://division
                        alu_result=a/b;
		4'b0100://AND gate
                        alu_result=a&b;
		4'b0101://Or gate
                        alu_result=a|b;
		4'b0110://Xor gate
                        alu_result=a^b;
		4'b0111://Xnor gate
                        alu_result=~(a^b);
		4'b1000://nor gate
                        alu_result=~(a|b);
		4'b1001://Nand gate
                        alu_result=~(a&b);
		4'b1010://Greater comparison
                        alu_result=(a>b)? 8'd1:8'd0;
		4'b1011://Equal to
                        alu_result=(a==b)? 8'd1:8'd0;
		4'b1100://logical left shift
                        alu_result=a<<1;
		4'b1101://logical right shift
                        alu_result=a>>1;
		4'b1110://rotate left
                        alu_result={a[6:0],a[7]};
		4'b1111://rotate right
                        alu_result={a[0],a[7:1]};
		default alu_result=8'd0;
	endcase
end
endmodule



