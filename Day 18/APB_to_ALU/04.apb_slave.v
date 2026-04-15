module apb_slave #(parameter width = 8)(
  
  input pclk,
  input presetn,
  input penable,
  input psel,
  input pwrite,
  input [width-1:0] paddr,
  input [width-1:0] pwdata,
  
  output reg pready,
  output [width-1:0] prdata,
                                                             
  
  
  output reg start,
  output [2:0] opcode,
  output [width-1:0] a, 
  output [width-1:0] b,

  input done,
  input [width-1:0] result,
  input [width-1:0] reg_out,
  
 
  input [7:0] status_reg

);
  
  reg [width-1:0] reg_a;
  reg [width-1:0] reg_b;
  reg [7:0] control_reg;
  reg [width-1:0] prdata_reg;
  
  localparam [width-1:0] a_addr = 8'd0;
  localparam [width-1:0] b_addr = 8'd1;
  localparam [width-1:0] out_addr = 8'd2;
  localparam [7:0] control_addr = 8'd3;
  localparam [7:0] status_addr = 8'd4;
  
  
  
  always @(posedge pclk) begin
    
    if(!presetn) begin
      pready	<= 0;
    end
    
    else if(psel && penable && !pwrite) begin
      
      pready	<= 1;
      
      case(paddr)
        
        a_addr 		 : 		prdata_reg <= reg_a;
        b_addr 		 : 		prdata_reg <= reg_b;
        control_addr : 		prdata_reg <= control_reg; 
        out_addr     :      prdata_reg <= reg_out;
        status_addr  :      prdata_reg <= status_reg;
          
      endcase
    
    end
    
    else if(psel && penable && pwrite) begin
      
      pready		<= 1;
      
      case(paddr)
        
        a_addr 		 : 		reg_a <= pwdata;
        b_addr 		 : 		reg_b <= pwdata;
        control_addr : 		control_reg <= pwdata; 
          
      endcase
      
    end
    
    else begin
      pready	<= 0;
    end
    
  end
  
  assign a = reg_a;
  assign b = reg_b;
  assign start = control_reg[0];
  assign opcode = control_reg[3:1];
  assign prdata = prdata_reg;
  
endmodule
