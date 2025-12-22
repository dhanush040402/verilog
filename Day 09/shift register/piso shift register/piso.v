module piso(
input clk,rst,load,
input [3:0]pin,
output reg sout
);
reg [3:0] shift_reg;

always @(posedge clk) begin
    if (rst) begin
        shift_reg <= 4'b0000;
        sout <= 1'b0;
    end
    else if (load) begin
        shift_reg <= pin;         
    end
    else begin
        sout<= shift_reg[3]; 
        shift_reg <= {shift_reg[2:0], 1'b0}; 
    end
end

endmodule
