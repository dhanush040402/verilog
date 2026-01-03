module truedualport #(
    parameter WIDTH    = 4,
    parameter LOCATION = 16
)(
    input  wire                     clk,

    // Port A
    input  wire                     we_a,
    input  wire [$clog2(LOCATION)-1:0] addr_a,
    input  wire [WIDTH-1:0]         din_a,
    output reg  [WIDTH-1:0]         dout_a,

    // Port B
    input  wire                     we_b,
    input  wire [$clog2(LOCATION)-1:0] addr_b,
    input  wire [WIDTH-1:0]         din_b,
    output reg  [WIDTH-1:0]         dout_b
);

    reg [WIDTH-1:0] mem [0:LOCATION-1];

    // Port A operation
    always @(posedge clk) begin
        if (we_a)
            mem[addr_a] <= din_a;
        else
            dout_a <= mem[addr_a];
    end

    // Port B operation
    always @(posedge clk) begin
        if (we_b)
            mem[addr_b] <= din_b;
        else
            dout_b <= mem[addr_b];
    end

endmodule

