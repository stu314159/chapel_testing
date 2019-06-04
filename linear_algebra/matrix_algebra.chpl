use LinearAlgebra;
use LAPACK;
use Random;

config const n=50;

// create two nxn matrices (A and B)
// and two nx1(?) vectors (x and y)
var A = Matrix(n,n), 
    B = Matrix(n,n),
    x,y = Vector(n);

fillRandom(B);
fillRandom(x);

// y = B*x
y = dot(B,x);

//A = x'*y
A = outer(x,y);

writeln(A[1,1]);

var X = Matrix(n,1);
var Y = Matrix(n,1);

// I think this simply copies x into a matrix object X
X({1..n},1) = x({1..n});

// Re-assign A as identiy matrix of size nxn
A = eye(n);

// no idea really what this is supposed to be...
var ipiv : [1..n] c_int;

Y = X;

var info = gesv(lapack_memory_order.row_major,A,ipiv,Y);

var res = + reduce abs(x-y);

writeln(res);


