module apb_master #(parameter width = 8)(
  input pclk, 
  input presetn, 
  input read_write, 
  input transfer, 
  input pready,
  input [width-1:0] apb_write_data, 
  input [width-1:0] prdata,
  input [width-1:0] apb_write_paddr, 
  input [width-1:0] apb_read_paddr,
  
  output reg psel,
  output reg penable, 
  output reg pwrite,
  output reg [width-1:0] pwdata, 
  output reg [width-1:0] apb_read_data_out,
  output reg [width-1:0] paddr
);
  
  reg [1:0] state; 
  reg [1:0] next_state;
  
  localparam idle	= 2'b00;
  localparam setup	= 2'b01;
  localparam access	= 2'b10;
  
  always @(posedge pclk or negedge presetn) begin  
    if(!presetn) begin
      state				<= idle;
      apb_read_data_out	<= 0;
    end
    else begin
      state	<= next_state;
      if (state == access && pready && read_write)
        apb_read_data_out	<=	prdata;
    end
  end
  
  always @(*) begin
    
    psel		= 0;
    penable		= 0;
    pwrite		= 0;
    pwdata		= 0;
    paddr		= 0;
    next_state	= state;
      
    case(state)

      idle: begin
        if(transfer)
          next_state = setup;
        else
          next_state = idle;
      end

      setup: begin
        psel	= 1;
        penable	= 0;
        pwrite	= ~read_write;
        
        if(read_write) begin
          paddr		= apb_read_paddr;
          pwdata	= 0;
        end
        else begin
          paddr		= apb_write_paddr;
          pwdata	= apb_write_data;
        end
        
        next_state = access;
      end
      
      
      access: begin
        psel	= 1;
        penable	= 1;
        pwrite	= ~read_write; 
        
        if(read_write) begin
          paddr		= apb_read_paddr;
          pwdata	= 0;
        end
        else begin
          paddr		= apb_write_paddr;
          pwdata	= apb_write_data;
        end
        
        if(pready) begin
          if(transfer)
            next_state	= setup;
          else
            next_state	= idle;
        end
        else
          next_state	= access;
        
      end
      
      default: next_state	= idle;
      
    endcase
    
  end
  
endmodule
