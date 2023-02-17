module switches(
    input logic Clk,
    input logic [7:0] switch_in,
    output logic [7:0] switch_out
);

    always_ff @ (posedge Clk)
    begin
        switch_out <= switch_in;
    end


endmodule