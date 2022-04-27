`timescale 1ns / 1ps

module decode(icode,srcA, srcB,valA,valB,dstE,dstM,valE,valM);

output reg [63:0] valA, valB;
input wire [3:0] srcA, srcB,dstE,dstM,icode;
input wire [63:0] valE,valM;
reg signed [63:0] rax,rcx,rdx,rbx,rsp;
reg signed [63:0] rbp,rsi,rdi,r8,r9;
reg signed [63:0] r10,r11,r12,r13,r14;


always @(*)
begin

if(icode == 4'H4)
begin
	case (srcA)
	0: valA <= rax;
	1: valA <= rcx;
	2: valA <= rdx;
	3: valA <= rbx;
	4: valA <= rsp;
	5: valA <= rbp;
	6: valA <= rsi;
	7: valA <= rdi;
	8: valA <= r8;
	9: valA <= r9;
	10: valA <= r10;
	11: valA <= r11;
	12: valA <= r12;
	13: valA <= r13;
	14: valA <= r14;
	15: valA <= 0;
	endcase
end

else if(icode == 4'H3)
begin
	case(dstE)
	0: rax <= valE;
	1: rcx <= valE;
	2: rdx <= valE;
	3: rbx <= valE;
	4: rsp <= valE;
	5: rbp<= valE;
	6: rsi<= valE;
	7: rdi <= valE;
	8: r8 <= valE;
	9: r9 <= valE;
	10: r10 <= valE;
	11: r11 <= valE;
	12: r12 <= valE;
	13: r13 <= valE;
	14: r14 <= valE;
	endcase
end

else if(icode == 4'H5)
begin
	case(dstM)
	0: rax <= valM;
	1: rcx <= valM;
	2: rdx <= valM;
	3: rbx <= valM;
	4: rsp <= valM;
	5: rbp<= valM;
	6: rsi<= valM;
	7: rdi <= valM;
	8: r8 <= valM;
	9: r9 <= valM;
	10: r10 <= valM;
	11: r11 <= valM;
	12: r12 <= valM;
	13: r13 <= valM;
	14: r14 <= valM;
	endcase
end


else if(icode == 4'H8)
begin
	valB <= rsp;
	rsp <= valE;
end

else if(icode == 4'H6)
begin

	case(dstE)
	0: rax <= valE;
	1: rcx <= valE;
	2: rdx <= valE;
	3: rbx <= valE;
	4: rsp <= valE;
	5: rbp<= valE;
	6: rsi<= valE;
	7: rdi <= valE;
	8: r8 <= valE;
	9: r9 <= valE;
	10: r10 <= valE;
	11: r11 <= valE;
	12: r12 <= valE;
	13: r13 <= valE;
	14: r14 <= valE;
	endcase

	case (srcB)
	0: valB <= rax;
	1: valB <= rcx;
	2: valB <= rdx;
	3: valB <= rbx;
	4: valB <= rsp;
	5: valB <= rbp;
	6: valB <= rsi;
	7: valB <= rdi;
	8: valB <= r8;
	9: valB <= r9;
	10: valB <= r10;
	11: valB <= r11;
	12: valB <= r12;
	13: valB <= r13;
	14: valB <= r14;
	15: valB <= 0;
	endcase

	case (srcA)
	0: valA <= rax;
	1: valA <= rcx;
	2: valA <= rdx;
	3: valA <= rbx;
	4: valA <= rsp;
	5: valA <= rbp;
	6: valA <= rsi;
	7: valA <= rdi;
	8: valA <= r8;
	9: valA <= r9;
	10: valA <= r10;
	11: valA <= r11;
	12: valA <= r12;
	13: valA <= r13;
	14: valA <= r14;
	15: valA <= 0;
	endcase
		

end

else if(icode == 4'H9)
begin
	valA <= rsp;
	valB <= rsp;
	rsp <= valE;
end

else if(icode == 4'Ha)
begin
	case (srcA)
	0: valA <= rax;
	1: valA <= rcx;
	2: valA <= rdx;
	3: valA <= rbx;
	4: valA <= rsp;
	5: valA <= rbp;
	6: valA <= rsi;
	7: valA <= rdi;
	8: valA <= r8;
	9: valA <= r9;
	10: valA <= r10;
	11: valA <= r11;
	12: valA <= r12;
	13: valA <= r13;
	14: valA <= r14;
	15: valA <= 0;
	endcase
	valB <= rsp;
	rsp <= valE;
end

else if(icode == 4'Hb)
begin
	valA <= rsp;
	valB <= rsp;
	rsp <= valE;
	case(dstM)
	0: rax <= valM;
	1: rcx <= valM;
	2: rdx <= valM;
	3: rbx <= valM;
	4: rsp <= valM;
	5: rbp<= valM;
	6: rsi<= valM;
	7: rdi <= valM;
	8: r8 <= valM;
	9: r9 <= valM;
	10: r10 <= valM;
	11: r11 <= valM;
	12: r12 <= valM;
	13: r13 <= valM;
	14: r14 <= valM;
	endcase
end

else if(icode == 4'H2)
begin
	case (srcA)
	0: valA <= rax;
	1: valA <= rcx;
	2: valA <= rdx;
	3: valA <= rbx;
	4: valA <= rsp;
	5: valA <= rbp;
	6: valA <= rsi;
	7: valA <= rdi;
	8: valA <= r8;
	9: valA <= r9;
	10: valA <= r10;
	11: valA <= r11;
	12: valA <= r12;
	13: valA <= r13;
	14: valA <= r14;
	15: valA <= 0;
	endcase
	
	case(dstE)
	0: rax <= valE;
	1: rcx <= valE;
	2: rdx <= valE;
	3: rbx <= valE;
	4: rsp <= valE;
	5: rbp<= valE;
	6: rsi<= valE;
	7: rdi <= valE;
	8: r8 <= valE;
	9: r9 <= valE;
	10: r10 <= valE;
	11: r11 <= valE;
	12: r12 <= valE;
	13: r13 <= valE;
	14: r14 <= valE;
	endcase
end

end
endmodule











































