module sync_fifo #(parameter width=4, depth=16)(
input clk,rst,w_en,r_en,
input [width-1:0]indata,
output reg [width-1:0]outdata,
output full,empty);

reg[width-1:0]mem[depth-1:0];
reg [$clog2(depth):0]w_ptr,r_ptr;

always @(posedge clk) begin
    if (rst) begin
        w_ptr   <= 0;
        r_ptr   <= 0;
        outdata <= 0; 
end
    else begin
        if (w_en && !full) begin
            mem[w_ptr[$clog2(depth)-1:0]] <= indata; 
            w_ptr <= w_ptr + 1;                      
        end
        if (r_en && !empty) begin
            outdata <= mem[r_ptr[$clog2(depth)-1:0]];
            r_ptr <= r_ptr + 1;
        end
    end
end

assign full = (w_ptr[$clog2(depth)] != r_ptr[$clog2(depth)]) &&
              (w_ptr[$clog2(depth)-1:0] == r_ptr[$clog2(depth)-1:0]); 

assign empty = (w_ptr == r_ptr);


endmodule

