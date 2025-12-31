module traffic(
    input clk,
    input rst,
    output reg e_l,e_r,e_s,
    output reg s_l,s_r,s_s,
    output reg w_l,w_r,w_s,
    output reg n_l,n_r,n_s
);

    
    parameter [2:0]
        s0 = 3'd0,
        s1 = 3'd1,
        s2 = 3'd2,
        s3 = 3'd3,
        s4 = 3'd4,
        s5 = 3'd5,
        s6 = 3'd6,
        s7 = 3'd7;

    reg [2:0] state, next;

    // 1-second clock enable (50 MHz)
    reg [25:0] cnt;
    wire tick = (cnt == 26'd49_999_999);

    always @(posedge clk or posedge rst) begin
        if (rst)
            cnt <= 0;
        else if (tick)
            cnt <= 0;
        else
            cnt <= cnt + 1;
    end

    // State register
    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= s0;
        else if (tick)
            state <= next;
    end

    // Next-state logic
    always @(*) begin
        next = state;
        case (state)
            s0: next = s1;
            s1: next = s2;
            s2: next = s3;
            s3: next = s4;
            s4: next = s5;
            s5: next = s6;
            s6: next = s7;
            s7: next = s0;
            default: next = s0;
        endcase
    end

    // Output logic (Moore)
    always @(*) begin
        // Default: all RED
        e_l=1; e_r=0; e_s=0;
        w_l=1; w_r=0; w_s=0;
        n_l=1; n_r=0; n_s=0;
        s_l=1; s_r=0; s_s=0;

        case(state)
            s0: begin e_r=1; e_s=1; end
            s1:       e_s=1;
            s2: begin s_r=1; s_s=1; end
            s3:       s_s=1;
            s4: begin w_r=1; w_s=1; end
            s5:       w_s=1;
            s6: begin n_r=1; n_s=1; end
            s7:       n_s=1;
        endcase
    end

endmodule






















































