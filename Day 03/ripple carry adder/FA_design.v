module fulladder(input a,b,cin,output S,C);
assign S=a^b^cin;
assign C=((a&b)|(b&cin)|(a&cin));
endmodule


