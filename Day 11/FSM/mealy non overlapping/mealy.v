//1101 sequence detector without overlapping
module mealy(
input clk,rst,data,
output reg detected
);

parameter [2:0]s0=0,s1=1,s2=2,s3=3;

reg [2:0]state,next;

always @ (posedge clk)begin
	if (rst)state<=0;
	else state<=next;
end

always @ (*)begin
	case(state)
		s0:next=(data)?s1:s0;
		s1:next=(data)?s2:s0;
		s2:next=(data)?s2:s3;
		s3:next=(data)?s0:s0;
		default:next=s0;
	endcase
end
always @(*) begin
        if (state == s3 && data == 1'b1)
            detected = 1'b1;
        else
            detected = 1'b0;
end

endmodule
