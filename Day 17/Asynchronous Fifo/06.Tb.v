`timescale 1ns/1ps

module async_fifo_tb;

  parameter depth = 8;
  parameter data_width = 8;
  parameter PTR_WIDTH = $clog2(depth);

  reg wclk, rclk;
  reg wrst, rrst;
  reg w_en, r_en;
  reg [data_width-1:0] data_in;
  wire [data_width-1:0] data_out;

  wire full, empty;
  integer i,j;
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

  initial wclk = 0;
  always #5 wclk = ~wclk;

  initial rclk = 0;
  always #12.5 rclk = ~rclk;
  
  initial begin
    $dumpfile("async.vcd");
    $dumpvars(0);
    
    wrst = 0;
    rrst = 0;
    w_en = 0;
    r_en = 0;
    data_in = 0;

    #50;
    wrst = 1;
    rrst = 1;
    
    for(i = 0; i < depth ; i++)begin
      @(posedge wclk)
      if(!full)begin
        w_en =1;
        data_in = i;
        $display("write_data_in = %0d",data_in);
      end
      else begin
        w_en = 0;
        $display("fifo is full");
      end
    end
    
    for(j=0;j<depth;j++)begin
      @(posedge rclk)
      if(!empty)begin
        r_en = 1;
        $display("read_data_out = %0d",data_out);
        @(posedge rclk)
        r_en = 0;
        
      end
      else begin
        r_en = 0;
        $display("fifo id empty");
      end
    end
    #100;
    $finish;
  end
endmodule

