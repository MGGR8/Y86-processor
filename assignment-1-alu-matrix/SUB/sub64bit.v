module sub64bit (overflow, out, a, b);
input signed [63:0] a, b;
output overflow;
output signed [63:0] out;
wire signed [64:0] c;
assign c[0] = 1'b0;
wire signed [63:0] b_co;
wire signed [63:0] b_co_r;
wire o;

genvar i;

for( i = 0; i<=63; i = i + 1)
begin
    not(b_co[i] , b[i]);
end

add64bit m2 (o, b_co_r, b_co, 64'b1);

add64bit m3 (overflow, out, a, b_co_r);

endmodule 

