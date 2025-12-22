`timescale 1ns/1ps

module jk_ff_using_sr_tb;

    reg clk;
    reg rst;
    reg j;
    reg k;
    wire q;

    jk_ff_using_sr dut (
        .clk(clk),
        .rst(rst),
        .j(j),
        .k(k),
        .q(q)
    );

    // Clock generation (10 ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
        $dumpfile("jk_ff_using_sr.vcd");
        $dumpvars(0, jk_ff_using_sr_tb);

        // Initialize
        rst = 1;
        j   = 0;
        k   = 0;
        #12;
        rst = 0;

        // JK = 00 → Hold
        @(negedge clk);
        j = 0; k = 0;
        #20;

        // JK = 01 → Reset
        @(negedge clk);
        j = 0; k = 1;
        #20;

        // JK = 10 → Set
        @(negedge clk);
        j = 1; k = 0;
        #20;

        // JK = 11 → Toggle (multiple cycles)
        @(negedge clk);
        j = 1; k = 1;
        #60;

        // Back to Hold
        @(negedge clk);
        j = 0; k = 0;
        #20;

        $finish;
    end

    // Monitor
    initial begin
        $monitor("Time=%0t | J=%b K=%b | Q=%b",
                 $time, j, k, q);
    end

endmodule

