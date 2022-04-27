module and64bit(
    input signed [63:0]a,
    input signed [63:0]b,
    output signed [63:0]out
);

genvar i,k,l,m;

generate 

for (i = 0; i < 64; i = i+1)

    begin
    
        my_and g1(a[i],b[i],out[i]);
    end

endgenerate

endmodule