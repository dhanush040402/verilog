module a2to4_decoder(output y0,y1,y2,y3, input i0,i1);
assign y0=~i0&~i1;
assign y1=~i0&i1;
assign y2=i0&~i1;
assign y3=i0&i1;
endmodule

