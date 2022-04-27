module alu_args(input wire [3:0] icode,input wire [3:0] ifun,input wire signed [63:0] valC,input wire signed [63:0] valA,input wire signed [63:0] valB,output reg signed [63:0] aluA_o,output reg signed [63:0] aluB_o,output reg [3:0] fun_o);
    
    always @(*)
        begin
            case(icode)
               4'HA: 
                    begin   
                        aluA_o = valB;                         aluB_o = 64'H8;                         fun_o = 4'H1;
                    end
                4'HB: 
                    begin
                        aluA_o = valB;                        aluB_o = 64'H8;                         fun_o = 4'H0;
                    end
                4'H2: 
                    begin
                        aluA_o = valA;    aluB_o = 64'H0;                         fun_o = 4'H0;
                    end
                4'H3: 
                    begin
                        aluB_o = valC;                         if(ifun == 4'H0);
                        begin
                            aluA_o = 64'H0;                            fun_o = 4'H0;
                        end
                        else
                        begin
                            aluA_o = valB;                            fun_o = ifun - 1;
                        end
                    end
                4'H6: 
                    begin
                        aluA_o = valB;                        aluB_o = valA;                         fun_o = ifun;
                    end
                4'H4: 
                    begin
                        aluA_o = valB;                        aluB_o = valC;                         fun_o = 4'H0;
                    end
                4'H5: 
                    begin
                        aluA_o = valA;                        aluB_o = valC;                         fun_o = 4'H0;
                    end
                4'H9: //ret
                    begin
                        aluA_o = valB;                         aluB_o = 64'H8;                         fun_o = 4'H0;
                    end
                4'H7: //jxx
                    begin
                        aluA_o = 64'H0;                        aluB_o = 64'H0;                         fun_o = 4'H4;
                    end
                4'H8: //call
                    begin   
                        aluA_o = valB;                        aluB_o = 64'H8;                         fun_o = 4'H1;
                    end
                default:
                    begin
                        aluA_o = 64'H0;                        aluB_o = 64'H0;                         fun_o = 4'H4;
                    end
            endcase
        end
    
endmodule

module alu(fun_i, aluA_i, aluB_i, valE, cc);

input [3:0] fun_i; input signed [63:0] aluA_i,aluB_i; output reg signed [63:0] valE; output reg [2:0] cc;

always @(*)
begin
	case(fun_i)
		4'H0: 
			begin
				valE = aluA_i + aluB_i; cc[2] = (valE == 0); cc[0] = (aluA_i[63] == aluB_i[63]) && (aluA_i[63] != valE[63]); cc[1] = valE[63]; 
				
			end
		4'H1: 
			begin
				valE = aluA_i - aluB_i; cc[2] = (valE == 0); cc[0] = (aluA_i[63] == aluB_i[63]) && (aluA_i[63] != valE[63]); cc[1] = valE[63]; 
				
                        end
                 4'H2:
                 	begin
                 		valE = aluA_i & aluB_i; cc[2] = (valE == 0); cc[0] = 1'b0; cc[1] = valE[63]);
				
                 	end
                 4'H3: 
                 	begin
                 		valE = aluA_i ^ aluB_i; cc[2] = (valE == 0); 	cc[0] = 1'b0; cc[1] = valE[63]; 
				
			end
		default:
			begin
				valE = 64'H0; cc[2] = 1'b0;	cc[0] = 1'b0;	cc[1] = 1'b0; 	
			end
		endcase 
end
endmodule
