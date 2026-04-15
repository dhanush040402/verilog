`include "alu.v"
`include "apb_slave.v"
`include "apb_master.v"

module top #(parameter width = 8) (
  input pclk, 
  input presetn, 
  input read_write, 
  input transfer, 
  input [width-1:0] apb_write_data, 
  input [width-1:0] apb_write_paddr, 
  input [width-1:0] apb_read_paddr,
  
  output reg [width-1:0] apb_read_data_out
);
  
  wire psel;
  wire penable; 
  wire pwrite;
  wire [width-1:0] pwdata; 
  wire [width-1:0] paddr;
  wire pready;
  wire [width-1:0] prdata;
  
  wire start;
  wire done;
  wire [width-1:0] a;
  wire [width-1:0] b;
  wire [2:0] opcode;
  wire [width-1:0] result;
  wire [7:0] status_reg;
  
  apb_master #(.width(width)) m1(
    .pclk(pclk), 
    .presetn(presetn), 
    .read_write(read_write), 
    .transfer(transfer), 
    .pready(pready),
    .apb_write_data(apb_write_data), 
    .prdata(prdata),
    .apb_write_paddr(apb_write_paddr), 
    .apb_read_paddr(apb_read_paddr),
    .psel(psel),
    .penable(penable), 
    .pwrite(pwrite),
    .pwdata(pwdata), 
    .apb_read_data_out(apb_read_data_out),
    .paddr(paddr)
  );
  
  apb_slave #(.width(width)) s1(
    .pclk(pclk),
    .presetn(presetn),
    .penable(penable),
    .psel(psel),
    .pwrite(pwrite),
    .paddr(paddr),
    .pwdata(pwdata),
    .pready(pready),
    .prdata(prdata),
    .start(start),
    .opcode(opcode),
    .a(a),
    .b(b),
    .done(done),
    .result(result),
    .status_reg(status_reg)
  );
  
  seq_alu #(.width(width)) a1(
    .clk(pclk), 
    .rst(presetn),
    .start(start),
    .opcode(opcode),
    .a(a), 
    .b(b),
    .done(done),
    .result(result),
    .status_reg(status_reg)
  );
  
endmodule
  
  
