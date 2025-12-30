//1 22 333 4444 55555 4444 333 22 1 display this sequence in diamond shape .



module pattern_print;

    integer i, j, k;
    integer N = 5;

    initial begin
        for (i = 1; i <= N; i = i + 1) begin
            for (k = 1; k <= N - i; k = k + 1)
                $write(" ");
            for (j = 1; j <= i; j = j + 1)
                $write("%0d ", i);

            $write("\n");
        end


        for (i = N - 1; i >= 1; i = i - 1) begin
            for (k = 1; k <= N - i; k = k + 1)
                $write(" ");
                for (j = 1; j <= i; j = j + 1)
                $write("%0d ", i);

            $write("\n");
        end

        $finish;
    end

endmodule



/*Output 
*
    1 
   2 2 
  3 3 3 
 4 4 4 4 
5 5 5 5 5 
 4 4 4 4 
  3 3 3 
   2 2 
    1 
*/

