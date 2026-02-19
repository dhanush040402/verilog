module synchronizer #(parameter width = 3)(
  input clk,rst,[width:0]gin,
  output reg gout
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
