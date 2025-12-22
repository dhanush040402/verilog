module even_parity_tb;
reg  [3:0] data;
wire parity;
integer i;
even_parity dut (.data(data), .parity(parity));
initial begin
    $monitor("time=%0t data=%b parity=%b", $time, data, parity);
    $dumpfile("even_parity.vcd");
    $dumpvars(0);
    for(i=1;i<16;i=i+1)begin
	    data=i;#1;
    end
    end
    endmodule
