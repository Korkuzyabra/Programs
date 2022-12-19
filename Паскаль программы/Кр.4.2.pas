var mn:set of byte;
    n,i:integer;
procedure delete(var d : Set of byte);
var i:integer;
begin
  foreach i in d do if Not Odd(i) then d-=[i];
end;
begin
  mn:=[];
  writeln('Введите мощность множества:');
  readln(n);
  for i:=1 to n do mn+=[Random(1,50)];
  writeln('Изначальное множество:');
  writeln(mn);
  delete(mn);
  writeln('Множество без чётных чисел:');
  writeln(mn);
end.