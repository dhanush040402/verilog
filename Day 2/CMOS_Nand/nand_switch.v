module nand_gate_switch (output Y, input A,B);
    wire n1;
    supply1 power;
    supply0 ground;
    pmos p1(Y, power, A);
    pmos p2(Y, power, B);
    nmos n1_gate(n1,ground, B);
    nmos n2(Y, n1, A);
endmodule
