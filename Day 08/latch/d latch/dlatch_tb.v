module dlatch_tb;
reg d,en,rst;
wire q;
dlatch dut(.d(d),.en(en),.rst(rst),.q(q));
initial begin
$monitor("reset = %d | enable = %d | data = %d | output = %d | time = %0t |",rst,en,d,q,$time);
$dumpfile("dlatch.vcd");
$dumpvars(0);
        rst = 0; en = 0; d = 1; #10;
        rst = 0; en = 1; d = 1; #20;
        rst = 0; en = 1; d = 0; #30;
        rst = 1; en = 0; d = 0; #40;
        rst = 0; en = 0; d = 1; #50;
end
endmodule
