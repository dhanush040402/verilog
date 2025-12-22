module binary_to_gray_tb;
reg  [3:0] gray;
wire [3:0] bin;
integer i;
gray_to_binary dut (.bin(bin), .gray(gray));
initial begin
    $monitor("time=%0t gray=%b binary=%b", $time, gray, bin);
    $dumpfile("gray_to_binary.vcd");
    $dumpvars(0);
    for(i=0;i<16;i=i+1)begin
	    gray=i;#1;
    end
    end
    endmodule
