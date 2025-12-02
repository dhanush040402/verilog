module mux(output y,input S1,S0,I0,I1,I2,I3);
assign y =(~S0&~S1&I0 | S0&~S1&I1 | S1&~S0&I2 | S1&S0&I3);
endmodule
