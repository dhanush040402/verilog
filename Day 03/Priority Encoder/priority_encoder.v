module priority_encoder(output a,b, input d0,d1,d2,d3);
assign a = d2|d3;
assign b = d3|(~d2&d1);
endmodule
