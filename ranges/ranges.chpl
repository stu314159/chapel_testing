config var n = 10;

var RD: domain(3) = {1..n,1..n,1..n};
writeln(RD);

// expand the domain by one in each dimension
var RDbigger = RD.expand((1,1,1));
writeln(RDbigger);

var RDsmaller = RD.expand((-1,-1,-1));
writeln(RDsmaller);

var RDext_p = RD.exterior((1,1,1));
writeln(RDext_p);

var RDext_n = RD.exterior((-1,-1,-1));
writeln(RDext_n);
