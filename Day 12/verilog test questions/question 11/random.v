//random numbers from -100 to 100
module random;
reg signed[6:0]out;

initial begin
	repeat(10)begin
	out=$random;
	if(out<=100 && out>=-100)
	$display("output= %d",out);
end
end
endmodule
