module xor_test;
    
reg signed [63:0]a;
reg signed [63:0]b;

wire signed [63:0]out;

xor64bit uut( .a(a), .b(b), .out(out) );

initial begin

$dumpfile("xor64bit.vcd");
$dumpvars(0, xor_test);

// giving inputs
a = 64'b1111111111;
b = 64'b1101101000;
#20;
a = 64'b1111111011;
b = 64'b1111111001;
#20;
a =  64'b1010101010;
b =  64'b1010101010;
end

//printing outputs

initial
$monitor ("XOR Inputs:\n        a = %b = %d\n        b = %b = %d\nXOR output\n      Out = %b = %d\n", a, a, b, b, out, out);



endmodule