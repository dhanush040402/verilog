`timescale 1ns/1ps

module traffic_tb;

    // Testbench signals
    reg clk;
    reg rst;

    wire e_l,e_r,e_s;
    wire s_l,s_r,s_s;
    wire w_l,w_r,w_s;
    wire n_l,n_r,n_s;

    // Instantiate DUT
    traffic dut (
        .clk(clk),
        .rst(rst),
        .e_l(e_l), .e_r(e_r), .e_s(e_s),
        .s_l(s_l), .s_r(s_r), .s_s(s_s),
        .w_l(w_l), .w_r(w_r), .w_s(w_s),
        .n_l(n_l), .n_r(n_r), .n_s(n_s)
    );

    // Clock generation: 50 MHz
    initial begin
        clk = 0;
        forever #10 clk = ~clk;   // 20 ns period
    end

    // Reset and simulation control
    initial begin
        rst = 1;
        #100;
        rst = 0;

        // Run long enough to see full FSM cycle (8 seconds)
        #9_000_000_000;

        $finish;
    end

    // Waveform dump
    initial begin
        $dumpfile("traffic.vcd");
        $dumpvars(0, traffic_tb);
    end

    // Console monitoring (once per state change)
    initial begin
        $display("Time(s) | State | E(G,Y,R) S(G,Y,R) W(G,Y,R) N(G,Y,R)");
        forever begin
            @(posedge dut.tick);
            $display("%0t | %0d | %b %b %b   %b %b %b   %b %b %b   %b %b %b",
                     $time/1_000_000_000,
                     dut.state,
                     e_r,e_s,e_l,
                     s_r,s_s,s_l,
                     w_r,w_s,w_l,
                     n_r,n_s,n_l);
        end
    end

endmodule



















































