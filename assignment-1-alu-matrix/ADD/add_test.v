module add_test;
    
reg signed [63:0]a;
reg signed [63:0]b;

wire overflow;
wire signed [63:0]out;

add64bit A1 (overflow, out, a, b);

initial begin

$dumpfile("add64bit.vcd");
$dumpvars();

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
b =  64'b0111111111111111111111111111111111111111111111111111111111111100;
end


//printing outputs

initial
$monitor ("ADD Inputs:\n        a = %b = %d\n        b = %b = %d\nADD output\n      Out = %b = %d\noverflow = %b", a, a, b, b, out, out, overflow);



endmodule