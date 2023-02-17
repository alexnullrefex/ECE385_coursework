module d_flip_flop(
    input logic Clk, D_in,
    output logic D_out
);

    always_ff @ (posedge Clk)
    begin
        D_out <= D_in;
    end

endmodule