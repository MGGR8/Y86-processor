module data_addr ( addr, write, M_valE_i, M_valA_i, M_icode_i);

    output reg [63:0] addr; output reg write;
    
    input wire signed [63:0] M_valE_i; input wire signed [63:0] M_valA_i; input wire [3:0] M_icode_i;
        
    always @(*)
        begin
            if(M_icode_i == 4'H8 || M_icode_i == 4'HA)
                begin
                    write = 1'B1;
                    addr = M_valE_i;
                end
            else if(M_icode_i == 4'H9 || M_icode_i == 4'HB)
                begin
                    write = 1'B0;
                    addr = M_valA_i;
                end
            else if(M_icode_i == 4'H4)
                begin
                    write = 1'B1;
                    addr = M_valE_i;
                end
            else if(M_icode_i == 4'H5)
                begin
                    write = 1'B0;
                    addr = M_valE_i;
                end
            else
                begin
                    write = 1'B0;
                    addr = 64'H0;
                end
        end
endmodule


module mem_data(icode, data_i, valA, valP);

input wire [3:0] icode; input wire [63:0] valP; input wire signed [63:0] valA;

output reg signed [63:0] data_i; 

always @(*)
	begin
		if(icode == 4'H8)
			data_i = valP;
		else if(icode == 4'H4) 
			data_i = valA;
		else
			data_i = 64'H0;
	end
endmodule

module data_mem(data_o, error,check, write, addr, data_i);

input wire write; input wire [63:0] addr; input wire signed [63:0] data_i; 
output reg signed [63:0] data_o; output reg error; output reg signed [63:0] check; 

reg signed [7:0] mem [0:25];

initial
	begin
		error = 1'b0;
		data_o = 64'H0;
	end
	
always @(*)
	begin
		if(addr > 17)
			error = 1'b1;
		else if(write == 1'b0 && addr <= 17)
		begin
			data_o = {mem[addr], mem[addr+1], mem[addr+2], mem[addr+3], mem[addr+4], mem[addr+5], mem[addr+6], mem[addr+7]};
                	error = 1'b0;
		end
		else if(write == 1'b1 && addr <= 17)
		begin
				{mem[addr], mem[addr+1], mem[addr+2], mem[addr+3], mem[addr+4], mem[addr+5], mem[addr+6], mem[addr+7]} = data_i;
                    		error = 1'b0;
		end
		else
			error = error;
			
		check <= {mem[addr], mem[addr+1], mem[addr+2], mem[addr+3], mem[addr+4], mem[addr+5], mem[addr+6], mem[addr+7]};
	end
endmodule
