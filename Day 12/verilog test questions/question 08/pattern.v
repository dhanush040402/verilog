//1 22 333 4444 55555 4444 333 22 1 display this sequence in diamond shape .




module diamond_pattern;

    integer i, j, k;
    integer width;
    integer num_width;
    integer lead_spaces;

    initial begin
        width = 9;   // max width: "5 5 5 5 5" = 9 characters

        // Upper half including middle
        for (i = 1; i <= 5; i = i + 1) begin
            num_width  = 2*i - 1;
            lead_spaces = (width - num_width)/2 + 4;

            for (j = 0; j < lead_spaces; j = j + 1)
                $write(" ");

            for (k = 1; k <= i; k = k + 1) begin
                $write("%0d", i);
                if (k < i) $write(" ");
            end
            $write("\n");
        end

        // Lower half
        for (i = 4; i >= 1; i = i - 1) begin
            num_width  = 2*i - 1;
            lead_spaces = (width - num_width)/2 + 4;

            for (j = 0; j < lead_spaces; j = j + 1)
                $write(" ");

            for (k = 1; k <= i; k = k + 1) begin
                $write("%0d", i);
                if (k < i) $write(" ");
            end
            $write("\n");
        end
    end

endmodule

/*output
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
