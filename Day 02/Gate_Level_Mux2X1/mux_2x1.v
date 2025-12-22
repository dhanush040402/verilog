module mux_2x1(output y , input S0,I0,I1,g1,g2,g3);
not(g1,S0);
and(g2,g1,I0);
and(g3,S0,I1);
or(y,g2,g3);
endmodule

