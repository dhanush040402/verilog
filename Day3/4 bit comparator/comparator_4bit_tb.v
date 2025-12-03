module comparator_4bit_tb;
 reg  [3:0] A;
 reg  [3:0] B;
 wire A_greater;
 wire A_equal;
 wire A_smaller;
 comparator_4bit dut ( .A(A),.B(B),.A_greater(A_greater),.A_equal(A_equal),.A_smaller(A_smaller) );
initial begin
        $dumpfile("comparator.vcd");
        $dumpvars(0);
        
        $display("Time |   A   |   B   |  >  =  < ");
        $monitor("%2t   | %b | %b |  %b  %b  %b", $time, A, B, A_greater, A_equal, A_smaller);

        A = 4'b0000; B = 4'b0000; #10; 
        A = 4'b0101; B = 4'b0011; #10;
        A = 4'b0010; B = 4'b0110; #10;
        A = 4'b1111; B = 4'b0111; #10;
        A = 4'b1000; B = 4'b1000; #10;
        A = 4'b0100; B = 4'b1001; #10; 
	 $finish;
end
endmodule

