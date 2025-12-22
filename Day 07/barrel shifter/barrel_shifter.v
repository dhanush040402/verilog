module barrel_shifter(
    input  [3:0] in,
    input  [1:0] shift,
    input  [1:0] mode,
    output reg [3:0] out
);

always @(*) begin
    case(mode)
        2'b00: out = in << shift;             // left shift
        2'b01: out = in >> shift;             // right shift

        2'b10: begin                          // rotate left
            case (shift)
                2'd0: out = in;
                2'd1: out = {in[2:0], in[3]};
                2'd2: out = {in[1:0], in[3:2]};
                2'd3: out = {in[0],   in[3:1]};
            endcase
        end

        2'b11: begin                          // rotate right
            case (shift)
                2'd0: out = in;
                2'd1: out = {in[0],   in[3:1]};
                2'd2: out = {in[1:0], in[3:2]};
                2'd3: out = {in[2:0], in[3]};
            endcase
        end

        default: out = 4'b0000;
    endcase
end

endmodule






















