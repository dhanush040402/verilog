module led_blink_1hz_tb;

    reg  clk;
    reg  rst;
    wire led;

    // Instantiate the DUT (Device Under Test)
    led_blink_1hz dut (
        .clk(clk),
        .rst(rst),
        .led(led)
    );

    // -------------------------------------------------
    // Clock generation: 50 MHz clock (20 ns period)
    // -------------------------------------------------
    initial begin
        clk = 1'b0;
        forever #10 clk = ~clk;   // toggle every 10 ns
    end

    // -------------------------------------------------
    // Reset and stimulus
    // -------------------------------------------------
    initial begin
        // Dump waveform for GTKWave / ModelSim
        $dumpfile("ledblinking.vcd");
        $dumpvars(0, led_blink_1hz_tb);

        // Apply synchronous reset
        rst = 1'b1;
        #40;            // hold reset for 2 clock cycles
        rst = 1'b0;

        // Run simulation long enough to see LED toggles
        // LED toggles every 0.5 seconds = 500,000,000 ns
        #2_000_000_000; // simulate 2 seconds

        $finish;
    end

    // -------------------------------------------------
    // Monitor LED behavior
    // -------------------------------------------------
    initial begin
        $display("Time (ns)\tReset\tLED");
        $monitor("%0t\t%b\t%b", $time, rst, led);
    end

endmodule
 
