module adder_subtractor_tb;
reg  [3:0] A, B;
reg        op;
wire [3:0] result;
wire       carry;

adder_subtractor dut (.A(A), .B(B), .op(op), .result(result), .carry(carry));

initial begin
	 $monitor("time=%0t A=%b B=%b op=%b result=%b carry=%b", $time, A, B, op, result, carry);
	 $dumpfile("adder_subractor.vcd");  
	 $dumpvars(0);                                                                             

    A = 4'b0011; B = 4'b0001; op = 0;
    #10 A = 4'b0101; B = 4'b0011; op = 0;
    #10 A = 4'b1111; B = 4'b0001; op = 0;
    #10 A = 4'b1000; B = 4'b0010; op = 1;
    #10 A = 4'b0111; B = 4'b0001; op = 1;
    #10 A = 4'b0100; B = 4'b0100; op = 1;
    #10 A = 4'b1010; B = 4'b0011; op = 1;
    #10
    $finish;
end
endmodule

