//1010 sequence detector


module moore_fsm(
input clk,rst,data,
output detected
);

parameter [2:0]s0=0,
	s1=1,
	s2=2,
	s3=3,
	s4=4;

reg [2:0]state,next;

always @ (posedge clk)begin
	if(rst)state<=s0;
	else state<=next;

end

always @(*) begin
	case(state)
	s0:next=(data)?s1:s0;
	s1:next=(data)?s1:s2;
	s2:next=(data)?s3:s0;
	s3:next=(data)?s1:s4;
	s4:next=(data)?s1:s0;

	default:next=s0;
endcase
end
assign detected =(state==s4);
endmodule

