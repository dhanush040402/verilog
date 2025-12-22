module siso_tb;

reg clk;
reg rst;
reg sin;
wire sout;

siso dut (
    .clk(clk),
    .rst(rst),
    .sin(sin),
    .sout(sout)
);

initial begin
    $monitor("time=%0t | rst=%b | sin=%b | sout=%b", $time, rst, sin, sout);
    $dumpfile("siso.vcd");
    $dumpvars(0, siso_tb);

   
    clk = 0;
    rst = 1;
    sin = 0;
    #5;

   
    rst = 0;

    // Apply serial data: 1 0 1 1
    #10 sin = 1;
    #20 sin = 0;
    #20 sin = 1;
    #20 sin = 1;

   
    #20 $finish;
end

always #10 clk = ~clk;

endmodule

