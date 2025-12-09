module factorial_tb;
reg [3:0]num;
wire [15:0] fact;
integer i;
factorial dut(.num(num),.fact(fact));
initial begin
$monitor("Time = %0t | number = %d | factorial = %d |",$time,num,fact);
$dumpfile("factorial.vcd");
$dumpvars(0);
    for (i = 0; i < 8; i = i + 1) begin
        num = i;
        #10;
    end
end
endmodule

