module clk_odd  #(
    parameter integer N = 5   // Enter only odd
)(
    input  wire clk,
    input  wire rst,
    output reg  clk_out
);

    localparam integer W = $clog2(2*N);

    reg [W-1:0] edge_count;

    always @(posedge clk or negedge clk or posedge rst) begin
        if (rst) begin
            edge_count <= 0;
            clk_out    <= 1'b0;
        end else begin
            if (edge_count == N-1) begin
                edge_count <= 0;
                clk_out    <= ~clk_out;
            end else begin
                edge_count <= edge_count + 1'b1;
            end
        end
    end

endmodule

