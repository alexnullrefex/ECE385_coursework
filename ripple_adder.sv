module full_adder
(
	input A, B, cin,
	output S, cout
);

	
	assign S = A ^ B ^ cin;
	assign cout = (A & B) | (B & cin) | (A & cin);

endmodule


module ripple_adder
(
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output        cout
);

    /* TODO
     *
     * Insert code here to implement a ripple adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
	  
	  logic [14:0] C; //Wires from carry outs to next carry ins
	  
	  
	  full_adder adder0 (.A(A[0]), .B(B[0]), .cin(cin), .S(S[0]), .cout(C[0]));
	  full_adder adder1 (.A(A[1]), .B(B[1]), .cin(C[0]), .S(S[1]), .cout(C[1]));
	  full_adder adder2 (.A(A[2]), .B(B[2]), .cin(C[1]), .S(S[2]), .cout(C[2]));
	  full_adder adder3 (.A(A[3]), .B(B[3]), .cin(C[2]), .S(S[3]), .cout(C[3]));
	  full_adder adder4 (.A(A[4]), .B(B[4]), .cin(C[3]), .S(S[4]), .cout(C[4]));
	  full_adder adder5 (.A(A[5]), .B(B[5]), .cin(C[4]), .S(S[5]), .cout(C[5]));
	  full_adder adder6 (.A(A[6]), .B(B[6]), .cin(C[5]), .S(S[6]), .cout(C[6]));
	  full_adder adder7 (.A(A[7]), .B(B[7]), .cin(C[6]), .S(S[7]), .cout(C[7]));
	  full_adder adder8 (.A(A[8]), .B(B[8]), .cin(C[7]), .S(S[8]), .cout(C[8]));
	  full_adder adder9 (.A(A[9]), .B(B[9]), .cin(C[8]), .S(S[9]), .cout(C[9]));
	  full_adder adder10 (.A(A[10]), .B(B[10]), .cin(C[9]), .S(S[10]), .cout(C[10]));
	  full_adder adder11 (.A(A[11]), .B(B[11]), .cin(C[10]), .S(S[11]), .cout(C[11]));
	  full_adder adder12 (.A(A[12]), .B(B[12]), .cin(C[11]), .S(S[12]), .cout(C[12]));
	  full_adder adder13 (.A(A[13]), .B(B[13]), .cin(C[12]), .S(S[13]), .cout(C[13]));
	  full_adder adder14 (.A(A[14]), .B(B[14]), .cin(C[13]), .S(S[14]), .cout(C[14]));
	  full_adder adder15 (.A(A[15]), .B(B[15]), .cin(C[14]), .S(S[15]), .cout(cout));

     
endmodule
