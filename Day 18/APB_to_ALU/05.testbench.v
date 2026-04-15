module tb;
  parameter width = 8;

  reg pclk; 
  reg presetn; 
  reg read_write; 
  reg transfer; 
  reg [width-1:0] apb_write_data; 
  reg [width-1:0] apb_write_paddr; 
  reg [width-1:0] apb_read_paddr;

  wire [width-1:0] apb_read_data_out;



  top #(.width(width)) t1(
    .pclk(pclk),
    .presetn(presetn),
    .read_write(read_write),
    .transfer(transfer),
    .apb_write_data(apb_write_data),
    .apb_write_paddr(apb_write_paddr),
    .apb_read_paddr(apb_read_paddr),
    .apb_read_data_out(apb_read_data_out)
  );


  initial begin

    $dumpfile("apb_alu.vcd");
    $dumpvars(0);

    presetn = 0;
    read_write = 0;
    transfer = 0;
    apb_write_data = 0;
    apb_write_paddr = 0;
    apb_read_paddr = 0;

    #20;
    presetn = 1;

    apb_write(8'd25,8'd121);
    apb_write(8'd40,8'd17);
    apb_write(8'd100,8'd96);

    apb_read(8'd25);
    apb_read(8'd40);
    apb_read(8'd100);

  end



  task apb_write(input [7:0]addr,input [7:0]data);
    begin
      @(posedge pclk);
      transfer=1;
      read_write=0;
      apb_write_paddr=addr;
      apb_write_data=data;

      @(posedge pclk);
      @(posedge pclk);

      transfer=0;

      $display(" Write = Address = %0d | Data = %0d | Time = %0t |",apb_write_paddr,apb_write_data,$time);

    end
  endtask

  task apb_read(input [7:0]addr);
    begin
      @(posedge pclk);
      transfer=1;
      read_write=1;
      apb_read_paddr=addr;


      @(posedge pclk);
      @(posedge pclk);


      transfer=0;

      $display("Read = Address = %0d | Data = %0d | Time = %0t |",apb_read_paddr,apb_read_data_out,$time);

    end
  endtask



  initial begin
    pclk = 0;
    forever #10 pclk = ~pclk;
  end

endmodule






