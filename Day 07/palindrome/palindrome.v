module palindrome(
input  [15:0] num,
output reg    pal
);
reg [3:0] d1, d2, d3, d4;
always @(*) begin
    d1 = (num / 1000) % 10;
    d2 = (num / 100)  % 10;
    d3 = (num / 10)   % 10;
    d4 =  num % 10;
    if (d1 == d4 && d2 == d3)
        pal = 1;
    else
        pal = 0;
end
endmodule

