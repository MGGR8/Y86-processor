module xor64bit(
    input signed [63:0]a,
    input signed [63:0]b,
    output signed [63:0]out
);

genvar i;

generate 

for (i = 0; i < 64; i = i+1)

    begin
        my_xor g_xor(a[i], b[i],out[i]);
    end

endgenerate

endmodule