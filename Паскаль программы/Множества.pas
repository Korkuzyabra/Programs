const n=10;
var c,d: set of byte;
    a,b:array [1..n] of integer;
    i: integer;
begin
  for i:=1 to n do begin;
                     a[i]:=random(50)+1;
                     if a[i] in c then d+=[a[i]]
                                  else c+=[a[i]];
                   end;
  for i:=1 to n do begin;
                     b[i]:=random(50)+1;
                     if b[i] in c then d+=[b[i]]
                                  else c+=[b[i]];
                   end;
  c-=d;
  writeln('Первая последовательность ');
  writeln(a);
  writeln('Вторая последовательность ');
  writeln(b);
  writeln('Конечное множество ');
  writeln(c);
  writeln('Удалённые элементы ');
  writeln(d);
end.