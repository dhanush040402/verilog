//Generate a 100 Hz Clock from a 50 MHz Clock in Verilog. 


module clk_100hz (
    input  wire clk_50mhz,   // 50 MHz input clock
    input  wire rst,          // synchronous active-high reset
    output reg  clk_100hz     // 100 Hz output clock
);

    // Counter width: log2(250000) ≈ 18 bits
    reg [17:0] count;

    always @(posedge clk_50mhz) begin
        if (rst) begin
            count     <= 18'd0;
            clk_100hz <= 1'b0;
        end
        else begin
            if (count == 18'd249_999) begin
                count     <= 18'd0;
                clk_100hz <= ~clk_100hz; // toggle every 5 ms
            end
            else begin
                count <= count + 1'b1;
            end
        end
    end

endmodule


