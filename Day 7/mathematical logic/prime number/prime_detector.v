module prime_nbit #( parameter N = 8)
(
    input  [N-1:0] num,
    output reg     prime
);

integer i;
always @(*) begin
    if (num < 2) begin
        prime = 0;
    end
    else begin
        prime = 1; 
        for (i = 2; i * i <= num; i = i + 1) begin
            if (num % i == 0) begin
                prime = 0; 
            end
        end
    end
end

endmodule

