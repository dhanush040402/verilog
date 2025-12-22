module piso_tb;
reg clk,rst,load;
reg [3:0] pin;
wire sout;
piso dut(.clk(clk),.rst(rst),.load(load),.pin(pin),.sout(sout));
initial begin
$monitor(" clk=%b | rst=%b | load=%b | pin=%b | sout=%b | time = %0t",clk,rst,load,pin,sout,$time);
$dumpfile("piso.vcd");
$dumpvars(0,piso_tb);
clk=0;rst=1;load=0;pin=4'b0000;#5;
rst=0;load=1;pin=4'b1011;#20;
load=0;#80;
$finish;
end
always #10 clk=~clk;
endmodule

