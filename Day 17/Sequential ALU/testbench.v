module tb;
  
  parameter width = 4 ;
  
  reg clk,rst,valid;
  reg [2:0] opcode;
  reg [width-1:0]a,b;
  
  wire [width-1:0] result;
  wire zero;
  wire overflow;
  wire negative;
  wire carry;
  wire borrow;
  
  seq_alu #(.width(width)) dut(
    .clk(clk),
    .rst(rst),
    .valid(valid),
    .opcode(opcode),
    .a(a),
    .b(b),
    .result(result),
    .zero(zero),
    .overflow(overflow),
    .negative(negative),
    .carry(carry),
    .borrow(borrow)
  );
  
  initial begin
    $srandom(102);
    $dumpfile("alu.vcd");
    $dumpvars(0);
    rst = 1 ;
    valid = 1 ;  
    
    #20;
    
    rst = 0 ;
    
    
    for(int i=0 ; i <= 1 ; i++)begin
      a = $random;
      b = $random;
      opcode = i ;
      
      @(posedge clk)begin
        #5;
      
      $display (" opcode = %d | a = %b | b = %b | result = %b | zero = %d | negative = %d | carry = %d | overflow = %d | borrow = %d | T = %0t |",opcode,a,b,result,zero,negative,carry,overflow,borrow,$time);
      end
      
    end
    
    for(int i=2; i <= 7 ; i++)begin
      a = $random;
      b = $random;
      opcode = i ;
      
      @(posedge clk)begin
        #5;
      
        $display (" opcode = %d | a = %b | b = %b | result = %b | zero = %d | T = %0t |",opcode,a,b,result,zero,$time);
      end
    end
    
    
    $finish;
    
  end
  
  initial begin 
    clk = 1 ;
    forever #10 clk = ~clk ;
  end
  
endmodule 
    
   
  

    
    
    
    
  
