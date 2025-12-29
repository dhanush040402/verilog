/*Write a Verilog module that blinks an LED at 1 Hz using a 50 MHz clock. The LED must
toggle every 0.5 seconds. Inputs are clk and rst, output is led.*/


module led_blink_1hz (
    input  wire clk,     // 50 MHz clock
    input  wire rst,     // synchronous active-high reset
    output reg  led
);

    // Number of clock cycles for 0.5 seconds at 50 MHz
    localparam integer COUNT_MAX = 25_000_000 - 1;

    reg [24:0] count;  // 25 bits sufficient to count up to 25,000,000

    always @(posedge clk) begin
        if (rst) begin
            count <= 25'd0;
            led   <= 1'b0;
        end
        else begin
            if (count == COUNT_MAX) begin
                count <= 25'd0;
                led   <= ~led;   // toggle LED every 0.5 seconds
            end
            else begin
                count <= count + 1'b1;
            end
        end
    end

endmodule

