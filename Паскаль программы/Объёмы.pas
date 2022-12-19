uses Sharp;
var r,r1,h,rk,hk:real;
begin
  writeln ('Введите радиус шара');
  readln(r);
  writeln ('Введите высоту шара');
  readln(h);
  writeln('Введите радиус второго основания шара');
  readln(r1);
  writeln ('Введите радиус конуса');
  readln(rk);
  writeln ('Введите высоту конуса');
  readln(hk);
  Shar(r);
  SharSig(r,h);
  SharSlo(r,r1,h);
  Konus(rk,hk);
end.
