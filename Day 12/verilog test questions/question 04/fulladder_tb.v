module tb_nbit_full_adder;

    parameter N = 8;

    reg  [N-1:0] A, B;
    reg          Cin;
    wire [N-1:0] Sum;
    wire         Cout;

    // Single-line instantiation
    nbit_full_adder #(.N(N)) dut (.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Cout(Cout));

    initial begin
	    $dumpfile("fulladder.vcd");
	    $dumpvars(0);

        $display("Time\tA\t\B\t\Cin\t\Sum\t\Cout");

        A = 8'd10;  B = 8'd20;  Cin = 0;
        #5  $strobe("%0t\t%0d\t%0d\t%b\t%0d\t%b", $time, A, B, Cin, Sum, Cout);

        A = 8'd100; B = 8'd55;  Cin = 0;
        #5  $strobe("%0t\t%0d\t%0d\t%b\t%0d\t%b", $time, A, B, Cin, Sum, Cout);

        A = 8'd255; B = 8'd1;   Cin = 0;
        #5  $strobe("%0t\t%0d\t%0d\t%b\t%0d\t%b", $time, A, B, Cin, Sum, Cout);

        A = 8'd200; B = 8'd50;  Cin = 1;
        #5  $strobe("%0t\t%0d\t%0d\t%b\t%0d\t%b", $time, A, B, Cin, Sum, Cout);

        #10 $finish;
    end

endmodule

