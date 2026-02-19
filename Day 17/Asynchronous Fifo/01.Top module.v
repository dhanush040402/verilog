`timescale 1ns/1ps

`include "synchronizer.sv"
`include "write_point_handler.sv"
`include "read_point_handler.sv"
`include "Fifo_memory.sv"

module asynchronous_fifo #(parameter depth = 8 , data_width = 8 ) (
  input wclk,wrst,w_en,rclk,rrst,r_en,
  input [data_width-1:0]data_in,
  output full,empty,
  output [data_width-1:0]data_out
);
  parameter ptr_width = $clog2(depth);
  
  wire [ptr_width:0]b_wptr,b_rptr,g_wptr,g_rptr,g_wptr_sync,g_rptr_sync;
  
  
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
  
  wptr_handler #(ptr_width) write_h(
    .wclk(wclk),
    .wrst(wrst),
    .w_en(w_en),
    .g_rptr_sync(g_rptr_sync),
    .b_wptr(b_wptr),
    .g_wptr(g_wptr),
    .full(full)
  );
  
  rptr_handler #(ptr_width) read_h(
    .rclk(rclk),    
    .rrst(rrst),
    .r_en(r_en),
    .g_wptr_sync(g_wptr_sync),
    .b_rptr(b_rptr),
    .g_rptr(g_rptr),
    .empty(empty)
  );
  
  
  fifo_memory #(depth,data_width,ptr_width) fifo(
    .wclk(wclk),
    .w_en(w_en),
    .rclk(rclk),
    .r_en(r_en),
    .full(full),
    .empty(empty),
    .data_in(data_in),
    .data_out(data_out),
    .b_wptr(b_wptr),
    .b_rptr(b_rptr)
  );
  
endmodule
