module truedualport_tb;

    parameter WIDTH    = 4;
    parameter LOCATION = 16;

    reg                      we_a;
    reg  [$clog2(LOCATION)-1:0] addr_a;
    reg  [WIDTH-1:0]         din_a;
    wire [WIDTH-1:0]         dout_a;

    reg                      we_b;
    reg  [$clog2(LOCATION)-1:0] addr_b;
    reg  [WIDTH-1:0]         din_b;
    wire [WIDTH-1:0]         dout_b;

    reg clk;
    integer i;

    truedualport #(WIDTH, LOCATION) dut (.clk(clk), .we_a(we_a), .addr_a(addr_a), .din_a(din_a), .dout_a(dout_a),
                                         .we_b(we_b), .addr_b(addr_b), .din_b(din_b), .dout_b(dout_b));

    always #10 clk = ~clk;

    initial begin
        $dumpfile("truedualport.vcd");
        $dumpvars(0);

        clk    = 0;
        we_a   = 0;
        we_b   = 0;
        addr_a = 0;
        addr_b = 0;
        din_a  = 0;
        din_b  = 0;

        we_a = 1;
        for (i = 0; i < LOCATION; i = i + 1) begin
            addr_a = i;
            din_a  = $random;
            #20;
        end
        we_a = 0;

        for (i = 0; i < LOCATION; i = i + 1) begin
            addr_b = i;
            #20;
        end

        we_a = 1;
        for (i = 0; i < LOCATION; i = i + 1) begin
            addr_a = i;
            din_a  = $random;
            addr_b = i;
            #20;
        end
        we_a = 0;

        $finish;
    end

    always @(posedge clk) begin
        if (we_a)
            $display("T=%0t | WRITE | PortA Addr=%0d Data=%b", $time, addr_a, din_a);

        $display("T=%0t | READ  | PortB Addr=%0d Data=%b", $time, addr_b, dout_b);
    end

endmodule













































































      
