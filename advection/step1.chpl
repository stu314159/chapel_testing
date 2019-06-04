// simple finite-difference simulation for the
// linear scalar advection equation.
//
// represents step 1 in the 12-steps to CFD

config const Nx = 41;
var ProbSpace: domain(1) = {1..Nx};

var dx = 2.0/(Nx-1.0);

writeln("Nx = ",Nx," and dx = ",dx); 

config const nt = 25;
config const dt = 0.025;
var c = 1.0;

writeln("nt = ",nt);
writeln("dt = ",dt);
writeln("c = ",c);

var u: [1..Nx] real;
var x: [1..Nx] real;

var xMin = -1.0;
x[1] = xMin;
for i in 2..Nx do
  x[i] = xMin + (i-1)*dx;

u[1..Nx] = 1.0;
u[((0.5/dx): int)..((1/dx + 1): int)] = 2.0;

var un: [1..Nx] real;

for n in 1..nt do  {
  un = u; 
  for i in 2..(Nx-1) do {
    u[i] = un[i] - c*dt/dx*(un[i] - un[i-1]);
  }
}


