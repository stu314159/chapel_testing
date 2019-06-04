config const n=5;

var A: [1..n] real;
var B: [1..n] real;

for i in 1..n {
  A(i) = i;
  B(i) = i;
}
writeln("A is: ",A,"\n");
writeln("B is: ", B,"\n");

var C: [1..n] real;
C = A + B;

writeln("C =\n",C,"\n");

writeln("sum = ",+ reduce C,"\n");


