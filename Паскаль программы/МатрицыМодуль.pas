uses MatrixOp;
var A,B,C:matrix;
    i,j,m,n:integer;
begin
  Randomize;
  write('Input matrix size M,N:');
  readln(M,N);
  InitRandomMatrix(A,M,N,0);
  InitRandomMatrix(B,M,N,0);
  InitZeroMatrix(C);
  AddMatrix(A,B,M,N,C);
  writeln('Результат:');
  PrintMatrix(A,M,N,5,2);
  PrintMatrix(B,M,N,5,2);
  PrintMatrix(C,M,N,5,2);
end.