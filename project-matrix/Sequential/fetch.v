`timescale 1ns / 1ps

module fetch(pc_i,inst_i,valC_o,valP_o,dstE_o,error_mem_i,dstM_o,icode_o,ifun_o,f_rA_o,f_rB_o,predPC,stat_o);

input [63:0] pc_i;
input [79:0] inst_i;
input error_mem_i;
    
output reg [3:0] icode_o,ifun_o,f_rA_o,f_rB_o,dstE_o,dstM_o;
output reg [63:0] valC_o,valP_o,predPC;
output reg [2:0] stat_o;

always @(pc_i, inst_i, error_mem_i)
begin
	icode_o = inst_i[79:76];
        ifun_o = inst_i[75:72];
        f_rA_o = 4'HF;
        f_rB_o = 4'HF;
        valC_o = 64'H0;
        valP_o = 64'H0;
        dstE_o = 4'HF;
        dstM_o = 4'HF;
        stat_o = 3'B000;
        predPC = 64'H0;
       
       if(error_mem_i == 1'B0)
        begin
            case(icode_o)
                4'H0:
                    begin
                        valP_o = pc_i + 64'H1;
                        predPC = valP_o;
                        stat_o = 3'B100;
                    end
                4'H1:
                    begin
                        valP_o = pc_i + 64'H1;
                        predPC = valP_o;
                        stat_o = 3'B000;
                    end
                4'H2:
                    begin
                                            
                        f_rB_o = inst_i[67:64];stat_o = 3'B000;valP_o = pc_i + 64'H2;predPC = valP_o;f_rA_o = inst_i[71:68];
                
                        dstE_o = f_rB_o;
                    end
                4'H6:
                    begin
                    
                        f_rB_o = inst_i[67:64];
                       
                        dstE_o = f_rB_o; valP_o = pc_i + 64'H2;
                        predPC = valP_o;                        f_rA_o = inst_i[71:68];
                                              
                        stat_o = 3'B000;
                    end
                4'H5:
                    begin
                        f_rA_o = inst_i[71:68];
                        f_rB_o = inst_i[67:64];
                        valC_o = {inst_i[7:0], inst_i[15:8], inst_i[23:16], inst_i[31:24],
                                    inst_i[39:32], inst_i[47:40], inst_i[55:48], inst_i[63:56]};
                        valP_o = pc_i + 64'HA;
                        predPC = valP_o;
                        dstM_o = f_rB_o;
                        stat_o = 3'B000;
                    end
                4'H3:
                    begin
                        f_rA_o = inst_i[71:68];
                        f_rB_o = inst_i[67:64];
                        valC_o = {inst_i[7:0], inst_i[15:8], inst_i[23:16], inst_i[31:24],
                                    inst_i[39:32], inst_i[47:40], inst_i[55:48], inst_i[63:56]};
                        valP_o = pc_i + 64'HA;
                        predPC = valP_o;
                        dstE_o = f_rB_o;
                        stat_o = 3'B000;
                    end
                4'H4:
                    begin
                       
                        valC_o = {inst_i[7:0], inst_i[15:8], inst_i[23:16], inst_i[31:24],
                                    inst_i[39:32], inst_i[47:40], inst_i[55:48], inst_i[63:56]};
                        valP_o = pc_i + 64'HA;                        predPC = valP_o; f_rA_o = inst_i[71:68];
                        f_rB_o = inst_i[67:64];                        stat_o = 3'B000;
                    end
                4'H9:
                    begin
                        f_rA_o = 4'H4;
                       
                        dstE_o = 4'H4; f_rB_o = 4'H4;
                        valP_o = pc_i + 64'H1;
                        stat_o = 3'B000;
                    end
                
                4'H7:
                    begin
                        valC_o = {inst_i[15:8], inst_i[23:16], inst_i[31:24], inst_i[39:32],
                                    inst_i[47:40], inst_i[55:48], inst_i[63:56], inst_i[71:64]};
                        valP_o = pc_i + 64'H9;
                        predPC = valC_o;
                        stat_o = 3'B000;
                    end
                
                4'HB:
                    begin
                        f_rA_o = 4'H4;
                        f_rB_o = 4'H4;
                        valP_o = pc_i + 64'H2;
                        predPC = valP_o;
                        dstE_o = 4'H4;
                        dstM_o = inst_i[71:68];
                        stat_o = 3'B000;
                    end
                
                4'HA:
                    begin
                        f_rA_o = inst_i[71:68];
                        f_rB_o = 4'H4;
                        valP_o = pc_i + 64'H2;
                        predPC = valP_o;
                        dstE_o = 4'H4;
                        stat_o = 3'B000;
                    end
                 4'H8:
                    begin
                         dstE_o = 4'H4;
                        stat_o = 3'B000;
                        valC_o = {inst_i[15:8], inst_i[23:16], inst_i[31:24], inst_i[39:32],
                                    inst_i[47:40], inst_i[55:48], inst_i[63:56], inst_i[71:64]};
                        valP_o = pc_i + 64'H9;
                        predPC = valC_o;f_rA_o = 4'H4;
                        f_rB_o = 4'H4;
                       
                    end
                default:
                    begin   
                        valP_o = pc_i + 64'H1;
                        predPC = valP_o;
                        stat_o = 3'B001;
                    end
            endcase
        end
        else
        begin
            stat_o = 3'B010;
        end
    end

endmodule
