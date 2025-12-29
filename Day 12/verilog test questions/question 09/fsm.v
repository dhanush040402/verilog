//111 or 000 overlapping sequence detector

module fsm(
input clk,reset,data,
output detected
);

parameter s0=0,s1=1,s2=2,s3=3,s4=4,s5=5,s6=6;
reg [3:0]state,next;


always @(posedge clk)begin
	if(reset)state<=s0;
	else state<=next;
end


always @(*)begin
	case(state)
		s0:next=data?s3:s1;
		s1:next=data?s3:s2;
		s2:next=data?s3:s5;
		s3:next=data?s4:s1;
		s4:next=data?s6:s1;
		s5:next=data?s0:s5;
		s6:next=data?s6:s0;
		default:next=s0;
	endcase
end

assign detected=(state==s5 || state ==s6);

endmodule


