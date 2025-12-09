module even_parity_checker_tb;
reg  [3:0] data;
reg parity;
wire error;
integer i;
even_parity_checker dut (.data(data), .parity(parity),.error(error));
initial begin
    $monitor("time=%0t data=%b parity=%b error=%b", $time, data, parity,error);
    $dumpfile("even_parity_checker.vcd");
    $dumpvars(0);
    data = 4'b0000; parity = 0;#1;
    data = 4'b0001; parity = 1;#1;
    data = 4'b0011; parity = 0;#1;
    data = 4'b0101; parity = 0;#1;
    data = 4'b0110; parity = 1;#1;
    data = 4'b1111; parity = 0;#1;
    data = 4'b1010; parity = 1;#1;
    data = 4'b1101; parity = 1;#1;
    $finish;
   
    end
    endmodule
