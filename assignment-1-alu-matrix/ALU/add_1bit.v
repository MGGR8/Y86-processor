module add_1bit(cout, sum, a, b, cin);
output cout, sum;
input a, b, cin;
wire g, h, i;

my_xor g1 (a, b, g);
my_xor g2 ( g, cin, sum);
my_and g3 (a, b, h);
my_and g4 (g, cin, i);
my_xor g5 (h,i, cout);

endmodule