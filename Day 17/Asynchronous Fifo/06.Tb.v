`timescale 1ns/1ps

module async_fifo_tb;

  parameter depth = 16;
  parameter data_width = 8;
  parameter PTR_WIDTH = $clog2(depth);

  reg wclk, rclk;
  reg wrst, rrst;
  reg w_en, r_en;
  reg [data_width-1:0] data_in;
  wire [data_width-1:0] data_out;

  wire full, empty;

  async_fifo_top #(
    .depth(depth),
    .data_width(data_width)
  ) dut (
    .wclk(wclk),
    .rclk(rclk),
    .wrst(wrst),
    .rrst(rrst),
    .w_en(w_en),
    .r_en(r_en),
    .data_in(data_in),
    .data_out(data_out),
    .full(full),
    .empty(empty)
  );

  initial wclk = 0;
  always #5 wclk = ~wclk;

  initial rclk = 0;
  always #12.5 rclk = ~rclk;
  
  initial begin
    wrst = 0;
    rrst = 0;
    w_en = 0;
    r_en = 0;
    data_in = 0;

    #50;
    wrst = 1;
    rrst = 1;
    
    #100;
    
    // Test Case 1: Sequential Write and Read
    $display("\n--- Test Case 1: Write 5 elements then Read 5 elements ---\n");
    repeat (5) @(posedge wclk) write_data($random % 256);
    @(posedge wclk) w_en = 0;
    
    #100; // Delay to allow sync

    repeat (5) @(posedge rclk) read_data();
    @(posedge rclk) r_en = 0;

    #200;

    // Test Case 2: Fill until Full
    $display("\n--- Test Case 2: Fill until Full ---\n");
    while (!full) @(posedge wclk) write_data($random % 256);
    @(posedge wclk) w_en = 0;
    $display("\nFIFO is Full!\n");

    #200;

    // Test Case 3: Empty until Empty
    $display("\n--- Test Case 3: Empty until Empty ---\n");
    while (!empty) @(posedge rclk) read_data();
    @(posedge rclk) r_en = 0;
    $display("\nFIFO is Empty!\n");

    #200;
    
    // Test Case 4: Simultaneous Write and Read
    $display("\n--- Test Case 4: Simultaneous Write and Read ---\n");
    fork
      begin
        repeat (30) begin
           @(posedge wclk);
           if (!full) write_data($random % 256);
           else w_en = 0;
        end
        @(posedge wclk) w_en = 0;
      end
      begin
        #100;
        repeat (30) begin
           @(posedge rclk);
           if (!empty) read_data();
           else r_en = 0;
        end
        @(posedge rclk) r_en = 0;
      end
    join

    $display("\nSimulation Finished!\n");
    #100;
    $finish;
  end

  // Tasks for easier stimulation
  task write_data(input [data_width-1:0] val);
  begin
    @(posedge wclk);
    w_en = 1;
    data_in = val;
    @(posedge wclk);
    w_en = 0;
    $display("WRITE	-> data : %d || TIME : %0t", val, $time);
  end
endtask

  task read_data();
  begin
    r_en = 1;
    @(posedge rclk);  // wait one full read clock
    r_en = 0;
    $display("READ	-> data : %d || TIME : %0t", data_out, $time);
  end
endtask


  // Monitor
  initial begin
    $monitor("\nFull=%b, Empty=%b : At time %0t\n", full, empty, $time);
  end

  initial begin
    $dumpfile("async_fifo_tb.vcd");
    $dumpvars(0, async_fifo_tb);
  end

endmodule
