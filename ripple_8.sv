module ripple_8
(
	input  logic [7:0] A, B,
	input  logic       cin,
	output logic [7:0] S,
	output logic       cout
);

    /* TODO
     *
     * Insert code here to implement a ripple adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
	  
	  logic [7:0] C; //Wires from carry outs to next carry ins
	  
	  
	  full_adder adder0 (.A(A[0]), .B(B[0]), .cin(cin), .S(S[0]), .cout(C[0]));
	  full_adder adder1 (.A(A[1]), .B(B[1]), .cin(C[0]), .S(S[1]), .cout(C[1]));
	  full_adder adder2 (.A(A[2]), .B(B[2]), .cin(C[1]), .S(S[2]), .cout(C[2]));
	  full_adder adder3 (.A(A[3]), .B(B[3]), .cin(C[2]), .S(S[3]), .cout(C[3]));
	  full_adder adder4 (.A(A[4]), .B(B[4]), .cin(C[3]), .S(S[4]), .cout(C[4]));
	  full_adder adder5 (.A(A[5]), .B(B[5]), .cin(C[4]), .S(S[5]), .cout(C[5]));
	  full_adder adder6 (.A(A[6]), .B(B[6]), .cin(C[5]), .S(S[6]), .cout(C[6]));
	  full_adder adder7 (.A(A[7]), .B(B[7]), .cin(C[6]), .S(S[7]), .cout(cout));

     
endmodule