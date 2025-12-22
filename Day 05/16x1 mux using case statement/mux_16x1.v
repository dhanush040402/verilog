module mux_16x1(
input [3:0]select,
input [15:0]data,
output reg y
);
always @(*) begin
	case(select)
		4'b0000:
			y=data[0];
                4'b0001:
                        y=data[1];
                4'b0010:
                        y=data[2];
                4'b0011:
                        y=data[3];
                4'b0100:
                        y=data[4];
                4'b0101:
                        y=data[5];
                4'b0110:
                        y=data[6];
                4'b0111:
                        y=data[7];
                4'b1000:
                        y=data[8];
                4'b1001:
                        y=data[9];
                4'b1010:
                        y=data[10];
                4'b1011:
                        y=data[11];
                4'b1100:
                        y=data[12];
                4'b1101:
                        y=data[13];
                4'b1110:
                        y=data[14];
                4'b1111:
                        y=data[15];
		default
		y=4'b0000;
	endcase
end
endmodule


