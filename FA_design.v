module fulladder(output S,C, input a,b,cin);
assign S=a^b^cin;
assign C=((a&b)|(b&cin)|(a&cin));
endmodule


