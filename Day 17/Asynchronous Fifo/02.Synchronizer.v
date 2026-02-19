`timescale 1ns/1ps

module synchronizer #(parameter width = 3)(
  input clk,rst,[width:0]gin,
  output reg [width:0]gout
);
  
  reg [width:0]q;
  
  always @(posedge clk or negedge rst)begin
    
    if(!rst)begin
      q<=0;
      gout<=0;
    end
    
    else begin
      q<=gin;
      gout<=q;
    end
    
  end
endmodule
