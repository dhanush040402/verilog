module prime_nbit_tb;
parameter N = 8;              
reg  [N-1:0] num;
wire prime;
prime_nbit #(N) dut(.num(num),.prime(prime));
integer i;
initial begin
    $dumpfile("prime_nbit.vcd");
    $dumpvars(0, prime_nbit_tb);
    for (i = 0; i < (1 << N); i = i + 1) begin
        num = i;
        #10;
    end

    $finish;
end

initial begin
    $monitor("Time=%0t | num=%0d | prime=%b",$time, num, prime);
end
endmodule

