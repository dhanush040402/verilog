module AND_2_tb;
reg A, B;
wire Y;
AND_2 dut(.A(A),.B(B),.Y(Y));
initial begin
    $monitor ("%t | A = %d| B = %d| Y = %d", $time, A, B, Y);
    $dumpfile("and.vcd");
    $dumpvars(0);
    A = 0; B = 0;
 #1 A = 0; B = 1;
 #1 A = 1; B = 0;
 #1 A = 1; B = 1;#1;
    $finish;
end
endmodule
