module mux_16x1_tb;
reg [15:0]data;
reg [3:0]select;
wire y;
mux_16x1 dut(.data(data),.select(select),.y(y));
initial begin
	$monitor("Time = %0t | data = %b | select = %b | y=%b",$time,data,select,y);
	$dumpfile("mux_16x1.vcd");
	$dumpvars(0);
	data=16'b1010101110101011;
	select=4'd0;#1;
        select=4'd1;#1;
        select=4'd2;#1;
        select=4'd3;#1;
        select=4'd4;#1;
        select=4'd5;#1;
        select=4'd6;#1;
        select=4'd7;#1;
        select=4'd8;#1;
        select=4'd9;#1;
        select=4'd10;#1;
        select=4'd11;#1;
        select=4'd12;#1;
        select=4'd13;#1;
        select=4'd14;#1;
        select=4'd15;#1;
end
endmodule
