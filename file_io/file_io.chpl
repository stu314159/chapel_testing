config var n=9, filename="Arr.dat";

config const num = 128*1024;
config const example = 0;
config const testfile = "test.bin";
config const epsilon = 10e-13;

use IO;

if example == 0 || example == 1{

  // create a domain of the specified problem size
  const ADom = {1..n,1..n};

  // create and initialize an array of the specified size
  var A: [ADom] real = [(i,j) in ADom] i+j/10.0;

  // write the problem size and array out to the specified filename.
  writeSquareArray(n,A,filename);

  // read an array in from the specified filename, storing in a new variable B.
  var B = readArray(filename);

  // print out B as a debugging step.
  writeln("B is:\n",B);

  // verify that the values in A and B are within tolerance
  const numErrors = + reduce [i in ADom] (abs(A(i) - B(i)) > epsilon);

  if (numErrors > 0) {
    writeln("FAILURE");
  } else {
    writeln("SUCCESS");
  }
}

proc writeSquareArray(n,X,filename) {

  var outfile = open(filename,iomode.cw);
  var writer = outfile.writer();

  // write the problem size in each dimension of the file
  writer.writeln(n," ",n);
  //write out the array itself.
  writer.write(X);

  // close the file
  writer.close();
  outfile.close();
}

proc readArray(filename) {
  
  var infile = open(filename, iomode.r);
  var reader = infile.reader();

  var m = reader.read(int), n = reader.read(int);

  var X: [1..m,1..n] real;

  reader.read(X);

  reader.close();
  infile.close();

  return X;

}

