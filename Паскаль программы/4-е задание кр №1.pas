program kr;
var a, x, d:real;
    y:integer;
begin
  repeat
  write ('Введите значения a, x, y ');
  readln (a, x, y);
  until (x<>0) and ((x-3*a+y)<>0);
  d:=power((x+3*a+y)/(2*x),4)-(x/(x-3*a+y));
  write ('Результат ', d);
end.