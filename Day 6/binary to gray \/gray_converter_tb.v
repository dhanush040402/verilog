module binary_to_gray_tb;
reg  [3:0] bin;
wire [3:0] gray;
integer i;
binary_to_gray dut (.bin(bin), .gray(gray));
initial begin
    $monitor("time=%0t bin=%b gray=%b", $time, bin, gray);
    $dumpfile("binary_to_gray.vcd");
    $dumpvars(0);
    for(i=0;i<16;i=i+1)begin
	    bin=i;#1;
    end
    end
    endmodule

