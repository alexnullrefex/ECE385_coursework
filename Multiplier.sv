module Multiplier(

    input logic [7:0] Switches,
    input logic Run, Reset, Clk
);


    logic [7:0] reg_A_out, reg_B_out, switches_in, switches_out, negated_A, actual_A_out;
    logic [8:0] adder_output;
    logic Load_B, Load_A, Shift, shift_A_to_B, M, X_wire, Reset_A, Clr_Ld, Sub;

    assign Reset_A = Clr_Ld | Reset;
    assign Load_B = Clr_Ld;
    
    d_flip_flop X(.Clk(Clk), .D_in(adder_output[8]), .D_out(X_wire));

    switches synchronized_switches(.Clk(Clk), .switch_in(switches_in), .switch_out(switches_out));

    ripple_adder nine_bit_adder(.A( {actual_A_out[7], actual_A_out} ),
                                 .B( {switches_out[7], switches_out} ),
                                  .cin(1'b0),
                                   .S(adder_output),
                                    .cout(1'b0));

    
    twos_complement A_negation(.data_input(reg_A_out),
                                 .Clk(Clk),
                                  .data_output(negated_A));

    mux_wrapper twos_mux(.A(reg_A_out), .C(negated_A), .Select(Sub), .Z(actual_A_out));

    reg_8 register_A(.Clk(Clk),
                     .Reset(Reset_A),
                      .Shift_In(X_wire),
                       .Load(Load_A),
                        .Shift_En(Shift),
                         .D(adder_output[7:0]),
                          .Shift_Out(shift_A_to_B),
                           .Data_Out(reg_A_out));
    reg_8 register_B(.Clk(Clk),
                     .Reset(Reset),
                      .Shift_In(shift_A_to_B),
                       .Load(Load_B),
                        .Shift_En(Shift),
                         .D(switches_out),
                          .Shift_Out(M),
                           .Data_Out(reg_B_out));
    control_unit controller(.Reset(Reset),
                            .Clk(Clk),
                             .Run(Run),
                              .ClearA_LoadB(Reset),
                               .M(M),
                                .Clr_Ld(Clr_Ld), // COMB LOGIC REQUIRED LATER
                                 .Shift_En(Shift),
                                  .Add(Load_A),
                                   .Sub(Sub)); // fix me later



    
    


endmodule