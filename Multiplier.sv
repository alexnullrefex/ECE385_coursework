module Multiplier(

    input logic [7:0] Switches,
    input logic Run, Reset, Clk,
    output logic [6:0] AhexL, AhexU, BhexL, BhexU,
    output logic [7:0] RegA_guts, RegB_guts,
    output logic Shift_out, Add_out, Sub_out, Clrd_out,
    output logic [8:0] Adder_9_out
);


    logic [7:0] reg_A_out, reg_B_out, switches_out, negated_A, actual_A_out;
    logic [8:0] adder_output;
    logic Load_B, Load_A, Shift, shift_A_to_B, M, X_wire, Reset_A, Clr_Ld, Sub;
    logic unused_cout;
    logic mux_x_output;

    assign Reset_A = Clr_Ld | Reset;
    assign Load_B = Clr_Ld;



    //Debugging
    assign Shift_out = Shift;
    assign Add_out = Load_A;
    assign Sub_out = Sub;
    assign Clrd_out = Clr_Ld;
    assign Adder_9_out = adder_output;
    assign RegA_guts = reg_A_out;
    assign RegB_guts = reg_B_out;
    //End debug


    d_flip_flop X(.Clk(Clk), .D_in(mux_x_output), .D_out(X_wire));

    two_to_one_mux clear_x_signal(.Select(Hold_Status), .A(1'b0), .C(adder_output[8]), .Z(mux_x_output));

    //switches synchronized_switches(.Clk(Clk), .switch_in(Switches), .switch_out(switches_out));

    ripple_adder nine_bit_adder(.A( {actual_A_out[7], actual_A_out} ),
                                 .B( {Switches[7], Switches} ),
                                  .cin(1'b0),
                                   .S(adder_output),
                                    .cout(unused_cout));

    
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
                     .Reset(1'b0),
                      .Shift_In(shift_A_to_B),
                       .Load(Clr_Ld),
                        .Shift_En(Shift),
                         .D(Switches),
                          .Shift_Out(M),
                           .Data_Out(reg_B_out));
    control_unit controller(
                            .Clk(Clk),
                             .Run(Run),
                              .ClearA_LoadB(Reset),
                               .M(M),
                                .Clr_Ld(Clr_Ld), // COMB LOGIC REQUIRED LATER
                                 .Shift_En(Shift),
                                  .Add(Load_A),
                                   .Sub(Sub));

    HexDriver        HexAL (
                        .In0(reg_A_out[3:0]),
                        .Out0(AhexL) );
	HexDriver        HexBL (
                        .In0(reg_B_out[3:0]),
                        .Out0(BhexL) );
	HexDriver        HexAU (
                        .In0(reg_A_out[7:4]),
                        .Out0(AhexU) );	
	HexDriver        HexBU (
                       .In0(reg_B_out[7:4]),
                        .Out0(BhexU) );

    
    


endmodule