program kr2_2;
var x, a, a0, an: real;
    n: integer;
begin
  writeln('Введите x');
  readln(x);
  writeln('Введите a');
  readln(a);
  repeat
    writeln('Введите положительное n');
    readln(n);
  until n>0;
  a0:=sqr(x+a);
  n:=n-1;
  while n>0 do begin
                an:=sqr(a0+a);
                n:=n-1;
               end;
  writeln('n-ая скобка равна', a0+a);
end.