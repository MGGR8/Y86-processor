module ALU(overflow, c,a,b, op);
input signed [63:0] a,b;
input [1:0] op;
output signed [63:0] c;
output overflow;

wire signed [63:0] sum;
wire signed [63:0] diff;
wire signed [63:0] and1;
wire signed [63:0] xor1;
reg mg_ovrflw;
reg [63:0] cout;
wire ovrflw1, overflw2;

add64bit A1 (ovrflw1, sum, a, b);
sub64bit S1 (overflw2, diff, a, b);
and64bit A2 (a, b, and1);
xor64bit X1 (a, b, xor1);

always@(*)
    begin
    if(op == 2'b00)    
    begin  
        mg_ovrflw = ovrflw1;
        cout = sum;
    end 
    else if (op == 2'b01)
    begin 
        mg_ovrflw = overflw2;
        cout = diff;
    end
    else if (op == 2'b10) 
    begin
        mg_ovrflw = 0;
        cout = and1;
    end
    else if (op == 2'b11)
    begin 
        mg_ovrflw = 0;
        cout = xor1;
    end
    end

assign overflow = mg_ovrflw;
assign c = cout;
endmodule