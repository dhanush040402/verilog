/*Write a Verilog program with the following specifications.
1. It should have a memory of size 8x14.
2. Write a task/function to fill all elements in the memory.
3. Write a method to add the values stored inside the memory.
4. 4. Write a method to find the largest number in the memory*/

module mem_8x14_example;

    reg [13:0] mem [0:7];
    integer i;

    task fill_memory;
        input [13:0] start_value;
        begin
            for (i = 0; i < 8; i = i + 1)
                mem[i] = start_value + i;
        end
    endtask

    function [17:0] sum_memory;
        input dummy;
        integer j;
        begin
            sum_memory = 0;
            for (j = 0; j < 8; j = j + 1)
                sum_memory = sum_memory + mem[j];
        end
    endfunction

    function [13:0] max_memory;
        input dummy;
        integer k;
        begin
            max_memory = mem[0];
            for (k = 1; k < 8; k = k + 1)
                if (mem[k] > max_memory)
                    max_memory = mem[k];
        end
    endfunction

    initial begin
        fill_memory(14'd10);

        for (i = 0; i < 8; i = i + 1)
            $display("mem[%0d] = %0d", i, mem[i]);

        $display("Sum of memory = %0d", sum_memory(1'b0));
        $display("Maximum value = %0d", max_memory(1'b0));
    end

endmodule

