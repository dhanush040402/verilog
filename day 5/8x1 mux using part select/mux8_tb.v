module mux8_tb;
reg  [7:0] data;
reg  [2:0] select;
wire y;
mux8 dut (.data(data),.select(select),.y(y));
initial begin
    $dumpfile("mux8.vcd");
    $dumpvars(0);
    data= 8'b10110110; 

    select = 3'd0; #10;
    select = 3'd1; #10;
    select = 3'd2; #10;
    select = 3'd3; #10;
    select = 3'd4; #10;
    select = 3'd5; #10;
    select = 3'd6; #10;
    select = 3'd7; #10;
    $finish;
end
initial begin
    $monitor("Time=%0t | d=%b | sel=%0d | y=%b",$time, data, select, y);
end
endmodule

