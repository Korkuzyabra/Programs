program kr2_3;
var e, x, a0, an, sum: real;
    n:integer;
begin
  repeat
    writeln('Введите заданную точность 0<e<<1');
    readln(e);
  until (e>0) and (e<1);
  writeln('Введите x');
  readln(x);
  sum:=0;
  a0:=1;
  n:=1;
  repeat
    sum:=a0+sum;
    a0:=(a0*x)/(n+1);
    n:=n+1;
  until abs(a0)<=e;
  writeln('Сумма равна ', sum);
end.