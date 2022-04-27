module sub_test;
    
reg signed [63:0]a;
reg signed [63:0]b;

wire signed [63:0]out;
wire overflow;

sub64bit uut( .overflow(overflow), .a(a), .b(b), .out(out) );

initial begin

$dumpfile("sub64bit.vcd");
$dumpvars(0, sub_test);
// giving inputs
a = 64'b1111111111;
b = 64'b1101101000;
#20;
a = 64'b1111111011;
b = 64'b1111111001;
#20;
a =  64'b1010101010;
b =  64'b1010101010;
#20;
a =  64'b0111111111111111111111111111111111111111111111111111111111111111;
b =  -64'b0111111111111111111111111111111111111111111111111111111111111100;
end

initial
$monitor ("SUB Inputs:\n        a = %b = %d\n        b = %b = %d\nSUBoutput\n      Out = %b = %d\nOverflow = %b\n", a, a, b, b, out, out, overflow);

endmodule