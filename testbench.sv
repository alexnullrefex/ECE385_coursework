module testbench();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;


logic Clk = 0;
logic Reset_LoadB, Run, Shift, Add, Sub, Clr_Ld;
logic [7:0] my_switches, RegA_guts, RegB_guts;
logic [6:0] unused1, unused2, unused3, unused4;
logic [8:0] Adder_9_output;

integer errors = 0;

Multiplier my_multiplier(.Switches(my_switches),
                             .Run(Run),
                              .Reset(Reset_LoadB),
                               .AhexL(unused1),
                                .AhexU(unused2),
                                 .BhexL(unused3),
                                  .BhexU(unused4),
                                   .RegA_guts(RegA_guts),
                                    .RegB_guts(RegB_guts),
                                     .Clk(Clk),
                                      .Shift_out(Shift),
                                       .Add_out(Add),
                                        .Sub_out(Sub),
                                         .Clrd_out(Clr_Ld),
                                          .Adder_9_out(Adder_9_output));

always begin : CLK_UPDATE
    #1 Clk = ~Clk;
end

initial begin : CLK_INIT
    Clk = 0;
end 

initial begin : FIRST_INIT

    Reset_LoadB = 1;
    Run = 0;
    my_switches = 8'h02;

    //#1 Reset_LoadB = 1;

    if(RegB_guts != 8'h02)
        errors++;

    #2 Reset_LoadB = 0;

    #1 Run = 1;


    #1 Run = 0;


end


endmodule