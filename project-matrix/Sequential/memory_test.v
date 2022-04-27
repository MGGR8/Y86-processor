`timescale 1ns / 1ps

module memory_test;

wire [63:0] rax,rcx,rdx,rbx,valC, valP, predPC,rsp,rbp,rsi,rdi,r8,r9,r10,r11,r12,r13,r14, valA, valB;
wire [2:0] stats;
wire [3:0] icode, ifun, rA, rB, dstE, dstM;
reg [63:0] pc, valE, valM;
reg [79:0] instr;
reg merr;

wire signed [63:0] aluA, aluB, valE;
wire [3:0] funi;
wire [2:0] cc;

wire [63:0] addr;
wire write, error;
wire signed [63:0] data_i, data_o, check;

fetch first(
	.pc_i(pc),	.inst_i(instr),	.error_mem_i(merr),	.icode_o(icode),	.ifun_o(ifun),	.f_rA_o(rA),	.f_rB_o(rB),	.valC_o(valC),	.valP_o(valP),	.dstE_o(dstE),	.dstM_o(dstM),	.predPC(predPC),	.stat_o(stats)
);

decode second (
	.icode(icode),	.srcA(rA),	.srcB(rB),	.valA(valA),	.valB(valB),	.dstE(dstE),	.dstM(dstM),	.valE(valE),	.valM(valM)
);

alu_args third(
	.icode(f_icode_o), 	.ifun(f_ifun_o), 	.valC(f_valC_o), 	.valA(valA), 	.valB(valB), 	.aluA_o(aluA), 	.aluB_o(aluB), 	.fun_o(funi)
);

alu fourth(
	.fun_i(funi), 	.aluA_i(aluA), 	.aluB_i(aluB), 	.valE(valE), 	.cc(cc)
);

data_addr fifth(
	.M_valE_i(valE), 	.M_valA_i(valA), 	.M_icode_i(f_icode_o), 	.addr(addr), 	.write(write)
);

mem_data sixth(
	.valA(valA), 	.valP(f_valP_o),	.icode(f_icode_o),	.data_i(data_i)
);

data_mem seventh(
	.write(write),	.addr(addr),	.data_i(data_i),	.data_o(data_o),	.error(error),	.check(check)
);

initial begin
	   
	   $dumpfile("memory_test.vcd");
	   $dumpvars(0,memory_test);
	   
	  pc = 64'b0;
	   instr = 80'b0101_0000_0100_1010_0110_1101_1100_1011_0100_0000_0100_0000_0000_0000_0000_0000_0000_0000_0000_0000;
	   merr = 1'b0;
	   
end

initial begin
		$monitor("icode = %d ifun = %d rA=%d rB = %d valC = %d valP = %d, dstE = %d, dstM = %d, predPC = %d,stat =  %d, valA = %d, valB = %d, valE = %d, ZF = %d, SF = %d, OF = %d, data_out = %d, check = %d, addr = %d, data_in = %d, error = %d, write = %d \n",f_icode_o,f_ifun_o,f_rA_o,f_rB_o,f_valC_o,f_valP_o,f_dstE_o,f_dstM_o,f_predPC_o,f_stat_o,valA,valB,valE,cc[2],cc[1],cc[0],data_o,check,addr,data_i,error,write);
		
end

endmodule
