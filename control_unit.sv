module control_unit (
    input logic Reset, Clk, Run, ClearA_LoadB, M,
    output logic Clr_Ld, Shift_En, Add, Sub, Hold_Status
    
);


enum logic [4:0] {hold, add1, add2, add3, add4, add5, add6, add7,
shift1, shift2, shift3, shift4, shift5, shift6, shift7, shift8, subtract} curr_state, next_state;

always_ff @ (posedge Clk)  
    begin
        if (Reset)
            curr_state <= hold;
        else 
            curr_state <= next_state;
    end


/*always_ff @ (posedge Clk)
    begin
        if (S[0])
         X <= 1'b1;
        else
        X <= 1'b0;
    end
*/

always_comb
    begin
        
		next_state  = curr_state;	//required because I haven't enumerated all possibilities below
        unique case (curr_state) 

            hold: if(Run)   // If we in hold state, look at least sig bit. If 1, go to add, if 0, go to shift
                begin
                    if(M)
                        next_state = add1;
                    else
                        next_state = shift1;
                end 
            
                add1: 
                begin
                    next_state = shift1;
                end
            
                add2: 
                begin
                    next_state = shift2;
                end
            
                add3: 
                begin
                    next_state = shift3;
                end
            
                add4: 
                begin
                    next_state = shift4;
                end
            
                add5: 
                begin
                    next_state = shift5;
                end
            
                add6: 
                begin
                    next_state = shift6;
                end
            
                add7: 
                begin
                    next_state = shift7;
                end
            
                shift1:
                begin
                    if (M)
                        next_state = add2;
                    else
                        next_state = shift2;
                end

                shift2:
                begin
                    if (M)
                        next_state = add3;
                    else
                        next_state = shift3;
                end

                shift3:
                begin
                    if (M)
                        next_state = add4;
                    else
                        next_state = shift4;
                end

                shift4:
                begin
                    if (M)
                        next_state = add5;
                    else
                        next_state = shift5;
                end

                shift5:
                begin
                    if (M)
                        next_state = add6;
                    else
                        next_state = shift6;
                end

                shift6:
                begin
                    if (M)
                        next_state = add7;
                    else
                        next_state = shift7;
                end

                shift7:
                begin
                    if (M)
                        next_state = subtract;
                    else
                        next_state = shift8;
                end

                shift8:
                begin
                    next_state = hold;
                end

                subtract:
                begin
                    next_state = shift8;
                end			  
        endcase
   
		  // Assign outputs based on ‘state’
        unique case (curr_state) 
        
	   	   hold:
            begin
                Sub = 1'b0;
                Add = 1'b0;
                Shift_En = 1'b0;
                Clr_Ld = ClearA_LoadB;
                Hold_Status = 1'b1;

            end

            add1:
            begin
                Sub = 1'b0;
                Add = 1'b1;
                Shift_En = 1'b0;
                Clr_Ld = 1'b0;
                Hold_Status = 1'b0;
            end

            add2:
            begin
                Sub = 1'b0;
                Add = 1'b1;
                Shift_En = 1'b0;
                Clr_Ld = 1'b0;
                Hold_Status = 1'b0;
            end

            add3:
            begin
                Sub = 1'b0;
                Add = 1'b1;
                Shift_En = 1'b0;
                Clr_Ld = 1'b0;
                Hold_Status = 1'b0;
            end

            add4:
            begin
                Sub = 1'b0;
                Add = 1'b1;
                Shift_En = 1'b0;
                Clr_Ld = 1'b0;
                Hold_Status = 1'b0;
            end

            add5:
            begin
                Sub = 1'b0;
                Add = 1'b1;
                Shift_En = 1'b0;
                Clr_Ld = 1'b0;
                Hold_Status = 1'b0;
            end

            add6:
            begin
                Sub = 1'b0;
                Add = 1'b1;
                Shift_En = 1'b0;
                Clr_Ld = 1'b0;
                Hold_Status = 1'b0;
            end

            add7:
            begin
                Sub = 1'b0;
                Add = 1'b1;
                Shift_En = 1'b0;
                Clr_Ld = 1'b0;
                Hold_Status = 1'b0;
            end

            shift1:
            begin
                Sub = 1'b0;
                Add = 1'b0;
                Shift_En = 1'b1;
                Clr_Ld = 1'b0;
                Hold_Status = 1'b0;
            end

            shift2:
            begin
                Sub = 1'b0;
                Add = 1'b0;
                Shift_En = 1'b1;
                Clr_Ld = 1'b0;
                Hold_Status = 1'b0;
            end

            shift3:
            begin
                Sub = 1'b0;
                Add = 1'b0;
                Shift_En = 1'b1;
                Clr_Ld = 1'b0;
                Hold_Status = 1'b0;
            end

            shift4:
            begin
                Sub = 1'b0;
                Add = 1'b0;
                Shift_En = 1'b1;
                Clr_Ld = 1'b0;
                Hold_Status = 1'b0;
            end

            shift5:
            begin
                Sub = 1'b0;
                Add = 1'b0;
                Shift_En = 1'b1;
                Clr_Ld = 1'b0;
                Hold_Status = 1'b0;
            end

            shift6:
            begin
                Sub = 1'b0;
                Add = 1'b0;
                Shift_En = 1'b1;
                Clr_Ld = 1'b0;
                Hold_Status = 1'b0;
            end

            shift7:
            begin
                Sub = 1'b0;
                Add = 1'b0;
                Shift_En = 1'b1;
                Clr_Ld = 1'b0;
                Hold_Status = 1'b0;
            end

            shift8:
            begin
                Sub = 1'b0;
                Add = 1'b0;
                Shift_En = 1'b1;
                Clr_Ld = 1'b0;
                
            end

            subtract:
            begin
                Sub = 1'b1;
                Add = 1'b0;
                Shift_En = 1'b0;
                Clr_Ld = 1'b0;
            end
            
        endcase
    end


endmodule