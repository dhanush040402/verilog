module dff_tb;
    reg rst, en, d, clk;
    wire q;

    dff dut(
        .rst(rst),
        .en(en),
        .d(d),
        .clk(clk),
        .q(q)
    );

    initial begin
        $monitor("data = %b | reset = %d | enable = %d | output = %b | time = %0t",
                  d, rst, en, q, $time);

        $dumpfile("dff.vcd");
        $dumpvars(0);

        clk = 0;

        rst = 0; en = 0; d = 1; #10;
        rst = 0; en = 1; d = 1; #20;
        rst = 0; en = 1; d = 0; #30;
        rst = 1; en = 0; d = 0; #40;
        rst = 0; en = 0; d = 1; #50;

        $finish;
    end

    always #5 clk = ~clk;

endmodule


