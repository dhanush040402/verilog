module palindrome_tb;
reg  [15:0] num;
wire pal;
palindrome dut (.num(num),.pal(pal));
integer i;
initial begin
    $dumpfile("palindrome.vcd");
    $dumpvars(0);
    for (i = 1000; i <= 9999; i = i + 1) begin
        num = i;#1;
    end
$finish;
end
initial begin
    $monitor("Time=%0t | num=%0d | pal=%b", $time, num, pal);
end
endmodule

