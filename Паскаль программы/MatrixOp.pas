//Модуль содержит набор инструментов для работы с матрицами
{MaxMatrixSize - максимальный размер матрицы
Matrix - тип данных, двумерный массив с максимальным размером 
procedure InitZeroMatrix (var A:matrix) - процедура матрицы инцилизации нулевой A
procedure InitRandonmMatrix (var A:matrix; M,N:integer; Range:integer) - процедура
заполнения матрицы случайными числами:
M,N - используемый диапозон индексов: [1..M, 1..N],
Range - диапозон случайного числа, если Range=0, то генерируется вещественное
число от 0 до 1, иначе целое число от 0 до Range
procedure PrintMatrix(A:matrix; M,N,All,Part:integer) - процедура распечатки матрицы А:
M,N - диапазон выводимый на печать: [1..M, 1..N],
All,Part - форма вывода элемента: A[i,j]:All:Part
procedure AddMatrix (A,B:matrix; M,N:integer; var C: matrix) - процедура сложения матриц С=А+В
M,N - использование диапозона идексов: [1..M, 1..N]}

Unit MatrixOp;
Interface
const MaxMatrixSize=10;
type Matrix=array [1..MaxMatrixSize, 1..MaxMatrixSize] of real;
procedure InitZeroMatrix(var A:matrix);
procedure InitRandomMatrix(var A:matrix; M,N,Range:integer);
procedure PrintMatrix(A:matrix; M,N,All,Part:integer);
procedure AddMatrix(A,B:matrix; M,N:integer; var C:matrix);
Implementation
procedure InitZeroMatrix;
begin
  for var i:=1 to MaxMatrixSize do
    for var j:=1 to MaxMatrixSize do A[i,j]:=0;
end;
procedure InitRandomMatrix;
begin
  if Range=0 then for var i:=1 to MaxMatrixSize do
                    for var j:=1 to MaxMatrixSize do A[i,j]:=Random
             else for var i:=1 to MaxMatrixSize do
                    for var j:=1 to MaxMatrixSize do A[i,j]:=Random(Range);
end;
procedure PrintMatrix;
begin
  for var I:=1 to M do begin
                         for var j:=1 to N do write(A[i,j]:All:Part, '  ');
                         writeln;
                       end;
  writeln;
end;
procedure AddMatrix;
begin
  for var i:=1 to M do
    for var j:=1 to N do C[i,j]:=A[i,j]+B[i,j];
end;
begin 
  writeln('*** Подключём модуль работы с матрицами ***');
end.