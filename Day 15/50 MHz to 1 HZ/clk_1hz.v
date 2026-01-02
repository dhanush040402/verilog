module clk_1hz (
    input  wire clk,     
    input  wire rst,     
    output reg clk_out
);
    localparam integer COUNT_MAX = 25_000_000 - 1;

    reg [24:0] count; 

    always @(posedge clk) begin
        if (rst) begin
            count <= 25'd0;
            clk_out   <= 1'b0;
        end
        else begin
            if (count == COUNT_MAX) begin
                count <= 25'd0;
                clk_out   <= ~led;  
            end
            else begin
                count <= count + 1'b1;
            end
        end
    end

endmodule

