`timescale 1ns / 1ps

module decode_test;

wire [63:0] rax,rcx,rdx,rbx,valC, valP, predPC,rsp,rbp,rsi,rdi,r8,r9,r10,r11,r12,r13,r14, valA, valB;
wire [2:0] stats;
wire [3:0] icode, ifun, rA, rB, dstE, dstM;
reg [63:0] pc, valE, valM;
reg [79:0] instr;
reg merr;
fetch first(
	.pc_i(pc),	.inst_i(instr),	.error_mem_i(merr),	.icode_o(icode),	.ifun_o(ifun),	.f_rA_o(rA),	.f_rB_o(rB),	.valC_o(valC),	.valP_o(valP),	.dstE_o(dstE),	.dstM_o(dstM),	.predPC(predPC),	.stat_o(stats)
);

decode second (
	.icode(icode),	.srcA(rA),	.srcB(rB),	.valA(valA),	.valB(valB),	.dstE(dstE),	.dstM(dstM),	.valE(valE),	.valM(valM)
);

initial begin
	   
	   $dumpfile("decode_test.vcd");
	   $dumpvars(0,decode_test);
	   
	   pc = 64'b0;
	   instr = 80'b0101_0000_0100_1010_0110_1101_1100_1011_0100_0000_0100_0000_0000_0000_0000_0000_0000_0000_0000_0000;
	   merr = 1'b0;
	   
	   
end

initial begin
	   
		$monitor("icode = %d ifun = %d rA=%d rB = %d valC = %d valP = %d, dstM = %d, dstE = %d, predPC = %d, valA = %d, valB = %d stat =  %d, \n",icode,ifun,rA,rB,valC,valP,dstM,dstE,predPC,valA,valB,stats);
		
end
endmodule
