module vending(
input clk,rst,c5,c10,
output reg dispense,balance5
);

parameter [2:0]s0=0,s5=1,s10=2,s15=3,s20=4;

reg [2:0]state,next;

always @(posedge clk or posedge rst)begin
        if(rst)state<=s0;
        else state<=next;
end

always @(*) begin
        next = state;
        dispense = 0;
        balance5  = 0;

        case (state)

            s0: begin
                if (c5) next = s5;
                else if (c10) next = s10;
            end

            s5: begin
                if (c5) next = s10;
                else if (c10) next = s15;
            end

            s10: begin
                if (c5) begin
                    next = s15;
                end
                else if (c10) begin
                    next = s20;
                end
            end

            s15: begin
                dispense = 1;
                next = s0;
            end
	    s20:begin
		   dispense=1;
		   balance5=1;
		   next =s0;
	   end

        endcase
    end

endmodule
