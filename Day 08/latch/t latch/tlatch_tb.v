module tlatch_tb;
reg t,en,rst;
wire q;
tlatch dut(.t(t),.en(en),.rst(rst),.q(q));
initial begin
$monitor("reset = %d | enable = %d | data = %d | output = %d | time = %0t |",rst,en,t,q,$time);
$dumpfile("tlatch.vcd");
$dumpvars(0);
        rst = 0; en = 0; t = 1; #10;
        rst = 0; en = 1; t = 1; #20;
        rst = 0; en = 1; t = 0; #30;
        rst = 1; en = 0; t = 0; #40;
        rst = 0; en = 0; t = 1; #50;
end
endmodule
