module mux8(input [7:0]data,input [2:0]select,output y);
assign y=data[select];
endmodule
