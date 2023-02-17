module twos_complement(
    input [7:0] data_input,
    input Clk,
    output [7:0] data_output
);

    logic Load;
    logic [7:0] intermediate_out;

    assign intermediate_out[0] = ~data_input[0];
    assign intermediate_out[1] = ~data_input[1];
    assign intermediate_out[2] = ~data_input[2];
    assign intermediate_out[3] = ~data_input[3];
    assign intermediate_out[4] = ~data_input[4];
    assign intermediate_out[5] = ~data_input[5];
    assign intermediate_out[6] = ~data_input[6];
    assign intermediate_out[7] = ~data_input[7];

    ripple_8 add_one(.A(intermediate_out),
                         .B(8'b00000001),
                          .cin(1'b0),
                           .S(data_output),
                            .cout(1'b0));

endmodule