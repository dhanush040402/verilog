`timescale 1ns/1ps

`include "synchronizer.v"
`include "write_ptr_handler.v"
`include "read_ptr_handler.v"
`include "memory.v"

module async_fifo_top #(parameter depth=8, data_width=8) (
  input wclk, wrst, w_en,
  input rclk, rrst, r_en,
  input [data_width-1:0] data_in,
  output [data_width-1:0] data_out,
  output full, empty
);
  
  parameter ptr_width = $clog2(depth);
  
  wire [ptr_width:0] b_wptr, b_rptr;
  wire [ptr_width:0] g_wptr, g_rptr;
  wire [ptr_width:0] g_wptr_sync, g_rptr_sync;
  
  synchronizer #(ptr_width) sync_wptr(
    .clk(rclk),
    .rst(rrst),
    .gin(g_wptr), 
    .gout(g_wptr_sync)
  );
  
  synchronizer #(ptr_width) sync_rptr(
    .clk(wclk),
    .rst(wrst),
    .gin(g_rptr), 
    .gout(g_rptr_sync)
  );
  
  write_ptr_handler #(ptr_width) w_ptr_h (
    .wclk(wclk), 
    .wrst(wrst), 
    .w_en(w_en), 
    .g_rptr_sync(g_rptr_sync), 
    .b_wptr(b_wptr), 
    .g_wptr(g_wptr), 
    .full(full)
  );
  
  read_ptr_handler #(ptr_width) r_ptr_h (
    .rclk(rclk), 
    .rrst(rrst), 
    .r_en(r_en), 
    .g_wptr_sync(g_wptr_sync), 
    .b_rptr(b_rptr), 
    .g_rptr(g_rptr), 
    .empty(empty)
  );
  
  memory #(depth, data_width, ptr_width) fifo (
    .wclk(wclk), 
    .rclk(rclk), 
    .w_en(w_en), 
    .r_en(r_en), 
    .full(full), 
    .empty(empty), 
    .b_wptr(b_wptr), 
    .b_rptr(b_rptr), 
    .data_in(data_in), 
    .data_out(data_out)
  );
  
endmodule
