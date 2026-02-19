`timescale 1ns/1ps

module async_fifo_tb;

  parameter depth = 16;
  parameter data_width = 8;
  parameter ptr_width = $clog2(depth);

  reg wclk, rclk;
  reg wrst, rrst;
  reg w_en, r_en;
  reg [data_width-1:0] data_in;
  wire [data_width-1:0] data_out;
  wire full, empty;

  // instantiate the async fifo
  asynchronous_fifo #(
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

  // clock generation
  // write clock
  initial wclk = 0;
  always #5 wclk = ~wclk;

  // read clock:
  initial rclk = 0;
  always #12.5 rclk = ~rclk;

  // reset logic
  initial begin
    wrst = 0;
    rrst = 0;
    w_en = 0;
    r_en = 0;
    data_in = 0;

    #50;
    wrst = 1;
    rrst = 1;
    
    #20;
    
    // test case 1: sequential write and read
    $display("--- test case 1: write 5 elements then read 5 elements ---");
    repeat (5) @(posedge wclk) write_data($random % 256);
    w_en = 0;
    
    repeat (5) @(posedge rclk) read_data();
    r_en = 0;

    #100;

    // test case 2: fill until full
    $display("--- test case 2: fill until full ---");
    while (!full) @(posedge wclk) write_data($random % 256);
    w_en = 0;
    $display("fifo is full!");

    // test case 3: empty until empty
    $display("--- test case 3: empty until empty ---");
    while (!empty) @(posedge rclk) read_data();
    r_en = 0;
    $display("fifo is empty!");

    #100;
    
    // test case 4: simultaneous write and read
    $display("--- test case 4: simultaneous write and read ---");
    fork
      begin
        repeat (20) @(posedge wclk) write_data($random % 256);
        w_en = 0;
      end
      begin
        #50; // delay read start slightly
        repeat (20) @(posedge rclk) read_data();
        r_en = 0;
      end
    join

    $display("simulation finished!");
    $finish;
  end

  // tasks for easier stimulation
  task write_data(input [data_width-1:0] val);
    begin
      if (!full) begin
        w_en = 1;
        data_in = val;
        $display("[time: %0t] write: data=%h", $time, val);
      end else begin
        w_en = 0;
        $display("[time: %0t] write blocked: fifo full", $time);
      end
    end
  endtask

  task read_data();
    begin
      if (!empty) begin
        r_en = 1;
        @(posedge rclk); // wait for data to be valid at output
        $display("[time: %0t] read: data=%h", $time, data_out);
      end else begin
        r_en = 0;
        $display("[time: %0t] read blocked: fifo empty", $time);
      end
    end
  endtask

  // monitor
  initial begin
    $monitor("at time %0t: full=%b, empty=%b", $time, full, empty);
  end

  // optional: vcd generation for waveform viewing
  initial begin
    $dumpfile("async_fifo_tb.vcd");
    $dumpvars(0, async_fifo_tb);
  end

endmodule
