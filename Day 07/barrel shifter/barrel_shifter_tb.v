module barrel_shifter_tb;
reg [3:0]in;   
reg [1:0]shift;   
reg [1:0]mode;   
wire [3:0]out; 
barrel_shifter dut(.in(in),.shift(shift),.mode(mode),.out(out));
initial begin    
        $monitor("input = %b | mode = %d | shift = %d | output = %b | time = %t",in,mode,shift,out,$time);
        $dumpfile("barrel.vcd");
        $dumpvars(0);                       
        in=4'b1100;mode=0;shift=1;#1;
        in=4'b1100;mode=1;shift=1;#1;           
        in=4'b1100;mode=2;shift=1;#1;
        in=4'b1100;mode=3;shift=1;#1;                
        $finish;
end                   
endmodule
