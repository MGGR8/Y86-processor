module add64bit (overflow, out, a, b);
input signed [63:0] a, b;
output overflow;
output signed [63:0] out;
wire signed [64:0] c;
assign c[0] = 1'b0;


genvar i;
for( i = 0; i<64; i = i + 1)
begin
    add_1bit g1 (c[i+1], out[i],a[i], b[i], c[i]);
end

my_xor g2 (c[63], c[64], overflow);

endmodule 

