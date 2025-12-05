module alu_tb;
    reg  [7:0] a, b;
    reg  [3:0] alu_select;
    wire [7:0] alu_out;
    alu dut (
        .a(a),
        .b(b),
        .alu_select(alu_select),
        .alu_out(alu_out)
    );

    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0, alu_tb);
        a = 8'd15;
        b = 8'd3;

        // Apply test cases for all 16 operations
        alu_select = 4'b0000; #1;   // addition
        alu_select = 4'b0001; #1;   // subtraction
        alu_select = 4'b0010; #1;   // multiplication
        alu_select = 4'b0011; #1;   // division
        alu_select = 4'b0100; #1;   // AND
        alu_select = 4'b0101; #1;   // OR
        alu_select = 4'b0110; #1;   // XOR
        alu_select = 4'b0111; #1;   // XNOR
        alu_select = 4'b1000; #1;   // NOR
        alu_select = 4'b1001; #1;   // NAND
        alu_select = 4'b1010; #1;   // Greater
        alu_select = 4'b1011; #1;   // Equal
        alu_select = 4'b1100; #1;   // logical left shift
        alu_select = 4'b1101; #1;   // logical right shift
        alu_select = 4'b1110; #1;   // rotate left
        alu_select = 4'b1111; #1;   // rotate right

        $finish;
    end

    initial begin
        $monitor("time=%0t | a=%d | b=%d | sel=%b | out=%d",
                  $time, a, b, alu_select, alu_out);
    end
endmodule

