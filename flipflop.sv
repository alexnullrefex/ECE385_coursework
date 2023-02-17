module d_flip_flop(
    input Clk, D_in,
    output D_out
);

    always_ff @ (posedge Clk)
    begin
        D_out <= D_in;
    end

endmodule