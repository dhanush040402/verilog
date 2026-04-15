module seq_alu #(parameter width = 8)(
  input clk,
  input rst,
  input [2:0] opcode,
  input start,
  input [width-1:0] a,
  input [width-1:0]b,

  output reg [width-1:0] result,
  output reg done,
  output reg [7:0] status_reg
);

  reg zero;
  reg overflow;
  reg negative;
  reg carry;
  reg borrow;

  always @(posedge clk)begin
    if(rst)begin

      overflow <= 0;
      carry <= 0;
      borrow <= 0;
      result <= 0;
      done <= 0;


    end

    else begin
      if(start)begin
        case(opcode)

          3'd0 : begin
            {carry,result} = a + b ;
            overflow <= ((a[width-1] == b[width-1]) && (a[width-1] != result[width-1]));
          end

          3'd1 : begin
            {borrow,result} = a - b ;
            overflow <= ((a[width-1] != b[width-1]) && (a[width-1] != result[width-1]));
          end

          3'd2 : begin
            result <= a & b ;
          end

          3'd3 : begin
            result <= a | b ;
          end

          3'd4 : begin
            result <= a ^ b ;
          end

          3'd5 : begin
            result <= ~ ( a ^ b ) ;
          end

          3'd6 : begin
            result <= ~ ( a & b ) ;
          end

          3'd7 : begin
            result <= ~ ( a | b ) ;
          end

          default : result <= 0 ;

        endcase


      end

      done <= 1;

    end
    
  end

  assign zero = (result == 0);
  assign negative = (result[width-1]==1);
  assign status_reg = {2'b0,done,zero,carry,borrow,overflow,negative};


endmodule
