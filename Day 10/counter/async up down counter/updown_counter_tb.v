module updown_counter_tb;

reg clk, rst, mode;
wire [3:0] q, q_bar;

updown_counter dut (
    .clk(clk),
    .rst(rst),
    .mode(mode),
    .q(q),
    .q_bar(q_bar)
);

initial begin
    $dumpfile("updown_counter.vcd");
    $dumpvars(0, updown_counter_tb);

    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $monitor("clk=%b rst=%b mode=%b q=%d time=%0t", clk, rst, mode, q, $time);

    
    rst  = 1;
    mode = 1;            
    #10;                 
    rst  = 0;

    #160;                

    
    rst  = 1;
    #10;
    rst  = 0;
    mode = 0;            

    #160;                

    $finish;
end

endmodule


