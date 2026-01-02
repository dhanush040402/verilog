module clk_1hz_tb;

    reg  clk;
    reg  rst;
    wire clk_out;

    
   clk_1hz dut (
        .clk(clk),
        .rst(rst),
        .clk_out(clk_out)
    );


    initial begin
        clk = 1'b0;
        forever #10 clk = ~clk; 
    end


    initial begin
    
        $dumpfile("clk_1hz.vcd");
        $dumpvars(0);

        
        rst = 1'b1;
        #40;           
        rst = 1'b0;


        #2_000_000_000; 

        $finish;
    end


    initial begin
        $display("Time (ns)\tReset\tLED");
        $monitor("%0t\t%b\t%b", $time, rst, clk_out);
    end

endmodule
 
