module two_to_one_mux (input A, C, Select, output Z);
	assign Z = (A & Select) | (~Select & C);
endmodule


module mux_wrapper (input [7:0] A, C, input Select, output [7:0] Z);
	
	two_to_one_mux mux_one (.A(A[0]), .C(C[0]), .Select(Select), .Z(Z[0]));
	two_to_one_mux mux_two (.A(A[1]), .C(C[1]), .Select(Select), .Z(Z[1]));
	two_to_one_mux mux_three (.A(A[2]), .C(C[2]), .Select(Select), .Z(Z[2]));
	two_to_one_mux mux_four (.A(A[3]), .C(C[3]), .Select(Select), .Z(Z[3]));
	two_to_one_mux mux_five (.A(A[4]), .C(C[4]), .Select(Select), .Z(Z[4]));
	two_to_one_mux mux_six (.A(A[5]), .C(C[5]), .Select(Select), .Z(Z[5]));
	two_to_one_mux mux_seven (.A(A[6]), .C(C[6]), .Select(Select), .Z(Z[6]));
	two_to_one_mux mux_eight (.A(A[7]), .C(C[7]), .Select(Select), .Z(Z[7]));
	
endmodule