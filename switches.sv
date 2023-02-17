module switches(
    input Clk,
    input [7:0] switch_in,
    output [7:0] switch_out
);

    always_ff @ (posedge Clk)
    begin
        switch_out <= switch_in;
    end


endmodule