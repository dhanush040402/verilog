module fibonacci(
input  [3:0] n,         
output reg [15:0] fib  
);
integer i;
reg [15:0] a, b;          
always @(*) begin
    if (n == 0) begin
        fib = 0;
    end
    else if (n == 1) begin
        fib = 1;
    end
    else begin
        a = 0;            
        b = 1;              
        for (i = 2; i <= n; i = i + 1) begin
            fib = a + b;   
            a = b;          
            b = fib;
        end
    end
end
endmodule

